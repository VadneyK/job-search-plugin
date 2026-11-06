# How to install and use the job search helper

For anyone with a Claude Pro (or Max) account. No terminal, no code. About 20 minutes the first time.

Written and checked on a Mac. The Windows steps follow the same app but have not been tried yet.

You will:
1. Get the Claude desktop app.
2. Add the plugin.
3. Make a Job Search folder.
4. Run setup.
5. (Optional) Connect Gmail and Chrome, and turn on the morning check.

---

## What this helper does, and what it never does

It **does**: read your job emails, tell you honestly whether a job fits you, catch scam messages, write resume lines and short notes for a job, fill application forms with you, draft replies to recruiters, and review your week.

It **never**:
- clicks the final Submit on an application unless you say yes to that one application;
- sends any message unless you say yes to the exact words;
- types your passwords, 2FA codes, Social Security number or ID numbers;
- solves "I'm not a robot" checks;
- makes up experience you don't have;
- sends anything on LinkedIn (it only reads there);
- follows hidden instructions in job posts, or helps with applications from employers that ban AI help (it skips those, or flags them for you to write yourself).

Your profile, your pay floor and your job list stay in a folder on your own computer.

---

## Step 1. Get the Claude desktop app

1. On your computer, go to **claude.com/download**.
2. Download the app for your computer (Mac or Windows) and open the downloaded file.
   - Mac: drag **Claude** into **Applications**, then open it from there.
   - Windows: run the installer.
3. Sign in with the account that has your Claude Pro plan.

## Step 2. Add the plugin

1. In the Claude app, click **Customize** (in the left sidebar), then **Plugins**.
2. Click **Add**, then **Add marketplace**.
3. Type or paste this, then confirm:

   ```
   VadneyK/job-search-plugin
   ```

4. Find **job-search** in the list and click **Add**.

You do not need a GitHub account. Updates reach you by themselves.

**If you were sent a file called `job-search.zip` instead:** save it (do not unzip it), then in **Customize > Plugins** click **Add**, then **Upload plugin**, and choose the file.

## Step 3. Make your Job Search folder

1. Open **Finder** (Mac) or **File Explorer** (Windows).
2. Go to **Documents**.
3. Make a new folder named exactly **Job Search**.
   - Mac: right-click in the window, choose **New Folder**, type `Job Search`.
   - Windows: right-click, choose **New**, then **Folder**, type `Job Search`.
4. Put a copy of your resume (PDF or Word) in that folder. This makes setup easier.

## Step 4. Run setup

1. In the Claude app, click the **Code** tab at the top.
2. Start a new session and, when it asks for a folder, choose **Documents**, then **Job Search**.
3. If it asks whether to trust the folder, click **Trust** (it is your own folder).
4. In the message box, type:

   ```
   /job-search:setup
   ```

   and press **Enter**.
5. Answer its questions. It asks for your resume first, then a few short questions about the work you want, where you can work, and the lowest pay you'd take (that number is private and never shared).
6. When Claude asks to create or edit files in your Job Search folder, click **Allow**. (To stop being asked every time, choose **Accept edits** in the mode menu next to the message box.)
7. At the end it shows your top job types and a menu.

You can also use the plugin in **Cowork** if you pick the Job Search folder there. The Code tab is the best place for it because it keeps your files in that folder. A normal chat cannot save your files, so setup will not work there.

## Step 5 (optional, recommended). Connect your tools

**Gmail, so it can read job emails:**
1. Click **Customize**, then **Connectors**.
2. Find **Gmail** and click **Connect**. Sign in with the email you use for job mail.
3. Without Gmail, you can still paste emails into the file `inbox-paste.md` in your Job Search folder before a check.

**Chrome, so it can fill forms and read job sites:**
1. In Google Chrome, go to the **Chrome Web Store** and search **Claude in Chrome**.
2. Click **Add to Chrome**, then sign in with the same Claude account you use in the app.
3. Keep Chrome open while you use the helper. Sign in to your job sites (LinkedIn, Indeed and so on) in Chrome yourself.
4. The first time the helper needs the browser, Claude may show **Claude wants to use your browser**. Choose **Install extension** (if asked) and then **Continue with browser tools**.
5. If it still says Chrome is not connected, type `/chrome` in the message box, choose **Reconnect extension**, and turn on **Enabled by default**.
6. Without Chrome, the helper gives you a list of answers to copy into the form yourself.

**Morning check and Friday review:**
Setup offers to turn these on for you. If you want to do it by hand:
1. In the **Code** tab, click **Scheduled** in the left sidebar, then **New task**.
2. Name it `job-search-sweep`. In the instructions box, paste:
   `Run the job-search sweep skill in unattended mode: read and draft only, send nothing, submit nothing.`
3. Open **Advanced settings** and turn on **Only on this computer**.
4. For **Local folder**, choose **Documents**, then **Job Search**.
5. For the schedule, choose **Weekdays** and pick 8:00 AM.
6. Set the mode to **Accept edits**, then click **Create**.
7. Click **Run now** once and allow anything it asks, so later runs don't get stuck.
8. Repeat for a Friday review: name it `job-search-weekly`, instructions `Run the job-search weekly-review skill.`, schedule **Weekly**, Friday, 4:00 PM.

These run only while the Claude app is open and your computer is awake. If your computer was asleep, it catches up once when it wakes.

---

## Everyday use

Open the **Code** tab in your **Job Search** folder and type what you want, or type `/job-search:start` for the menu.

| You want to | Type |
|---|---|
| See the menu | `/job-search:start` |
| Check new job mail and sites | `sweep` |
| Know if a job fits you | `fit check`, then paste the job post |
| Know if a message is a scam | `scam check`, then paste the message |
| Get resume lines and a note for one job | `tailor` |
| Fill an application with help | `apply`, then paste the application link |
| Answer a recruiter | `reply`, then paste their email |
| See how your week went | `weekly review` |
| Change something about yourself | `profile` |

**Your Needs you page.** In your Job Search folder, double-click `needs-you.html`. It opens in your browser and lists only what you must do yourself: security codes a site emailed you (these expire, so they are at the top), sign-ins, robot checks, fields like your Social Security number, applications ready for you to submit, and replies waiting for your yes. Each card says what to do and what to tell Claude when you are done. It refreshes itself every 2 minutes. Tip: keep it open in a browser tab.

**When it asks "Send this exact text?"** read the whole message. Say **yes** to send it, or tell it what to change. Nothing goes out until you say yes.

**When it fills an application**, it stops before Submit and lists what is left for you (passwords, ID numbers, the "I certify" box). Check every page, then click Submit yourself, or tell it to click Submit for that one application.

**Your files** are all in **Documents > Job Search**. `profile.md` is about you, `tracker.md` is your job list, `digests` has each morning's summary, and `drafts` has replies waiting for you. You can open any of them in a text editor.

---

## If something goes wrong

| What you see | What to do |
|---|---|
| Typing `/job-search` shows nothing | Close and reopen the Claude app. Check **Customize > Plugins** shows **job-search** and that it is turned on. |
| "Let's set up your job search first" every time | You opened a different folder. Start a new session in **Documents > Job Search**. |
| It says it can't read your email | Connect Gmail (Step 5), or paste emails into `inbox-paste.md`. |
| It says Chrome is not connected | Open Chrome, make sure the Claude extension is on and signed in. |
| A site says "sign in" or shows a robot check | That part is yours. Sign in or finish the check in Chrome, then ask it to continue. |
| You hit a usage limit | Pro has a usage limit that resets every few hours. Wait, then continue. Shorter requests use less. |
| It said something about you that isn't true | Tell it: "That isn't true. Remove it." Then fix `profile.md` if the mistake came from there. |

## Updating or removing it

- **Update**: updates arrive by themselves. To get one sooner, open **job-search** in **Customize > Plugins** and click **Check for updates**. If you uploaded a zip, upload the new zip the same way.
- **Remove**: open **job-search** in **Customize > Plugins**, open its menu, and click **Remove**. Your Job Search folder stays on your computer until you delete it yourself.
