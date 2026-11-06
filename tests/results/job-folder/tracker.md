# Job tracker

One row per job, recruiter thread or application. Claude updates rows in place (same id) and changes "Updated" each time.
Status words: new, fit checked, skip, tailored, filled (waiting on you), submitted, replied, waiting on them, interview, offer, closed, scam.
Owner: "me" when the next step is mine, "Claude" when Claude can do it, "them" when we are waiting.
Needs (only when Owner is "me"): code, interview, sign-in, robot-check, id-check, fill, submit, approve, decide. These feed the Needs you page.
Minutes: for applications, minutes from starting the fit check to "ready for you to submit".

| Id | Kind | Company | Role | Source | Fit | Status | Next step | Owner | Needs | Minutes | Updated | Link |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| northwind-health-partners-operations-coordinator | application | Northwind Health Partners | Operations Coordinator | match-ops-coordinator.md | APPLY | tailored | Copy the values from applications/northwind-health-partners-operations-coordinator/fill-sheet.md into the form, fill the "for you" fields, then tell me when it is ready for me to check | me | fill | 7 | 2026-11-06 | careers.northwind-health.example.com |
| ridgeway-logistics-senior-director-of-operations | application | Ridgeway Logistics | Senior Director of Operations | senior-director.md | SKIP | skip | None. Skipped: MBA required, 10+ years, onsite 5 days | them |  | start 10:08 | 2026-11-06 | |
| juniper-dental-group-office-coordinator | application | Juniper Dental Group | Office Coordinator | ai-ban-post.md | SKIP | skip | None. Skipped: bans and screens for AI-written applications (your AI-checks line is unanswered) | them |  | start 10:09 | 2026-11-06 | |
| unnamed-remote-online-assistant | application | (not named) | Remote Online Assistant | task-scam-post.md | STOP | scam | Do not reply or pay. Report it (reportfraud.ftc.gov) | me |  | start 10:09 | 2026-11-06 | |
| summit-staffing-operations-coordinator | recruiter | Summit Staffing (agency; client not named) | Operations Coordinator | agency-recruiter.md | APPLY | draft waiting on you | Say yes or no to the drafted reply (questions: pay, location, interview steps) | me | approve |  | 2026-11-06 | |
| northwind-health-partners-operations-coordinator-recruiter | recruiter | Northwind Health Partners | Operations Coordinator | inhouse-recruiter-match.md | APPLY | draft waiting on you | Say yes or no to the drafted reply to Morgan Lee, then attach your resume (PDF or Word) | me | approve |  | 2026-11-06 | careers.northwind-health.example.com |
| ridgeway-logistics-office-manager | recruiter | Ridgeway Logistics | Office Manager | onsite-recruiter.md | SKIP | draft waiting on you | Say yes or no to the drafted no-thanks reply to Casey Brooks (onsite 5 days in Portland) | me | approve |  | 2026-11-06 | |
| blue-pine-dental-office-coordinator | application | Blue Pine Dental Group | Office Coordinator | pasted email (Taylor Kim) | APPLY | interview | Interview requested: Tuesday 10 am or Wednesday 2 pm Pacific. Pick a time in drafts/2026-11-06-blue-pine-dental-office-coordinator-reply.md and confirm you applied | me | interview |  | 2026-11-06 | |
| hr-department-remote-data-entry | recruiter | (not named) hr.department.hiring2026@gmail.com | Remote Data Entry Clerk | pasted email | STOP | scam | Do not reply or send details. Report it (reportfraud.ftc.gov) | me |  |  | 2026-11-06 | |
| talentbridge-recruitment-text-rating-job | recruiter | TalentBridge Recruitment (unverified) | Merchant product-rating tasks | text from +1 555 0187 | STOP | scam | Do not reply. Report it (reportfraud.ftc.gov) | me |  |  | 2026-11-06 | |
