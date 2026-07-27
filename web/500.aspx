<%@ Page Language="C#" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Government Official News Feed Aggregator Synopsis Generator Event Scheduler Portal</title>
        <link rel="apple-touch-icon" sizes="180x180" href="assets/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="assets/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="assets/favicon-16x16.png">
        <link rel="manifest" href="assets/site.webmanifest">
        <link rel="stylesheet" href="stylesheets/error.css">
    </head>
    <body>
        <h1>Server Error in '/' for Government Official News Feed Aggregator Synopsis Generator Event Scheduler Portal</h1>
        <hr />
        <h2><i>A potentially dangerous anti-national element was detected coming from the Client (ct!00$MainContent$txtVar)</i></h2>
        <p><b>Alert:</b> This is not Government liability. Any attempt at indicating that the prior is at fault is punishable by death or a fine of upto ₹5000 under the Hon'able Supreme Court of India.</p>
        <p><b>Recommendation:</b> To make sure that the citizens of this nation are safe from such attacks, please make sure to ensure your safety with the following steps.</p>
        <div class="piss recommendation">
            <ul>
                <li>Please submit a printed, attested, scanned, photo-copy of your 10th and 12th Grade Mark-sheet at the nearest Aadhar card production factory.*</li>
                <li>Please do not staple the ₹500 notes (multiple) on the photo-copy as money is God and God doesn't like being stapled.</li>
                <li>Consider investing in Government Ventures like Reliance (RELIANCE) and Adani Ports (ADANIPORTS) to ensure that you're making your future brighter.**</li>
            </ul>
            <p class="fineprint">
                <b>*</b> 10th Marksheet must be renewed every 5 years under a small fee of ₹20 (₹11980 after tax). Further information is available on {website_not_ready_yet}<br />
                <b>**</b> Recommendations on a 403 page are subject to market risks. Please read all the documents carefully before applying.<br />
            </p>
        </div>

        <details>
            <summary>Error Stack:</summary>
            <pre class="piss">
System.Web.HttpUnhandledException (0x80004005):
    A potentially dangerous anti-national element was detected coming from the Client
    (ctl00$MainContent$txtVar).

---> System.Security.BharatException: User exhibited suspicious levels of curiosity.
    at Government.Portal.Security.PatriotismFilter.ValidateRequest(HttpContext context)
    at Government.Portal.Security.PatriotismFilter.AssertNationalInterest()
    at Government.Portal.Events.EventScheduler.ScheduleNew()
    at Government.Portal.Common.WaitBufferQueueForwarder()

---> System.Data.SqlClient.SqlException (0x80131904):
    SELECT * FROM Citizens
    WHERE Opinion = 'Approved'

    Returned 0 rows.

    at Government.Portal.CitizenRegistry.ValidateCitizen()
    at Government.Portal.Home.Index()

---> MinistryOfEfficiency.DepartmentNotFoundException:
    The requested department has been merged, renamed,
    dissolved, re-established, privatized and archived.

    at Government.Directory.ResolveDepartment()
    at Government.Directory.ForwardToConcernedAuthority()
    at Government.Directory.ForwardToConcernedAuthority()
    at Government.Directory.ForwardToConcernedAuthority()
    at Government.Directory.ForwardToConcernedAuthority()

--- End of inner exception stack trace ---

Server Information:
    Framework Version : ASP.NET 4.0.30319
    CLR Version       : 4.0.30319
    IIS Version       : 10.0
    Build             : RC-1.1

Request Information:
    URL               : /GovernmentOfficialNewsFeedGeneratorPortal.aspx
    HTTP Method       : GET
    User Agent        : Mozilla/5.0
    Correlation ID    : GOV-INTERNAL-DO-NOT-SHARE-PKSK11213KLZ5MMTR
    Reference Number  : {ReferenceNumberStringFactoryReturnValue}
            </pre>
        </details>
    </body>
</html>
