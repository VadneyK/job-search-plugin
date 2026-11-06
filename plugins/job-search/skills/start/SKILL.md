---
name: start
description: The front door of the job search helper. Use when she says "job search", "help me find a job", "what can you do", "start", or opens the plugin for the first time. Checks setup, then shows a short menu of what to do next.
---

# Start

Speak plainly and briefly. She may never have used Claude Code or a terminal. One step at a time.

1. Find her job folder with `${CLAUDE_PLUGIN_ROOT}/reference/job-folder.md`.
2. **Not set up yet:** say "Welcome. Let's set up your job search first. It takes about 10 minutes, and everything stays on your computer." Then follow the setup skill (`${CLAUDE_PLUGIN_ROOT}/skills/setup/SKILL.md`).
3. **Set up:** read `profile.md` and `tracker.md`. Say in two lines how many rows need her (Owner "me") and the date of the last sweep (newest file in `digests/`, or "no sweep yet"). Then show this menu exactly:

```
What would you like to do?
1. Check my job mail and sites      (type: sweep)
2. Is this job a fit? Paste a post  (type: fit check)
3. Is this message a scam?          (type: scam check)
4. Tailor my resume for a job       (type: tailor)
5. Fill an application with me      (type: apply)
6. Answer a recruiter               (type: reply)
7. Review my week                   (type: weekly review)
8. Change my profile or rules       (type: profile)
```

4. Wait for her answer, then follow that skill's file in `${CLAUDE_PLUGIN_ROOT}/skills/<name>/SKILL.md`: sweep, fit-check, scam-check, tailor, apply, recruiter-reply, weekly-review. For "profile", open `profile.md` with her, ask what changed, edit only those lines, and show the changed lines.

Every skill follows `${CLAUDE_PLUGIN_ROOT}/reference/guardrails.md`. In short: she clicks Submit (or says yes to that one application), she approves every message's exact text, no passwords or ID numbers, no CAPTCHAs, nothing invented, LinkedIn read-only.
