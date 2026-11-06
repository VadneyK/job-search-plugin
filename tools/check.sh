#!/usr/bin/env bash
# Text check for everything committed: no em or en dashes, no real people's details.
# Fixtures may use example.com addresses and 555-01xx numbers only.
set -uo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
FILES=$(git ls-files -co --exclude-standard | grep -vE '^(dist/|tools/check\.sh$|LICENSE$)')
fail=0
say() { echo "CHECK FAIL: $*"; fail=1; }

# 1. Dashes
hits=$(printf '%s\n' "$FILES" | tr '\n' '\0' | xargs -0 grep -nP '\x{2013}|\x{2014}' 2>/dev/null)
[ -n "$hits" ] && say "em or en dash found:" && echo "$hits"

# 2. Denylist: the source system this was generalized from, and anyone it must not name.
DENY='kentaro|vadney|veru|insomniac|acts2|alameda|calendly\.com/|belden|centigrade|carbonsustain|mercor|coleman|braintrust|a\.team|wellfound|turing\.com|\bdia\b|9444|\bk20\b|\bk5\b|job hub|artifactdata|bibiane|berkeley|\$110|\$90/|187k'
# The repo's own public address is the one allowed use of the owner's handle.
hits=$(printf '%s\n' "$FILES" | tr '\n' '\0' | xargs -0 grep -niE "$DENY" 2>/dev/null | sed 's#VadneyK/job-search-plugin#<this repo>#g' | grep -iE "$DENY")
[ -n "$hits" ] && say "denylisted term found:" && echo "$hits"

# 3. Emails outside example domains, and phone numbers outside 555-01xx
hits=$(printf '%s\n' "$FILES" | tr '\n' '\0' | xargs -0 grep -noiE '[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}' 2>/dev/null \
  | grep -viE '@([a-z0-9-]+\.)*example\.com$|^.*:hr\.department\.hiring2026@gmail\.com$' )
[ -n "$hits" ] && say "email outside example.com:" && echo "$hits"
hits=$(printf '%s\n' "$FILES" | tr '\n' '\0' | xargs -0 grep -noE '\(?\b[0-9]{3}\)?[ .-][0-9]{3}[ .-][0-9]{4}\b' 2>/dev/null | grep -vE '555[ .-]01[0-9]{2}')
[ -n "$hits" ] && say "phone number outside 555-01xx:" && echo "$hits"

# 4. Git history: author and committer emails, and commit messages
if git rev-parse --git-dir >/dev/null 2>&1; then
  hist=$(git log --all --format='%ae%n%ce%n%s%n%b' | grep -v '^57117207+VadneyK@users\.noreply\.github\.com$')
  hits=$(printf '%s\n' "$hist" | grep -niE "$DENY")
  [ -n "$hits" ] && say "denylisted term in git history:" && echo "$hits"
  hits=$(printf '%s\n' "$hist" | grep -oiE '[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}' | grep -viE '@([a-z0-9-]+\.)*example\.com$|users\.noreply\.github\.com$')
  [ -n "$hits" ] && say "email in git history:" && echo "$hits"
fi

# 5. Manifests
claude plugin validate . >/dev/null || say "marketplace manifest invalid"
claude plugin validate plugins/job-search >/dev/null || say "plugin manifest invalid"

[ $fail -eq 0 ] && echo "check: clean ($(printf '%s\n' "$FILES" | wc -l | tr -d ' ') files)"
exit $fail
