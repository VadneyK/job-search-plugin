---
name: recruiter-reply
description: Drafts a reply to a recruiter in her voice from her reply templates (questions first, let's talk, or no thanks), after a scam check and fit check. Shows To, Subject and the full body and sends only after she says yes to that exact text. Use when she says "reply to this recruiter", "answer this email", "reply", or when the sweep has recruiter drafts waiting.
---

# Recruiter reply

## Hard rules for this skill (restated on purpose)

- **Nothing is sent without her yes on the exact text.** Show To, Cc, Subject and the whole body in the same message as the question. If she changes anything, show the new full text and ask again.
- Never reply to a likely scam, a job alert, a newsletter, a no-reply address or a bulk blast.
- Never say her pay floor. Never name a number first for a salaried role. A contract rate only if they asked, her profile has an ask, and she approves the text.
- LinkedIn messages are never sent by Claude. For LinkedIn, give her the text to paste.
- Only facts from her profile and their message. No invented details in the reason line.

## Steps

1. Find her job folder (`${CLAUDE_PLUGIN_ROOT}/reference/job-folder.md`). Read `profile.md`, `rules.md`, `replies.md`, and `tracker.md`.
2. Get the full message (and the thread, if there is one): from the mail tool if connected, from `drafts/` if the sweep left one, or ask her to paste it.
3. Check the thread first. If she already replied, do not start over with reply A: read her last message and their answer.
4. Scam check (`${CLAUDE_PLUGIN_ROOT}/reference/scam-signs.md`). LIKELY SCAM: no reply; follow the scam steps.
5. Is it a real person about a real role? If not (alert, blast, task platform), no reply; log it.
6. Fit check (`${CLAUDE_PLUGIN_ROOT}/reference/fit-test.md`) from the message and any post it links (read only).
7. Pick the reply with the rules at the bottom of `replies.md`: any Fail is C, Unknowns with no Fail is A, all Pass is B. YOUR CALL: ask her before drafting.
8. Fill the template. Replace only the slots. Use their first name as they signed. For A, ask only the Unknowns, at most 3, in this order: pay, location, process, which company (agency), level. For B, the reason uses only their facts; include her calendar link only if her profile has one, otherwise ask what times work. Under about 90 words.
9. Save the draft as `drafts/<date>-<id>-reply.md`, then show her:

```
To: <address>
Cc: <none, or addresses>
Subject: Re: <their subject>

<full body>
```

Then ask one question: "Send this exact text?"

10. **On her yes:**
    - If a mail tool that can send is connected, reply on the same thread from the account the message came to. Check Sent first so it never goes twice.
    - If the mail tool can only make drafts, make the draft on the thread and tell her: "It's in your Drafts. Open it and click Send."
    - No mail tool, or LinkedIn: tell her to copy the text and paste it as a reply.
    - Reply B: attach the resume file her profile names for this role family, if the tool can attach; otherwise tell her to attach it.
11. Update `tracker.md`: Kind "recruiter", Status "replied" (or "draft waiting on you"), Next step, Owner "them" after sending, Updated today. Note in the draft file "sent <date>" or "not sent".

**On "no" or silence:** leave it as a draft. Never send later on your own.
