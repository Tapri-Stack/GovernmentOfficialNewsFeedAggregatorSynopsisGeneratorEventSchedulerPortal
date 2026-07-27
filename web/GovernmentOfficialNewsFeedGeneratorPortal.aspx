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
        <header class="header">
            <img src="assets/bescom.png" height="200" />
            <h1>Government Official News Feed Aggregator Synopsis Generator Event Scheduler Portal</h1>
            <img src="assets/toi.png" height="200" />
        </header>
        <marquee loop="-1">
            Government Official News Feed Aggregator Synopsis Generator Event Scheduler Portal
            • <q>Thank you for visiting the official government newsletter (as per BESCOM) (AND I CAN GIVE THAT IN WRITING) (cause I'm the MD and allat) (lowkey no flex... unless...)</q> <cite>~ Dr. N Shivashankara (MD BESCOM)</cite>
            • <q>Shit dude that's all you had to say. I'll snort to that</q> <cite>~ Jaideep Bose (Managing Editor for the Times of India) [on being a sellout]</cite>
            • <q>I've sucked on that Gujarati knob more times than I can count (if y'know what I mean) [*wink]</q> <cite>~ Jaideep Bose (Managing Editor for the Times of India) [on his story of success]</cite>
            • <q>We are all making big moves, but bigger yet is the dark patterns that Jaideep has been implanting in all of TOI pages. Bravo!</q> <cite>~ Dr. N Shivashankara (MD BESCOM) [BESCOM Q4-2026 Financial Report]</cite>
            • <q>I'm something of a Joestar myself. STRIKE POSE!!</q> <cite>~ Jaideep "Jojo" Bose (Managing Editor for the Times of India) [on allegations of being heir of Joestar fortune]</cite>
        </marquee>
        <main>
            <form ID="form" runat="server">
                <asp:ScriptManager ID="ScriptManager" runat="server" EnablePartialRendering="true" EnableScriptGlobalization="false" EnableScriptLocalization="false" EnablePageMethods="true" />

                <asp:Button ID="btnImpulse" runat="server" OnClick="btnImpulse_Click" style="display: none" />

                <asp:UpdatePanel ID="upnlPage" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                    <ContentTemplate>
                        <asp:Button ID="btnAction" class="primary" runat="server" Text="Generate Today's Official Government Newsletter" OnClick="btnAction_Click" />

                        <dialog ID="dlgAwaiter" runat="server">
                            <header>
                                <h2>Please Wait</h2>
                                <asp:Button ID="btnClose" class="primary" runat="server" Text="×" OnClick="btnClose_Click" />
                            </header>
                            <section>
                                <p>Your newsletter for <b><asp:Label ID="lblToday" runat="server" Text="{DDDD}, {MMMM} {DD}, {YYYY}" /></b> is being prepared. Kindly wait on this page...</p>
                                <p><b>DO NOT</b> press any button</p>
                                <asp:UpdatePanel ID="upnlModal" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                    <ContentTemplate>
                                        <code id="lblElapsed" runat="server">--:--</code>
                                        <asp:Button ID="btnDownload" class="primary" runat="server" Text="Download" OnClick="btnDownload_Click" />
                                        <asp:Timer ID="tmrElapsed" runat="server" Interval="1000" Enabled="False" OnTick="tmrElapsed_Tick" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btnDownload" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </section>
                        </dialog>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAction" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnClose" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </form>
        </main>
    </body>
</html>
