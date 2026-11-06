# Finding her job folder

Every skill starts here.

1. If the folder this session is open in holds a file named `profile.md` whose first line is `# Job search profile`, that folder is her job folder.
2. Otherwise, if `~/Documents/Job Search/profile.md` exists, use `~/Documents/Job Search/`.
3. Otherwise she has not set up yet. Say: "Let's set up your job search first. It takes about 10 minutes." Then run the setup skill.

What lives in the job folder:

| File or folder | What it holds |
|---|---|
| `profile.md` | Who she is, what she wants, her evidence, her pay floor (private) |
| `rules.md` | Her own extra rules, on top of the fixed guardrails |
| `replies.md` | Her recruiter reply templates, in her voice |
| `tracker.md` | One row per job, recruiter or application, including past applications imported at setup: her full applied log |
| `needs-you.html` and `board-data.js` | Her Needs you page: what only she can do (see `needs-you.md`) |
| `applied-before.*` | Optional: her long list of past applications, kept as she gave it; duplicate checks search it |
| `inbox-paste.md` | Optional: emails she pasted in when no mail connector is on |
| `digests/` | One file per sweep: what came in and what needs her |
| `drafts/` | Replies and notes waiting for her yes |
| `applications/` | One folder per application: the post, the fit check, tailored lines |
| `reviews/` | One file per weekly review |

Read `profile.md` and `rules.md` before doing anything else. If `rules.md` conflicts with the guardrails, the guardrails win; tell her once which rule was skipped and why.

Every skill that changes `tracker.md` ends by rebuilding the Needs you board as `needs-you.md` says.

Dates in file names are `YYYY-MM-DD`. Tracker ids are lowercase `company-role`, for example `northwind-ops-coordinator`.
