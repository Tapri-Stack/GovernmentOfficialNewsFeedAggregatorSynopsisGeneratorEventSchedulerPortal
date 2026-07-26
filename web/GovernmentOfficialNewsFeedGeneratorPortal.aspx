<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GovernmentOfficialNewsFeedAggregatorSynopsisGeneratorEventSchedulerPortal.GovernmentOfficialNewsFeedGeneratorPortal" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Government Official News Feed Aggregator Synopsis Generator Event Scheduler Portal</title>
        <link rel="apple-touch-icon" sizes="180x180" href="assets/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="assets/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="assets/favicon-16x16.png">
        <link rel="manifest" href="assets/site.webmanifest">
        <link rel="stylesheet" href="stylesheets/style.css">
    </head>
    <body>
        <script>
            function startElapsedTimer(startedAtIso, threshold) {
                startedAt = new Date(startedAtIso)
                lblElapsed = document.getElementById("lblElapsed")
                btnDownload = document.getElementById("<%= btnDownload.ClientID %>")

                const intervalId = setInterval(() => {
                    const elapsed = Date.now() - startedAt

                    var totalSeconds = Math.floor((Date.now() - startedAt.getTime()) / 1000);
                    var minutes = Math.floor(totalSeconds / 60);
                    var seconds = totalSeconds % 60;

                    const text = String(minutes).padStart(2, "0") + ":" + String(seconds).padStart(2, "0")
                    lblElapsed.textContent = text

                    if (totalSeconds > threshold) {
                        btnDownload.style.display = "block"
                        lblElapsed.style.display = "none"

                        // TODO: Set onClick for btnDownload to open the link

                        clearInterval(intervalId)
                    }
                }, 200)
            }
        </script>

        <header class="header">
            <img src="assets/bescom.png" height="200" />
            <h1>Government Official News Feed Aggregator Synopsis Generator Event Scheduler Portal</h1>
            <img src="assets/toi.png" height="200" />
        </header>
        <marquee loop="-1">
            Government Official News Feed Aggregator Synopsis Generator Event Scheduler Portal
            • "Thank you for visiting the official government newsletter (as per BESCOM) (AND I CAN GIVE THAT IN WRITING) (cause I'm the MD and allat) (lowkey no flex... unless...)" <cite>~ Dr. N Shivashankara (MD BESCOM)</cite>
            • "Shit dude that's all you had to say. I'll snort to that" <cite>~ Jaideep Bose (Managing Editor for the Times of India) [on being a sellout]</cite>
            • "I've sucked on that Gujarati knob more times than I can count (if y'know what I mean) [*wink]" <cite>~ Jaideep Bose (Managing Editor for the Times of India) [on his story of success]</cite>
            • "We are all making big moves, but bigger yet is the dark patterns that Jaideep has been implanting in all of TOI pages. Bravo!" <cite>~ Dr. N Shivashankara (MD BESCOM) [BESCOM Q4-2026 Financial Report]</cite>
            • "I'm something of a Joestar myself. STRIKE POSE!!" <cite>~ Jaideep "Jojo" Bose (Managing Editor for the Times of India) [on allegations of being heir of Joestar fortune]</cite>
        </marquee>
        <main>
            <form ID="form" runat="server">
                <asp:Button ID="btnAction" class="primary" runat="server" Text="Generate Today's Official Government Newsletter" OnClick="btnAction_Click" />

                <dialog ID="dlgAwaiter" runat="server">
                    <header>
                        <h2>Please Wait</h2>
                        <asp:Button ID="btnClose" class="primary" runat="server" Text="×" OnClick="btnClose_Click" />
                    </header>
                    <section>
                        <p>Your newsletter for <b><asp:Label ID="lblToday" runat="server" Text="{DDDD}, {MMMM} {DD}, {YYYY}" /></b> is being prepared. Kindly wait on this page...</p>
                        <quote><b>DO NOT</b> press any button</quote>
                        <code id="lblElapsed" runat="server">--:--</code>
                        <asp:Button ID="btnDownload" class="primary" runat="server" Text="Download" OnClick="btnDownload_Click" />
                    </section>
                </dialog>
            </form>
        </main>
    </body>
</html>
