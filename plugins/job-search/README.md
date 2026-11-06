# job-search (Claude plugin)

A careful job-search helper for Claude Pro and Max. You set up your profile once; then Claude checks your job mail, tells you honestly whether a job fits, catches scams, tailors your resume lines, fills applications with you, and drafts recruiter replies. You stay in control: you click Submit (or say yes to that one application), and nothing is sent until you approve the exact text.

Your profile, pay floor and tracker live in a "Job Search" folder on your own computer, never in this plugin.

## What you can type

| Type | What happens |
|---|---|
| `/job-search:start` | The menu (start here) |
| `/job-search:setup` | One-time setup from your resume and a few questions |
| `/job-search:sweep` | Check job mail and job sites, sort, draft, write a digest |
| `/job-search:fit-check` | Is this job a fit? APPLY, SKIP, YOUR CALL or STOP |
| `/job-search:scam-check` | Is this message a scam? |
| `/job-search:tailor` | Resume lines and a short note for one job |
| `/job-search:apply` | Fill an application with you, stop before Submit |
| `/job-search:recruiter-reply` | Draft a reply you approve word for word |
| `/job-search:weekly-review` | What worked this week, and 3 changes for next week |

You can also just say what you want ("is this a scam?", "check my job mail").

## What it needs

- Claude Pro or Max, in the Claude desktop app (Code tab or Cowork) or Claude Code.
- Optional: the Gmail connector (to read job mail), Claude in Chrome (to fill forms and read job sites), and scheduled tasks in the desktop app (for a morning sweep and a Friday review). Without them, you paste emails and copy answers in yourself.

## Rules it always follows

See `reference/guardrails.md`. In short: no final Submit without your yes on that application; no message without your yes on its exact text; no passwords, 2FA codes, SSNs or ID numbers; no CAPTCHAs; nothing invented; LinkedIn read-only; scheduled runs only read and draft.
