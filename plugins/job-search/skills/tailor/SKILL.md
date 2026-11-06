---
name: tailor
description: Tailors her resume lines and a short application note to one job post, using only facts from her profile and resume. Picks the best evidence for the post, rewrites lines without adding facts, flags claims to fix, and saves it with the application. Use when she says "tailor my resume", "write a cover note", "tailor", or after a fit check says APPLY.
---

# Tailor

No new facts, ever. Every line must trace to her evidence bank or resume. A short, true, specific note beats a long one.

1. Find her job folder (`${CLAUDE_PLUGIN_ROOT}/reference/job-folder.md`). Read `profile.md`, `rules.md` and her main resume file (path in the profile).
2. Find the post: `applications/<id>/post.md`, or ask her to paste it.
3. If `applications/<id>/fit-check.md` is missing, run the fit check first (`${CLAUDE_PLUGIN_ROOT}/skills/fit-check/SKILL.md`). If the verdict is SKIP or STOP, say so and stop unless she says to go ahead anyway. If YOUR CALL, ask her first.
4. List the post's top 5 requirements, each quoted.
5. For each requirement, pick the best line from her evidence bank or resume, or write "no evidence" (that is useful to know, not a failure).
6. **Resume lines**: 4 to 6 lines for this post. Each:
   - starts with a strong verb (past tense for finished work, present for ongoing);
   - stays under about 20 words;
   - keeps every fact, adds none: no new tools, numbers, results or titles;
   - keeps "About" on estimates and credits a team's number to the team;
   - shows the old line next to the new one, so she can check nothing changed in meaning.
7. **Skills with proof**: up to 5 skills the post asks for that she has, each with the one line that proves it.
8. **Short note** for the application or email: at most 4 sentences. Name one real detail from the post and one real thing from her evidence. No buzzwords ("passionate", "synergy", "fast-paced"), no claims beyond the evidence. Sign with her sign-off.
9. **Claims to fix**: any line where her resume and profile disagree, or a claim the post would test that her evidence cannot back. Ask her which version is right.
10. **One gap**: the one requirement with no evidence that matters most, and an honest way to address it (a question to raise, a small proof piece) without pretending.
11. If the fit check found an AI check (`${CLAUDE_PLUGIN_ROOT}/reference/ai-checks.md`), stop: do not write lines or a note for an employer that bans AI help. Tell her why in one line.
12. Save it as `applications/<id>/tailored.md`. Update the tracker row: Status "tailored", Next step "apply", Updated today.
13. Rebuild the Needs you board (`${CLAUDE_PLUGIN_ROOT}/reference/needs-you.md`). End with: "Check these lines. When you're happy, type apply and I'll fill the form with you."

Do not edit her resume file itself. She decides what goes in it. If she asks you to, write a new copy next to it (for example `Resume - <company>.md`) and leave the original untouched.
