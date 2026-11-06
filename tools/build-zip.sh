#!/usr/bin/env bash
# Builds dist/job-search.zip: the file to upload in the Claude app (Customize, Plugins, Upload plugin).
# The zip holds one plugin with .claude-plugin/plugin.json at its top level.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$ROOT/dist"
rm -f "$ROOT/dist/job-search.zip"
( cd "$ROOT/plugins/job-search" && zip -qr -X "$ROOT/dist/job-search.zip" . -x '.DS_Store' )
claude plugin validate "$ROOT/plugins/job-search" >/dev/null
echo "$ROOT/dist/job-search.zip ($(du -h "$ROOT/dist/job-search.zip" | cut -f1))"
