<!DOCTYPE html>
<html>
    <head>
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
            • "Thank you for visiting the official newsletter (as per BESCOM) (AND I CAN GIVE THAT IN WRITING) (cause I'm the MD and allat) (lowkey no flex... unless...)" <cite>~ Dr. N Shivashankara (MD BESCOM)</cite>
            • "Shit dude that's all you had to say. I'll snort to that" <cite>~ Jaideep Bose (Managing Editor for the Times of India) [on being a sellout]</cite>
            • "I've sucked on that Gujarati knob more times than I can count (if y'know what I mean) [*wink]" <cite>~ Jaideep Bose (Managing Editor for the Times of India) [on his story of success]</cite>
            • "We are all making big moves, but bigger yet is the dark patterns that Jaideep has been implanting in all of TOI pages. Bravo!" <cite>~ Dr. N Shivashankara (MD BESCOM) [BESCOM Q4-2026 Financial Report]</cite>
            • "I'm something of a Joestar myself. STRIKE POSE!!" <cite>~ Jaideep "Jojo" Bose (Managing Editor for the Times of India) [on allegations of being heir of Joestar fortune]</cite>
        </marquee>
        <main>
            <button id="action" class="primary">Generate Today's Official Government Newsletter</button>

            <dialog>
                <header>
                    <h2>Please Wait</h2>
                    <button id="close" class="primary">×</button>
                </header>
                <section>
                    <p>Your newsletter for <b><span id="today">{DDDD}, {MMMM} {DD}, {YYYY}</span></b> is being prepared. Kindly wait on this page...</p>
                    <quote><b>DO NOT</b> press any button</quote>
                    <code id="stopwatch">--:--</code>
                    <button id="download" class="primary">Download</button>
                </section>
            </dialog>
        </main>
    </body>

    <script>
        const padSegment = (num) => String(num).padStart(2, "0")
        const formatTime = (ms) => {
            const ts = Math.floor(ms / 1000);
            const min = Math.floor(ts / 60) % 60;
            const s = ts % 60;
            return `${padSegment(min)}:${padSegment(s)}`
        }

        let startTimestamp = undefined
        const today = document.getElementById("today")
        const dialog = document.querySelector("dialog")
        const actionBtn = document.getElementById("action")
        const closeBtn = document.getElementById("close")
        const stopwatch = document.getElementById("stopwatch")
        const dloadBtn = document.getElementById("download")

        today.textContent = new Intl.DateTimeFormat("en-US", { 
            year: "numeric", 
            month: "long", 
            day: "numeric",
            weekday: "long" 
        }).format(new Date())

        // TODO: Add key listener to send to forbidden page if any key is pressed or focus is lost from webpage during the stopwatch

        actionBtn.addEventListener("click", () => {
            dloadBtn.style.display = "none"
            stopwatch.style.display = "block"

            // TODO: Make API call and store the result
            const threshold = 10000

            startTimestamp = Date.now()

            const intervalId = setInterval(() => {
                const elapsed = Date.now() - startTimestamp
                const text = formatTime(elapsed)
                stopwatch.textContent = text

                if (elapsed > threshold) {
                    dloadBtn.style.display = "block"
                    stopwatch.style.display = "none"

                    // TODO: Set onClick for dloadBtn to open the link
 
                    clearInterval(intervalId)
                }
            }, 200)

            dialog.showModal()
        })
        closeBtn.addEventListener("click", () => dialog.close())
    </script>
</html>