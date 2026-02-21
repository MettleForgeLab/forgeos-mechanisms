#!/usr/bin/env bash
set -euo pipefail

FIXTURE="${FIXTURE:-tests/fixtures/min_scroll.yaml}"

[[ -f "$FIXTURE" ]] || { echo "[replay] missing fixture $FIXTURE"; exit 1; }

h1=$(sha256sum "$FIXTURE" | awk '{print $1}')
sleep 1
h2=$(sha256sum "$FIXTURE" | awk '{print $1}')

if [[ "$h1" != "$h2" ]]; then
  echo "[replay] FAIL: hash mismatch"
  echo " h1=$h1"
  echo " h2=$h2"
  exit 1
fi

echo "[replay] PASS"