using System;
using System.Diagnostics;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace GovernmentOfficialNewsFeedAggregatorSynopsisGeneratorEventSchedulerPortal
{
    public partial class GovernmentOfficialNewsFeedGeneratorPortal : Page
    {
        private int threshold = 60;
        protected Label lblToday;
        protected HtmlGenericControl lblElapsed;
        protected HtmlGenericControl dlgAwaiter;
        protected Button btnAction;
        protected Button btnDownload;
        public DateTime StartedAt { get; private set; }
        public int Threshold => threshold;

        private void Reset()
        {
            lblElapsed.InnerText = "--:--";
            lblElapsed.Style["display"] = "block";
            btnDownload.Style["display"] = "none";
        }

        private void ShowModal() => this.ClientScript.RegisterStartupScript(GetType(), "openDialog", $"document.getElementById('{dlgAwaiter.ClientID}').showModal();", true);
        private void HideModal() => this.ClientScript.RegisterStartupScript(GetType(), "closeDialog", $"document.getElementById('{dlgAwaiter.ClientID}').close();", true);
        private void StartTimer() => this.ClientScript.RegisterStartupScript(GetType(), "startTimer", $"startElapsedTimer('{StartedAt:o}', {Threshold});", true);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // WONTFIX: This bug is completely intentional. Exercise for those snooping.
                lblToday.Text = DateTime.Today.ToString("D");
                this.Reset();
            }
        }

        protected void btnAction_Click(object sender, EventArgs e)
        {
            StartedAt = DateTime.UtcNow;

            // TODO: Make API Call
            // TODO (Stretch): Get threshold update
            this.ShowModal();
            this.StartTimer();

            // TODO: Update download URL
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            this.HideModal();
            this.Reset();
        }
    }
}