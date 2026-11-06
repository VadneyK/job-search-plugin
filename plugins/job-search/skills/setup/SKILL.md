---
name: setup
description: One-time setup for the job search helper. Builds her private profile from her resume and a few questions, writes her job folder (profile, rules, replies, tracker), checks which tools are connected (mail, Chrome, scheduling), and offers a daily sweep and weekly review. Use when she says "set up", "set up my job search", "update my profile from my resume", or when no profile exists yet.
---

# Setup

Plain words, short messages, one question block at a time. She may never have used a terminal. Never ask for passwords, ID numbers or bank details: the profile never needs them.

Follow `${CLAUDE_PLUGIN_ROOT}/reference/guardrails.md` throughout.

## 1. Pick the job folder

- If the folder this session is open in is empty, or is named `Job Search`, use it.
- Otherwise use `~/Documents/Job Search/` (create it).
- If `profile.md` already exists there, say so and ask: "Update your profile, or start over?" Start over only on a clear yes, and first copy the old file to `profile-old-<date>.md`.

Tell her the folder's full path in one line: "Your job files will live in <path>. Only you and Claude on this computer use them."

## 2. Gather her facts

**If `setup-answers.md` exists in the job folder**, read it and use its answers. Ask only about what it leaves blank or marks ASK ME. (This lets someone prepare answers ahead of time.)

**Otherwise**, ask these in three short blocks. Wait for each answer.

Block 1, the resume:
> To start, I need your resume. Either drag the file into this chat, tell me where it is (for example "Documents, file called Resume.pdf"), or paste the text.

Read it fully. If it is a PDF or Word file, read the text out of it.

Block 2, what you want (one message, numbered, she can answer in any order):
> 1. What kind of work: full-time, part-time, contract, or open to any?
> 2. What jobs are you hoping for? A sentence is fine, or "not sure".
> 3. Where can you work: remote, hybrid (how far from home), or onsite? How much work travel is OK (for example "a few trips a year")?
> 4. Can you work in this country without visa sponsorship?
> 5. When could you start, and how many hours a week?

Block 3, private details (say first: "These stay on your computer and are never shared"):
> 1. The lowest pay you'd take, yearly or hourly. (This is your floor. I will never say it to anyone.)
> 2. Anything that's a dealbreaker (for example long commutes, weekend shifts, a type of company)?
> 3. Interview limits: for example, take-home tests, how long you can spend, whether you want to use AI tools on them.
> 4. The email and phone number you want on applications, and your city.
> 5. How you sign your emails, and a link to book a call if you have one (optional).
> 6. Which email you use for job mail, and which job sites you're signed in to (for example LinkedIn, Indeed, a company's careers page).

## 3. Build the role profile

From her resume and answers only. Label anything inferred "(guess)". Never add a skill, job, number or degree she did not give.

1. List 4 to 8 **role families** she could apply to now, with the titles employers use for each.
2. For each: the evidence (quote her resume), her level, and a strength: **Strong** (direct, recent evidence), **Moderate** (real but thin or older), **Weak** (would not survive one focused interview question). Be strict; most people have 2 or 3 Strong families, not 8.
3. Her level in one paragraph: years in the field, what title level she reads as, and which titles are too senior or too junior. Base it on dates and titles in the resume.
4. **Evidence bank**: one line per real accomplishment from the resume, each with its place and date. Keep "About" on estimates. If a number belongs to a team, say so.
5. **Claims to fix**: any fact stated two ways, a claim bigger than its evidence, or a number with no source. Give the honest version and ask her which is right.
6. **Gaps worth closing**: for her top 2 families, the one proof or skill that would most raise her strength.

## 4. Write the files

Copy the templates from `${CLAUDE_PLUGIN_ROOT}/templates/` into the job folder and fill them:

- `profile.md`: every section, from her answers and step 3. Leave a line blank if she did not give it; write ASK ME where her answer is needed. The first line must stay `# Job search profile`.
- `rules.md`: copy as is. Add any rule she stated ("no weekend work") under "My own rules" with today's date.
- `replies.md`: copy, then fill her sign-off, her location line and her top role families into the slots. Keep the angle-bracket slots for the recruiter's name and the reason.
- `tracker.md`: copy as is.
- Create empty folders `digests/`, `drafts/`, `applications/`, `reviews/`.

Then show her a short summary: her top 3 role families with strength, her level line, and any ASK ME or claims to fix. Ask her to answer those now or later.

## 5. Check her tools

Look at which tools this session has, and tell her in plain words what works and what to connect. Do not guess; check.

| Need | It is on when | If it is off, tell her |
|---|---|---|
| Read job mail | A mail tool (Gmail connector) is available | "To let me read job emails, open Claude's Settings, then Connectors, and connect Gmail. Until then you can paste emails into the file inbox-paste.md in your job folder." |
| Fill applications in the browser | Claude in Chrome tools are available | "To let me fill forms, install the Claude in Chrome extension from the Chrome Web Store, sign in with your Claude account, and keep Chrome open. Until then I'll give you the answers to copy in." |
| Daily and weekly runs | A scheduled-tasks tool is available | "To run this every morning: in the Claude desktop app's Code tab, click Scheduled in the sidebar, then New task." (Steps are in the install guide.) |

## 6. Offer the schedule

Ask: "Want me to check your job mail every weekday morning and do a review every Friday? These runs only read and draft. They never send anything or submit anything."

On yes, if a scheduled-tasks tool is available, create two tasks with the job folder as their working folder:
- `job-search-sweep`, weekdays at 8:00 local time, prompt: "Run the job-search sweep skill in unattended mode: read and draft only, send nothing, submit nothing."
- `job-search-weekly`, Fridays at 4:00 pm local time, prompt: "Run the job-search weekly-review skill."

Tell her they run only while the Claude app is open and the computer is awake; a missed run catches up once when the computer wakes. Suggest she clicks Run now once on each task and chooses "always allow" for file edits in her job folder, so later runs do not stop on a question.

If no scheduled-tasks tool is available, give her these steps with the exact prompts above: in the Code tab, click Scheduled in the sidebar, then New task. Name it, paste the prompt, turn on Only on this computer (under Advanced settings), pick her job folder as the Local folder, choose Weekdays at 8:00 (or Weekly, Friday 4:00 pm), set the permission mode to Accept edits, then click Create.

## 7. Finish

Show the menu from the start skill (`${CLAUDE_PLUGIN_ROOT}/skills/start/SKILL.md`, step 3). Suggest one first action: "Paste a job post you like and type fit check."
