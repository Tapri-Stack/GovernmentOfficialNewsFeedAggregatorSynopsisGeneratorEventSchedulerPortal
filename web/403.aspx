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
        <h1>Forbidden (403) — Access is Denied</h1>
        <hr />
        <h2><i>An attempt of a terrorist to infiltrate the Government was successfully stopped. Context Window (ctx!pnlAlert#SgnlToken)</i></h2>
        <p><b>Recommendation:</b> Please take the following steps to make sure that you are in fact an Indian Citizen and not a Terrorist.</p>
        <div class="piss recommendation">
            <ul>
                <li>Produce your Aadhar Card, along with a self-attested photocopy to your nearest SBI branch<b>*</b></li>
                <li>Invite a Sarkari Babu to your home to perform eKYC.<b>**#</b></li>
                <li>Renew your passport and make sure to only process it through third-party means as that brings in a ton of money for the Government (Yummy)</li>
            </ul>
            <p class="fineprint">
                <b>*</b> Please check if the SBI branch is open by visiting and knocking twice on the closed shutter.<br />
                <b>**</b> Please be mindful when offering bribes. A bribe given with hospitality goes a long way.<br />
                <b>#</b> Please have chana dal and Kachori at the ready and serve it in a plate made of ₹500 note. Failure to produce it on command will result in exile from the Indian Subcontinent.<br />
            </p>
        </div>

        <details>
            <summary>Error Stack:</summary>
            <pre class="piss">
System.Web.HttpException (0x80004005):
    Access to the requested resource was denied because
    the request exhibited insufficient patriotic enthusiasm.

 ---> Government.Security.NationalIntegrityException:
      User failed automated "MeraDesh" verification.

      Confidence Score : 49.97%
      Required Score   : 100-{PRIV_SCORE}%

      at Government.Security.CitizenshipFirewall.Validate()
      at Government.Security.TerroristDetector.IsOkayV2()

 ---> System.Security.SecurityException:
      Suspicious activity detected.

      Triggered Rule(s):
        System.IO.FileException: Cannot read file.

      at Government.Security.BehaviouralAnalysis.Analyse()
      at Government.Security.InduceVirtueSignalPanic()

 ---> Government.Identity.eKYCException:
      Aadhaar verification failed.

      Failure Reason:
        File not found.\nFile under review.\nFile not allowed.

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
    Client IP         : Blacklisted successfully
    Correlation ID    : GOV-INTERNAL-DO-NOT-SHARE-PKSK11213KLZ5MMTR
    Reference Number  : {ReferenceNumberStringFactoryReturnValue}-DENIED-{Reason}

Reference Number:
    GOV-403-DENIED-8675309
            </pre> 
        </details>
    </body>
</html>
