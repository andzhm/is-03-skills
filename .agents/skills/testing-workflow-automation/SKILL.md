---
name: testing-workflow-automation
description: Run focused and full Excalidraw validation workflows using project scripts. Use when implementing features, fixing bugs, or preparing merge-ready changes with reproducible verification.
---

# Testing Workflow Automation

## When to use this skill

Use when changes are ready for verification and you need consistent checks:
- after feature implementation
- before creating a commit or PR
- when CI-like failures must be reproduced locally

## Validation flow

1. Run targeted checks first for touched area.
2. Run core quality checks:
   - `yarn test:code`
   - `yarn test:typecheck`
3. If editor-impacting or broad changes exist, run `yarn test:all`.
4. Summarize pass/fail status with failing command and actionable next step.

## Utility script

Use script-based command selection to avoid repeating manual triage:

```bash
bash scripts/run-skill-checks.sh packages/excalidraw/components
```

Script behavior:
- if a path argument is given, runs nearest relevant tests first
- always runs lint + typecheck baseline
- prints a final checklist summary

## Reporting format

```markdown
## Verification
- Targeted checks:
- Baseline checks:
- Broad checks:
- Result:
- Follow-up needed:
```
