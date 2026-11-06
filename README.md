# job-search-plugin

A Claude plugin for a careful, honest job search on a Claude Pro account. It does the legwork; the person stays in control.

**New here? Read [INSTALL.md](INSTALL.md).** It is written for someone who has never used a terminal.

## What it does

- **Setup, once**: reads your resume, asks a few questions, and writes a private profile: the role families you can honestly go after (with evidence and a strength for each), your level, where you can work, your pay floor (never shared), your process rules and dealbreakers.
- **Fit check**: scores a job post on role family, level, pay, location, process and eligibility, each Pass, Fail or Unknown with the quoted line. APPLY, SKIP, YOUR CALL or STOP. Skipping the roles you cannot get is what frees time for the ones you can.
- **Scam check**: runs first everywhere, with task-scam signs (pay to rate or "optimize" apps, deposits to unlock tasks, crypto, WhatsApp or Telegram recruiters) as well as the classic ones.
- **Tailor**: picks your best real evidence for a post, tightens resume lines without adding facts, and writes a short note naming one real detail of the post.
- **Apply**: fills the form in your own Chrome (Claude in Chrome) from your profile, stops before Submit, and gives you the exact steps.
- **Recruiter reply**: three templates in your voice (questions first, let's talk, no thanks), picked by the fit check, sent only after you approve the exact text.
- **Sweep**: reads recent job mail (Gmail connector, or pasted emails) and your job sites, sorts and checks everything, drafts replies, and writes a digest of what needs you. Sends nothing.
- **Weekly review**: counts, quoted feedback, facts versus guesses, and at most 3 changes for next week.

## Why it is built this way

Volume auto-apply and bulk AI cover letters are well served by other tools and add little. What helps is a fit check that skips roles you cannot get, real tailoring for the rest, and a scam check, since task scams are now among the most reported job scams.

## Guardrails

Fixed in [plugins/job-search/reference/guardrails.md](plugins/job-search/reference/guardrails.md) and restated inside the skills that act:

- No final Submit without the person's yes on that application.
- No message sent without their yes on that exact text. Scheduled runs only read and draft.
- Never types passwords, 2FA codes, SSNs, ID numbers, bank details or dates of birth.
- Never solves CAPTCHAs or bot checks, never creates accounts, never ticks consent boxes.
- Never invents experience; labels guesses.
- Respects site rules and read limits. LinkedIn is read-only.

## What Claude Pro includes (checked 2026-11-06)

From claude.com/pricing and the Claude docs: Claude Code (also in the desktop app's Code tab), the desktop app, Claude in Chrome, connectors (Gmail, Google Calendar and others, which also load in Claude Code when signed in with a Claude account), and scheduled tasks (local ones in the desktop app run while the app is open and the computer is awake). Plugins are added from Customize, Plugins, by uploading a zip or adding a GitHub marketplace. Pro has lower usage limits than Max, so the skills keep steps short and read only what they need.

## Layout

| Path | What it is |
|---|---|
| `.claude-plugin/marketplace.json` | Marketplace manifest, so the repo can be added as a marketplace |
| `plugins/job-search/` | The plugin: `skills/` (9 skills), `reference/` (guardrails, fit test, scam signs, job folder), `templates/` (profile, rules, replies, tracker) |
| `tests/fixtures/` | A fictional person (Riley Chen), job posts, recruiter and scam messages, a pasted inbox, a local application form |
| `tests/run-e2e.sh` | Runs every skill in order on the fictional profile and checks the results |
| `tests/results/` | The last run: each skill's output, the summary, and the job folder it produced |
| `tools/build-zip.sh` | Builds `dist/job-search.zip` for Upload plugin |
| `tools/check.sh` | Fails on dashes, real names or contact details, or invalid manifests |

## Install from the command line (for people who use a terminal)

```bash
claude plugin marketplace add <owner>/job-search-plugin
claude plugin install job-search@job-search-plugin
```

Or inside Claude Code: `/plugin marketplace add <owner>/job-search-plugin`, then `/plugin install job-search@job-search-plugin`.

## For maintainers

```bash
make check   # dashes, denylist, manifests
make zip     # dist/job-search.zip
make test    # end-to-end run on the fictional profile (about 20 minutes, uses Claude usage)
```

The end-to-end run uses `--strict-mcp-config` and `--setting-sources project`, so it loads no connectors and no personal settings, and works in a throwaway folder.

No personal data belongs in this repo. Fixtures are fictional and use example.com addresses and 555-01xx numbers.

## License

MIT. See [LICENSE](LICENSE).
