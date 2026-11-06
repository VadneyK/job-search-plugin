---
name: sweep
description: Daily sweep of her job mail and job sites. Reads recent job email (Gmail connector, or emails she pasted into inbox-paste.md) and the job sites she listed (in Chrome, read-only on LinkedIn), sorts each item, runs the scam and fit checks, updates her tracker, drafts recruiter replies for her approval, and writes a short digest of what needs her. Sends nothing and submits nothing. Use when she says "sweep", "check my job mail", "anything new", or from a scheduled morning run.
---

# Sweep

## Hard rules for this skill (restated on purpose)

- **Read and draft only.** The sweep never sends a message, never submits an application, never clicks "I'm interested", "Easy Apply", "Connect" or quick-reply chips.
- **LinkedIn is read-only**, about 30 page views at most, and stops at the first login wall, checkpoint or CAPTCHA.
- Never open a link or attachment from a message the scam check has not cleared.
- Never type passwords or codes. If a site is signed out, list it for her and move on.
- In an unattended (scheduled) run, ask her nothing mid-run: skip what needs her and list it in the digest.

## Steps

1. Find her job folder (`${CLAUDE_PLUGIN_ROOT}/reference/job-folder.md`). Read `profile.md`, `rules.md`, `replies.md`, `tracker.md`, and the newest file in `digests/` (to know what was already seen).
2. **Mail.** How many days back: the profile's sweep line (default 2; if there is no earlier digest, 14).
   - With a mail tool (Gmail connector): search the inbox for that window with job words, for example `newer_than:2d (job OR role OR position OR recruiter OR interview OR application OR opportunity OR hiring OR offer)`. Read each thread, read only. Do not change labels or mark anything read.
   - Also read `inbox-paste.md` if it has content (emails she pasted). After the sweep, move its content to `digests/<date>-pasted.md` and leave `inbox-paste.md` empty.
   - No mail tool and nothing pasted: note "mail not read: connect Gmail or paste emails into inbox-paste.md".
   - **Right mailbox check**: if the mail is clearly addressed to someone other than the profile's name, stop after the digest: write no tracker rows, drafts or board items, and tell her the mail tool is signed in to another account.
3. **Sort** each item:
   - **recruiter**: a real person pitching a role;
   - **application update**: a company about an application she made (interview request, next step, rejection, offer);
   - **posting**: a job post sent to her or from an alert worth checking;
   - **noise**: alerts with nothing relevant, newsletters, marketing, no-reply blasts. Count noise; list nothing about it.
   - **scam**: run `${CLAUDE_PLUGIN_ROOT}/reference/scam-signs.md` on every non-noise item first. LIKELY SCAM items go here.
4. **Job sites** (only those listed in her profile, only with Claude in Chrome tools):
   - Open each in a new tab. Read messages and application statuses. Read only.
   - Signed out, checkpoint or CAPTCHA: stop on that site, list it for her ("LinkedIn: please sign in, then run sweep again").
   - Close every tab you opened.
   - No browser tool: note "sites not checked: Claude in Chrome not connected".
5. **For each recruiter item:** fit check (`${CLAUDE_PLUGIN_ROOT}/reference/fit-test.md`), pick and fill the reply from `replies.md` (rules at its bottom), save it to `drafts/<date>-<id>-reply.md` with To, Subject and body. Do not send.
6. **For each posting:** fit check. Save APPLY and YOUR CALL ones under `applications/<id>/` (post and fit check). SKIP ones get one tracker row and nothing else.
7. **For each application update:** update the tracker row. Interview requests and offers go to the top of the digest. A requested time is never accepted for her; draft a reply and list it.
8. **Tracker:** add or update one row per item (same id, never duplicates). Updated = today.
9. **Digest:** write `digests/<date>.md`:

```
# Job sweep, <date>
Read: <inboxes and sites read>; Not read: <and why>

## Needs you (<count>)
1. <Company, role>: <the one thing to do> (draft: drafts/<file>, or link)

## New fits
- <Company, role>: APPLY or YOUR CALL, <one line>

## Skipped
- <Company, role>: <first failing check>

## Scams caught
- <sender>: <one reason>. Not answered.

## Counts
<n> recruiter, <n> updates, <n> postings, <n> scams, <n> noise
```

10. Rebuild the Needs you board (`${CLAUDE_PLUGIN_ROOT}/reference/needs-you.md`). Security codes and interview requests are urgent. A site that was signed out is type `sign-in`.
11. Tell her in at most 4 lines: how many need her, the most urgent one, and "Type reply to review the drafts" if there are any. In an unattended run, the digest file is the whole report.
