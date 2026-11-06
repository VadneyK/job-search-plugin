---
name: apply
description: Fills one job application with her, in her own Chrome, from her profile and tailored lines, then stops before the final Submit and gives her the exact steps. Never types passwords, 2FA codes, SSNs or ID numbers, never solves CAPTCHAs. Without a browser tool it writes a fill sheet she can copy from. Use when she says "apply", "fill this application", "help me apply to this job".
---

# Apply

She stays in control. You do the typing; she does the deciding.

## Hard rules for this skill (restated on purpose)

- **Never click the final Submit, Apply, Send Application or Finish button** unless she has seen the filled summary for this one application in this conversation and said yes to submitting it. Without that yes, stop and give her the steps.
- **Never type** a password, a one-time or 2FA code, a Social Security number, a government ID, passport or license number, a bank or card number, or a date of birth. Leave it empty and list it for her.
- **Never solve a CAPTCHA** or bot check. Stop and ask her to do it.
- **Never create an account or sign in.** If a login is needed, ask her to sign in in Chrome, then continue.
- **Never tick** terms, consent, "I certify this is true" or e-signature boxes. List them for her.
- **Leave voluntary self-identification questions** (gender, race, veteran, disability) for her.
- Use only facts in `profile.md`, `applications/<id>/tailored.md` and her resume. If a question has no answer there, leave it blank and list it. Never invent.
- LinkedIn Easy Apply is not used: LinkedIn is read-only. Open the company's own application page instead, or give her the steps.

## Steps

1. Find her job folder (`${CLAUDE_PLUGIN_ROOT}/reference/job-folder.md`). Read `profile.md`, `rules.md`, and `applications/<id>/` (post, fit check, tailored lines).
2. **Checks before anything is typed:**
   - No fit check yet: run it (`${CLAUDE_PLUGIN_ROOT}/skills/fit-check/SKILL.md`). SKIP or STOP: stop and tell her. YOUR CALL: ask her first.
   - Run the scam signs (`${CLAUDE_PLUGIN_ROOT}/reference/scam-signs.md`) on the application page itself: its address should be the company's real site or a known applicant system (for example Greenhouse, Lever, Workday, Ashby, iCIMS, SmartRecruiters). A page that asks for a fee, bank details or a deposit is a stop. A page that asks for a Social Security number, ID number or date of birth before an offer is a **warning**, not a stop: leave those fields empty, tell her real employers usually collect them after an offer, and fill the rest only if the page is on the company's real site or a known applicant system. If you cannot tell where the page lives, ask her to confirm the address before you fill.
3. **With Claude in Chrome** (browser tools available):
   1. Open the application page in a new tab. If it needs a login, stop and ask her to sign in.
   2. Read every field on the page first. Make a plan: field, value, source (profile line, tailored line, resume, or "for you").
   3. Fill one section at a time. After each field, read it back. For autocomplete fields (school, city, company), type, then choose only the suggestion that exactly matches her fact; if none matches, leave it and list it.
   4. Resume upload: attach the file named in her profile only if a file upload tool is available; otherwise list it as a step for her.
   5. Cover letter or "why this company" boxes: use the short note from `tailored.md`, unchanged unless she edits it.
   6. Stop at the final page. Do not click the final button.
4. **Without a browser tool**: read the form from what she pastes, a saved page file, or the post's description of it. Write `applications/<id>/fill-sheet.md`: one line per field, the value to copy, and "for you" lines. Tell her to open the form and copy each value in.
5. **Show her the summary** in this shape:

```
Ready for you: <Company>, <Role>
Filled (please check): <field: value>, one per line
For you to fill: <fields left for her, with why: password, SSN, self-ID, no fact on file>
For you to tick: <consent and certify boxes>
To submit:
1. Go to the <Chrome tab title or page address>.
2. Fill the "for you" fields and tick the boxes above.
3. Read every page once. Change anything that is wrong.
4. Click <exact button label> at the bottom of <page name>.
```

6. Ask: "Do you want to click Submit yourself, or should I click it now that you've checked it?" Click only on a clear yes for this application, after any "for you" fields she must fill are done. Then confirm what the page says after submitting.
7. Save the summary as `applications/<id>/applied.md`. Update the tracker row: Status "filled (waiting on you)", or "submitted" once she confirms or the page confirms, Owner "me" or "them", Updated today.
8. Close any tabs you opened, except the one she needs.
