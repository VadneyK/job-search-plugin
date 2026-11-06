---
name: fit-check
description: Honest fit check on one job post against her profile: scam check first, then role family, level, pay, location, process and eligibility, each Pass, Fail or Unknown with the quoted line, ending in APPLY, SKIP, YOUR CALL or STOP. Use when she pastes a job post or link and asks "is this a fit", "should I apply", "fit check", or before tailoring or applying.
---

# Fit check

Goal: skip the roles she cannot get, so her effort goes to the ones she can. Takes about 2 minutes.

1. Find her job folder (`${CLAUDE_PLUGIN_ROOT}/reference/job-folder.md`). Read `profile.md` and `rules.md`.
2. Get the post. If she gave a link and a browser or web tool is available, read the page (read only; click nothing else). If the page will not load or needs a login, ask her to paste the text. Never guess a post's contents from its title.
3. Run the scam signs in `${CLAUDE_PLUGIN_ROOT}/reference/scam-signs.md` on the post and on how it reached her.
4. Score it with `${CLAUDE_PLUGIN_ROOT}/reference/fit-test.md`, using its output shape. Quote every line you rely on. Unknown, never a guessed Pass.
5. Apply her own `rules.md` lines as extra Fail conditions where they fit, and say which rule.
6. Save the result:
   - Create `applications/<id>/` (id is lowercase `company-role`), with `post.md` (the post text and link) and `fit-check.md` (your output).
   - Add or update the row in `tracker.md`: Kind "application", Fit = the verdict, Status "fit checked" (or "skip" or "scam"), Next step, Owner, Updated = today.
7. Tell her the verdict in one line first, then the table. Then the next step:
   - APPLY: "Next: type tailor to write resume lines and a short note for this one."
   - YOUR CALL: the trade in one line, then ask "Go for it, or skip?"
   - SKIP: the reason in one line. No pep talk.
   - STOP: the scam steps from scam-signs.md.

Never mark a check Pass that the post does not support. "Preferred" years never fail the level check.
