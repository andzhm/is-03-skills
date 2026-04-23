#!/usr/bin/env bash
set -euo pipefail

TARGET_PATH="${1:-}"

echo "== Excalidraw skill checks =="
if [[ -n "${TARGET_PATH}" ]]; then
  echo "Target path: ${TARGET_PATH}"
else
  echo "Target path: <none>"
fi

echo
echo "1) Baseline lint"
yarn test:code

echo
echo "2) Baseline typecheck"
yarn test:typecheck

if [[ -n "${TARGET_PATH}" ]]; then
  echo
  echo "3) Targeted tests"
  yarn test:app -- "${TARGET_PATH}"
else
  echo
  echo "3) No target specified, skipping targeted tests"
fi

echo
echo "== Summary =="
echo "- lint: pass"
echo "- typecheck: pass"
if [[ -n "${TARGET_PATH}" ]]; then
  echo "- targeted tests: pass"
else
  echo "- targeted tests: skipped"
fi
