using System;
using System.Diagnostics;
using System.Json;
using System.Text;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace GovernmentOfficialNewsFeedAggregatorSynopsisGeneratorEventSchedulerPortal
{
    public class GovernmentOfficialNewsFeedGeneratorEventScheduler
    {
        private static string OWNER = "Tapri-Stack";
        private static string REPO = "GovernmentOfficialNewsFeedAggregatorSynopsisGeneratorEventSchedulerPortal";
        private static string GENERATOR_WORKFLOW_ID = "GovernmentOfficialEpaperGenerationWorkflow.yml"; 

        private static HttpClient GetClient() {
            HttpClient client = new HttpClient();

            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/vnd.github+json"));
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue(
                "Bearer",
                Environment.GetEnvironmentVariable("GOVERNMENT_OFFICIAL_NEWS_FEED_GENERATOR_ACTIVATION_USER_KEY")
            );
            client.DefaultRequestHeaders.Add("X-GitHub-Api-Version", "2026-03-10");
            client.DefaultRequestHeaders.UserAgent.ParseAdd("GovernmentOfficialNewsFeedGeneratorPortal");

            return client;
        }

        public static long ScheduleNewsFeedGeneration() {
            using (HttpClient client = GetClient())
            {
                string url = $"https://api.github.com/repos/{OWNER}/{REPO}/actions/workflows/{GENERATOR_WORKFLOW_ID}/dispatches";

                string jsonPayload = "{ \"ref\": \"main\", \"inputs\": {}, \"return_run_details\": true }";
                var content = new StringContent(jsonPayload, Encoding.UTF8, "application/json");

                HttpResponseMessage response = client.PostAsync(url, content).ConfigureAwait(false)
                    .GetAwaiter()
                    .GetResult();

                response.EnsureSuccessStatusCode();
                
                string responseBody = response.Content.ReadAsStringAsync().ConfigureAwait(false)
                    .GetAwaiter()
                    .GetResult();

                JsonValue jsonObject = JsonValue.Parse(responseBody);
                return jsonObject["workflow_run_id"];
            }
        }

        public static string GetNewsFeedLink(long runId) {
            using (HttpClient client = GetClient())
            {
                string url = $"https://api.github.com/repos/{OWNER}/{REPO}/actions/runs/{runId}/artifacts";

                HttpResponseMessage response = client.GetAsync(url).ConfigureAwait(false)
                    .GetAwaiter()
                    .GetResult();

                response.EnsureSuccessStatusCode();
                
                string responseBody = response.Content.ReadAsStringAsync().ConfigureAwait(false)
                    .GetAwaiter()
                    .GetResult();

                JsonValue jsonObject = JsonValue.Parse(responseBody);
                long artifactId = (long)jsonObject["artifacts"][0]["id"];

                string artifactUrl = $"https://github.com/{OWNER}/{REPO}/actions/runs/{runId}/artifacts/{artifactId}";
                string releaseUrl = $"https://release.tapri.dev/?download_url={artifactUrl}";

                return releaseUrl;
            }
        }
    }

    public partial class GovernmentOfficialNewsFeedGeneratorPortal : Page
    {
        private int threshold = int.Parse(Environment.GetEnvironmentVariable("GOVERNMENT_OFFICIAL_NEWS_FEED_GENERATOR_BOOTH_QUEUE_WAIT_TIME"));
        protected Label lblToday;
        protected HtmlGenericControl lblElapsed;
        protected HtmlGenericControl dlgAwaiter;
        protected Button btnAction;
        protected Button btnDownload;
        protected Timer tmrElapsed;

        private void StartTimer()
        {
            Session["StartedAt"] = DateTime.UtcNow;
            tmrElapsed.Enabled = true;
        }
        private void StopTimer(bool reset)
        {
            tmrElapsed.Enabled = false;
            if (reset)
            {
                Session["StartedAt"] = DateTime.UtcNow;
            }
        }
        private void ResetModal()
        {
            this.StopTimer(true);
            lblElapsed.InnerText = "--:--";
            lblElapsed.Style["display"] = "block";
            btnDownload.Style["display"] = "none";
        }

        private void ShowModal() => ScriptManager.RegisterStartupScript(this, GetType(), "openDialog", $"document.getElementById('{dlgAwaiter.ClientID}').showModal();", true);
        private void HideModal() => ScriptManager.RegisterStartupScript(this, GetType(), "closeDialog", $"document.getElementById('{dlgAwaiter.ClientID}').close();", true);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // WONTFIX: This bug is completely intentional. Exercise for those snooping.
                lblToday.Text = DateTime.Today.ToString("D");
                this.ResetModal();
            }
        }

        protected void tmrElapsed_Tick(object sender, EventArgs e)
        {
            if (!(Session["StartedAt"] is DateTime startedAt))
            {
                Response.Redirect("~/403.aspx");
                this.StopTimer(true);
                return;
            }

            var elapsed = DateTime.UtcNow - startedAt;

            lblElapsed.InnerText = string.Format("{0:00}:{1:00}", (int)elapsed.TotalMinutes, elapsed.Seconds);

            if (elapsed.TotalSeconds > threshold)
            {
                this.StopTimer(false);

                try
                {
                    Session["ReleaseLink"] = GovernmentOfficialNewsFeedGeneratorEventScheduler.GetNewsFeedLink((long)Session["WorkflowRunId"]);
                }
                catch (Exception)
                {
                    Response.Redirect("~/500.aspx");
                }

                lblElapsed.Style["display"] = "none";
                btnDownload.Style["display"] = "block";
            }
        }

        protected void btnAction_Click(object sender, EventArgs e)
        {
            this.StartTimer();

            try
            {
                Session["WorkflowRunId"] = GovernmentOfficialNewsFeedGeneratorEventScheduler.ScheduleNewsFeedGeneration();
            }
            catch (Exception)
            {
                Response.Redirect("~/500.aspx");
            }

            this.ShowModal();
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            if (Session["ReleaseLink"] is string releaseLink)
            {
                Response.Redirect(releaseLink);
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            this.HideModal();
            this.ResetModal();
        }
    }
}