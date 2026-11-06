# The Needs you board

A page in her job folder, `needs-you.html`, that lists everything only she can do: codes, sign-ins, robot checks, ID checks, fields she must fill, applications ready to submit, messages waiting for her yes, interview times and decisions. It reads `board-data.js` next to it. Everything stays on her computer.

## When to update it

At the end of every skill that changes `tracker.md` (setup, sweep, fit-check, tailor, apply, recruiter-reply, weekly-review). Rebuild `board-data.js` whole from the tracker each time; never append. If `needs-you.html` is missing from the job folder, copy it from `${CLAUDE_PLUGIN_ROOT}/templates/needs-you.html`.

## Which rows go on it

Every tracker row whose Owner is "me" and whose Status is not closed, skip or scam. The tracker's **Needs** column gives the type.

| Needs (type) | Use when | Urgent |
|---|---|---|
| `code` | A site emailed or texted a security or verification code (Greenhouse often does after Submit) | yes, put the time it was sent in `since` |
| `interview` | Someone offered interview times | yes |
| `sign-in` | A site is signed out or wants a password or 2FA | no |
| `robot-check` | A CAPTCHA or "I am human" box blocks the next step | no |
| `id-check` | An identity check (for example CLEAR) asks for her ID or face | no |
| `fill` | A form has fields only she fills (SSN, date of birth, self-ID, certify box, a question with no fact on file) | no |
| `submit` | A filled application is ready for her final check and Submit | no |
| `approve` | A drafted message waits for her yes | no |
| `decide` | A YOUR CALL verdict, or a recruiter who dodged the pay question | no |

## The file format

Write `board-data.js` in the job folder exactly like this (valid JavaScript, one object):

```js
window.BOARD = {
  updated: "2026-11-06 8:10 AM",
  items: [
    {
      id: "northwind-ops-coordinator-code",
      type: "code",
      urgent: true,
      company: "Northwind Health Partners",
      role: "Operations Coordinator",
      do: "Greenhouse emailed a security code. Open the email, then type the code into the open application tab.",
      link: "https://example.com/the-application-page",
      where: "Chrome tab: Northwind Health Partners application",
      file: "applications/northwind-ops-coordinator/applied.md",
      since: "sent 8:04 AM",
      then: "I entered the Northwind code and submitted"
    }
  ]
};
```

Rules:
- `do` is one plain sentence: the one thing she does. Never a password, code, SSN or any other secret in this file.
- `link` only if it is an `https` address of the real page. Otherwise leave it out and use `where`.
- `then` is the short sentence she can paste back to Claude when done, so the tracker updates.
- Strings use double quotes; escape any double quote inside with `\"`.

After writing it, tell her once per session: "Your Needs you page is ready: open `needs-you.html` in your Job Search folder." When she reports something done, set that tracker row's Owner and Status, then rebuild the file.
