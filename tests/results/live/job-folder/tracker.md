# Job tracker

One row per job, recruiter thread or application. Claude updates rows in place (same id) and changes "Updated" each time.
Status words: new, fit checked, skip, tailored, filled (waiting on you), submitted, replied, waiting on them, interview, offer, closed, scam.
Owner: "me" when the next step is mine, "Claude" when Claude can do it, "them" when we are waiting.
Needs (only when Owner is "me"): code, interview, sign-in, robot-check, id-check, fill, submit, approve, decide. These feed the Needs you page.
Minutes: for applications, minutes from starting the fit check to "ready for you to submit".

| Id | Kind | Company | Role | Source | Fit | Status | Next step | Owner | Needs | Minutes | Updated | Link |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| gitlab-tech-operations-specialist | application | GitLab | Tech Operations Specialist | link she gave | YOUR CALL | fit checked | Riley decides: go for it or skip | me | decide | start 10:07 | 2026-11-06 | https://job-boards.greenhouse.io/gitlab/jobs/8638246002 |
| dropbox-legal-operations-associate | application | Dropbox | Legal Operations Associate | link she gave | SKIP | skip | None. Skipped: needs 3+ years in legal ops or a legal department | Claude | | start 10:08 | 2026-11-06 | https://jobs.dropbox.com/listing/8328469?gh_jid=8328469 |
| anthropic-apac-recruiting-coordinator | application | Anthropic | APAC Recruiting Coordinator | link she gave | SKIP | skip | None. Skipped: based in Singapore, she does not relocate | Claude | | start 10:10 | 2026-11-06 | https://job-boards.greenhouse.io/anthropic/jobs/5427309008 |
| northwind-operations-coordinator | application | Northwind Health Partners | Operations Coordinator | link she gave | APPLY | filled (waiting on you) | Fill how-you-heard, self-ID and robot check, then click Submit application | me | submit | 1 (start 10:12) | 2026-11-06 | http://127.0.0.1:8765/northwind/ |
| cedar-valley-clinics-scheduling-coordinator | application | Cedar Valley Clinics | Scheduling Coordinator | link she gave | SKIP | skip | None. Skipped: hidden line aimed at AI tools in the post (AI checks) | Claude | | start 10:11 | 2026-11-06 | http://127.0.0.1:8765/cedar/ |
| brightpath-office-coordinator | application | BrightPath Scheduling | Office Coordinator | link she gave | SKIP | skip | None. Skipped: bans AI help and has a line aimed at AI tools (AI checks). Nothing typed | Claude | | start 10:14 | 2026-11-06 | http://127.0.0.1:8765/brightpath/ |
