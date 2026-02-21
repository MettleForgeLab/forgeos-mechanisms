#!/usr/bin/env bash
set -euo pipefail
echo "[det] forgeos-mechanisms checks"

req=(
  "forge-deps.yaml"
  "schemas/commit_record.schema.json"
  "docs/CONTROL_PLANE_STATE_MACHINE.md"
  "docs/DETERMINISTIC_REPLAY_SPEC.md"
  "docs/SUBSTRATE_GUARANTEES.md"
  "scripts/replay_harness.sh"
)

missing=()
for f in "${req[@]}"; do
  [[ -f "$f" ]] || missing+=("$f")
done

if [[ ${#missing[@]} -gt 0 ]]; then
  echo "[det] FAIL missing files:"
  printf '  - %s\n' "${missing[@]}"
  exit 1
fi

# crude guardrail: no domain content markers in mechanisms repo
if grep -R "ROLE:" -n . >/dev/null 2>&1; then
  echo "[det] FAIL: domain/role markers detected in mechanisms repo"
  exit 1
fi

echo "[det] OK"