---
name: scam-check
description: Checks a job message, text, email or offer for scam signs (including task scams that pay to rate or optimize apps and then ask for a deposit) before she clicks or replies. Ends in LIKELY SCAM, CHECK FIRST or LOOKS REAL with quoted reasons and at most 3 next steps. Use when she asks "is this a scam", "is this real", "scam check", or pastes an unexpected job message.
---

# Scam check

Takes about a minute. Calm, specific, no lecture.

1. Find her job folder (`${CLAUDE_PLUGIN_ROOT}/reference/job-folder.md`). Read `profile.md` for context only (what she applied to, what she is looking for).
2. Get the whole message: sender name, sender email or phone number, every link as text, and how it reached her. If she gave only part, ask for the rest. Do not open any link or attachment in it.
3. Say what kind it is: a real person about a real role / a job alert or newsletter / scheduling for a job she applied to / a rejection / an offer / likely scam / not sure. Check `tracker.md`: a message about a job she never applied to that says she is "approved" is a sign.
4. Go through every sign in `${CLAUDE_PLUGIN_ROOT}/reference/scam-signs.md`. List only the signs that are present, each with the quoted line.
5. Give the verdict (LIKELY SCAM, CHECK FIRST or LOOKS REAL) with the two strongest reasons, then the steps from scam-signs.md.
6. If it is a scam, add a tracker row with Status "scam" and Next step "reported" or "report it", so it is never answered later. Never reply to a likely scam, not even to say no.
7. If it looks real and is about a job, say: "This looks real. Type fit check to see if the job fits you." If it is a recruiter, say: "Type reply to answer this recruiter."

If she already clicked, paid or sent details, use the "already clicked" steps in scam-signs.md first.
