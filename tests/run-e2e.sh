#!/usr/bin/env bash
# End-to-end test: runs every skill, in order, on the fictional profile in tests/fixtures.
# Usage: tests/run-e2e.sh [plugin dir or zip] [model]
# Needs: Claude Code signed in with a Claude account. Uses no MCP servers, no user settings,
# and a throwaway job folder, so it never touches a real inbox, browser or profile.
set -u
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PLUGIN="${1:-$ROOT/plugins/job-search}"
MODEL="${2:-sonnet}"
WORK="${E2E_WORK:-$(mktemp -d)}"
JOB="$WORK/Job Search"
OUT="$ROOT/tests/results"
FIX="$ROOT/tests/fixtures"
rm -rf "$OUT" "$JOB"; mkdir -p "$OUT" "$JOB"
cp "$FIX/setup-answers.md" "$FIX/resume-riley.md" "$JOB/"

PASS=0; FAIL=0
note() { printf '%s\n' "$*" | tee -a "$OUT/summary.txt"; }
ok()   { PASS=$((PASS+1)); note "PASS  $1"; }
bad()  { FAIL=$((FAIL+1)); note "FAIL  $1"; }
check() { # name, condition command...
  local name="$1"; shift
  if "$@" >/dev/null 2>&1; then ok "$name"; else bad "$name"; fi
}

PLUGIN_SRC="$ROOT/plugins/job-search"
run() { # step name, prompt
  local step="$1" prompt="$2"
  note "--- $step"
  ( cd "$JOB" && claude -p "$prompt" \
      --plugin-dir "$PLUGIN" --model "$MODEL" \
      --strict-mcp-config --setting-sources project --no-session-persistence \
      --permission-mode acceptEdits \
      --allowedTools "Read" "Write" "Edit" "Glob" "Grep" "Bash(mkdir:*)" "Bash(cp:*)" "Bash(ls:*)" "Bash(mv:*)" "Bash(date:*)" "Bash(cat:*)" \
      --add-dir "$PLUGIN_SRC" "$FIX" \
      --append-system-prompt "This is an automated test with a fictional user named Riley. Nobody can answer questions mid-run: when a skill says to ask her something, state the question at the end of your reply and stop there. There is no mail tool, no browser tool and no scheduled-tasks tool in this session." \
      > "$OUT/$step.txt" 2>&1 )
}
has()  { grep -qiE "$2" "$OUT/$1.txt"; }
hasnt(){ ! grep -qiE "$2" "$OUT/$1.txt"; }

# 1. Setup from a prepared answers file
run 01-setup "/job-search:setup"
check "setup: profile.md written with its header" bash -c "head -1 '$JOB/profile.md' | grep -q '^# Job search profile'"
check "setup: rules, replies, tracker written" test -f "$JOB/rules.md" -a -f "$JOB/replies.md" -a -f "$JOB/tracker.md"
check "setup: folders made" test -d "$JOB/digests" -a -d "$JOB/drafts" -a -d "$JOB/applications" -a -d "$JOB/reviews"
check "setup: role families table filled" grep -qiE "coordinat" "$JOB/profile.md"
check "setup: pay floor kept in profile" grep -qE "58,?000" "$JOB/profile.md"
check "setup: sign-off in replies" grep -q "Riley" "$JOB/replies.md"

# 2 to 4. Fit checks
run 02-fit-match "/job-search:fit-check The post is in $FIX/posts/match-ops-coordinator.md"
check "fit: matching post gets APPLY" has 02-fit-match "verdict[^a-z]*apply|\*\*apply\*\*|: apply"
run 03-fit-senior "/job-search:fit-check The post is in $FIX/posts/senior-director.md"
check "fit: senior director post gets SKIP" has 03-fit-senior "skip"
check "fit: senior director post is not APPLY" hasnt 03-fit-senior "verdict[^a-z]*apply"
run 04-fit-scam "/job-search:fit-check The post is in $FIX/posts/task-scam-post.md"
check "fit: task scam post gets STOP" has 04-fit-scam "stop"
check "fit: task scam named as scam" has 04-fit-scam "likely scam"

# 5 and 6. Scam checks
run 05-scam-task "/job-search:scam-check The message is in $FIX/messages/task-scam-text.md"
check "scam: task scam text is LIKELY SCAM" has 05-scam-task "likely scam"
run 06-scam-agency "/job-search:scam-check The message is in $FIX/messages/agency-recruiter.md"
check "scam: real agency email is not called a scam" hasnt 06-scam-agency "verdict[^a-z]*likely scam"
check "scam: agency email is CHECK FIRST or LOOKS REAL" has 06-scam-agency "check first|looks real"

# 7 to 9. Recruiter replies (nothing may be sent)
run 07-reply-agency "/job-search:recruiter-reply The message is in $FIX/messages/agency-recruiter.md"
check "reply A: asks questions before a call" has 07-reply-agency "pay range|budget"
check "reply A: asks for her yes on exact text" has 07-reply-agency "send this exact text"
check "reply A: pay floor not in the draft" bash -c "f=\$(grep -l 'Hi Jordan' '$JOB'/drafts/* | head -1); [ -n \"\$f\" ] && ! grep -qE '58,?000|\\\$30|\\\$34' \"\$f\""
run 08-reply-match "/job-search:recruiter-reply The message is in $FIX/messages/inhouse-recruiter-match.md"
check "reply B: says it is a real match" has 08-reply-match "real match"
check "reply B: in-house, so no do-not-submit line" bash -c "f=\$(grep -l 'Hi Morgan' '$JOB'/drafts/* | head -1); [ -n \"\$f\" ] && ! grep -qi 'submit my profile' \"\$f\""
run 09-reply-onsite "/job-search:recruiter-reply The message is in $FIX/messages/onsite-recruiter.md"
check "reply C: polite no thanks" has 09-reply-onsite "isn't a fit"
check "drafts saved, none marked sent" bash -c "ls '$JOB/drafts/' | grep -q reply && ! grep -rqiE '^sent [0-9]' '$JOB/drafts/'"

# 10. Tailor
run 10-tailor "/job-search:tailor For the Northwind Health Partners Operations Coordinator post (already fit checked)."
check "tailor: tailored.md saved" bash -c "ls '$JOB'/applications/*/tailored.md"
check "tailor: keeps About on estimates" bash -c "grep -qi 'about' '$JOB'/applications/*/tailored.md"
check "tailor: no invented tools" bash -c "! grep -qiE 'salesforce|tableau|sql|python|jira' '$JOB'/applications/*/tailored.md"

# 11. Apply, without a browser tool: fill sheet only, nothing submitted
run 11-apply "/job-search:apply For the Northwind Health Partners Operations Coordinator job. The application page is saved at $FIX/application-form.html."
check "apply: fill sheet written" bash -c "ls '$JOB'/applications/*/fill-sheet.md"
check "apply: SSN, password, DOB left for her" bash -c "grep -iE 'social security|ssn' '$JOB'/applications/*/fill-sheet.md && grep -i 'password' '$JOB'/applications/*/fill-sheet.md && grep -iE 'date of birth|dob' '$JOB'/applications/*/fill-sheet.md"
check "apply: gives her the exact submit step" has 11-apply "submit application"
check "apply: not marked submitted" bash -c "! grep -qE '\| *submitted *\|' '$JOB/tracker.md'"

# 12. Sweep, unattended, from pasted emails
cp "$FIX/inbox-paste.md" "$JOB/inbox-paste.md"
run 12-sweep "/job-search:sweep This is an unattended scheduled run: read and draft only."
check "sweep: digest written" bash -c "ls '$JOB'/digests/*.md | grep -v pasted"
check "sweep: interview request listed for her" bash -c "grep -qi 'blue pine' '$JOB'/digests/*.md"
check "sweep: equipment-check email caught as scam" bash -c "grep -iE 'scam' '$JOB'/digests/*.md | grep -qiE 'data entry|hr.department|equipment|check'"
check "sweep: pasted inbox emptied" bash -c "! grep -q 'Jordan' '$JOB/inbox-paste.md'"
check "sweep: tracker has rows" bash -c "[ \$(grep -c '^| [a-z]' '$JOB/tracker.md') -ge 4 ]"

# 13. Weekly review
run 13-weekly "/job-search:weekly-review"
check "weekly: review file written" bash -c "ls '$JOB'/reviews/*.md"
check "weekly: labels facts and guesses" bash -c "grep -qiE 'fact' '$JOB'/reviews/*.md && grep -qiE 'guess' '$JOB'/reviews/*.md"

# Keep the final job folder for reading
rm -rf "$OUT/job-folder"; cp -R "$JOB" "$OUT/job-folder"
note "=== $PASS passed, $FAIL failed (plugin: $(basename "$PLUGIN"), model: $MODEL)"
[ "$FAIL" -eq 0 ]
