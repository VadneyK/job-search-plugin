# Job tracker

One row per job, recruiter thread or application. Claude updates rows in place (same id) and changes "Updated" each time.
Status words: new, fit checked, skip, tailored, filled (waiting on you), submitted, replied, waiting on them, interview, offer, closed, scam.
Owner: "me" when the next step is mine, "Claude" when Claude can do it, "them" when we are waiting.
Needs (only when Owner is "me"): code, interview, sign-in, robot-check, id-check, fill, submit, approve, decide. These feed the Needs you page.
Minutes: for applications, minutes from starting the fit check to "ready for you to submit".

| Id | Kind | Company | Role | Source | Fit | Status | Next step | Owner | Needs | Minutes | Updated | Link |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| gitlab-tech-operations-specialist | application | GitLab | Tech Operations Specialist | link from Riley | APPLY | fit checked | Type "tailor" to write resume lines and a note | Claude | | start 10:38 | 2026-11-06 | https://job-boards.greenhouse.io/gitlab/jobs/8638246002 |
| northwind-operations-coordinator | application | Northwind Health Partners | Operations Coordinator | link from Riley | APPLY | filled (waiting on you) | Fill self-ID, "How did you hear", tick the robot box, check everything, then Submit | me | submit | 2 | 2026-11-06 | http://127.0.0.1:8765/northwind/ |
| dropbox-legal-operations-associate | application | Dropbox | Legal Operations Associate | link from Riley | SKIP | skip | None. Requires 3+ years of legal operations experience | Claude | | start 10:40 | 2026-11-06 | https://jobs.dropbox.com/listing/8328469?gh_jid=8328469 |
| instacart-lifecycle-marketing-coordinator-crm | application | Instacart | Lifecycle Marketing Coordinator, CRM | link from Riley | SKIP | skip | None. Needs 1 to 3 years of hands-on CRM campaign work; outside her role families | Claude | | start 10:41 | 2026-11-06 | https://instacart.careers/job/?gh_jid=8355990 |
| anthropic-apac-recruiting-coordinator | application | Anthropic | APAC Recruiting Coordinator | link from Riley | SKIP | skip | None. Based in Singapore (she will not relocate); needs 4+ years recruiting coordination or high-volume scheduling | Claude | | start 10:42 | 2026-11-06 | https://job-boards.greenhouse.io/anthropic/jobs/5427309008 |
| brightpath-office-coordinator | application | BrightPath Scheduling | Office Coordinator | link from Riley | SKIP | skip | None. Page bans AI help and has an AI certify box; nothing typed. Riley can apply herself if she wants | Claude | | 1 | 2026-11-06 | http://127.0.0.1:8765/brightpath/ |
| cedar-valley-clinics-scheduling-coordinator | application | Cedar Valley Clinics | Scheduling Coordinator | link from Riley | APPLY | fit checked | Type "tailor" to write resume lines and a note | Claude | | start 10:43 | 2026-11-06 | http://127.0.0.1:8765/cedar/ |
