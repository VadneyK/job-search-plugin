"""Summarize per-step metrics from `claude -p --output-format json` results in a results folder.
Usage: python3 tests/metrics.py <results dir>   (prints a Markdown table)"""
import glob, json, os, sys

d = sys.argv[1]
rows = []
for p in sorted(glob.glob(os.path.join(d, "*.json"))):
    try:
        j = json.load(open(p))
    except ValueError:
        continue
    if "duration_ms" not in j:
        continue
    u = j.get("usage", {}) or {}
    tin = (u.get("input_tokens") or 0) + (u.get("cache_read_input_tokens") or 0) + (u.get("cache_creation_input_tokens") or 0)
    rows.append((os.path.basename(p)[:-5], j["duration_ms"] / 1000.0, j.get("num_turns", 0), tin, u.get("output_tokens") or 0, j.get("total_cost_usd") or 0.0))

print("| Step | Seconds | Turns | Input tokens (incl. cache) | Output tokens | API-price equivalent (USD) |")
print("|---|---|---|---|---|---|")
for r in rows:
    print("| %s | %.0f | %d | %d | %d | %.2f |" % r)
if rows:
    tot = [sum(r[i] for r in rows) for i in (1, 2, 3, 4, 5)]
    print("| **Total** | %.0f | %d | %d | %d | %.2f |" % tuple(tot))
print()
print("API-price equivalent is what the same tokens would cost on the API. A Pro plan is not billed per token; it is the best available yardstick for how much of a usage window a step uses.")
