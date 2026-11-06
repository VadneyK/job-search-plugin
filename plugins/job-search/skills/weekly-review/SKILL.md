---
name: weekly-review
description: Weekly review of her job search from the tracker and the week's digests. Counts what happened, quotes what came back, separates facts from guesses, checks her facts stayed consistent, and picks at most 3 changes for next week. Use when she says "review my week", "weekly review", "how is my search going", or from the Friday scheduled run.
---

# Weekly review

Honest and kind. Do not cheer her up with things that are not true, and do not be harsh. Label every line in "What I learned" as **Fact** or **Guess**.

1. Find her job folder (`${CLAUDE_PLUGIN_ROOT}/reference/job-folder.md`). Read `profile.md`, `rules.md`, `tracker.md`, this week's files in `digests/` and `applications/`, and last week's file in `reviews/` (if any).
2. **What happened** (counts for the last 7 days): fit checks run, applications submitted, recruiter replies sent, replies received, interviews, rejections, offers, scams caught, and jobs skipped for AI checks. **Time**: the median and range of the tracker's Minutes column for applications this week, and how many applications were ready for her within 20 minutes.
3. **What came back**: any reason a company or recruiter gave, quoted.
4. **What I learned**, each line Fact or Guess. Look for:
   - which role families and levels got replies, and which got none;
   - applications or replies that went to roles her own fit check said to skip;
   - rows where she is the owner and nothing moved for more than 5 days;
   - recruiter threads waiting on her yes.
5. **Last week's plan**: if last week's review had a "Next week" list, say for each item whether it happened, from the tracker.
6. **Facts check**: anything stated two ways this week (titles, dates, skill or language levels) across tailored lines, drafts and forms. Give the line and ask which is right.
7. **Next week, at most 3 changes.** Keep applying to every role that passes the fit check, each with a short note naming one real detail from the post. Suggest one proof-of-work piece if there is a role she really wants. Suggest one kind of person (a field or role, not a name) she could ask for advice, and what to ask.
8. Save it as `reviews/<year>-W<week>.md`. Tell her the three changes and the number of rows waiting on her, in at most 5 lines.

Rebuild the Needs you board (`${CLAUDE_PLUGIN_ROOT}/reference/needs-you.md`) from the tracker, so stale items drop off.

In a scheduled run, write the file and stop. Never send anything.
