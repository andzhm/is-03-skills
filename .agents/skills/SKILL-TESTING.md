# Skill Testing Guide

This document defines how to validate skills added in `.agents/skills`.

## Scope

Skills covered:
- `creating-excalidraw-components`
- `architecture-impact-check`
- `testing-workflow-automation`
- `pr-review-excalidraw`

## Manual discovery test

1. Start an agent in this repository.
2. Prompt with one trigger per skill:
   - component creation request
   - architecture/refactor risk request
   - run verification checks request
   - review diff/PR request
3. Confirm the agent behavior matches the skill workflow and output format.

Expected result:
- correct skill gets selected for each prompt
- linked reference/script paths are used correctly

## Script path test

For `testing-workflow-automation`, validate script wiring:

```bash
bash .agents/skills/testing-workflow-automation/scripts/run-skill-checks.sh
```

Expected result:
- script starts and runs lint + typecheck commands
- output prints final summary block

## Reference path test

For `architecture-impact-check`, validate reference loading:

1. Ask the agent for an architecture-impact review.
2. Confirm response uses checklist concepts from:
   - `references/ARCHITECTURE-CHECKLIST.md`

## Quality gates

Before considering skill updates complete:
- skill `name` is lowercase-hyphenated
- `description` contains both WHAT and WHEN usage
- `SKILL.md` remains concise and actionable
- all referenced files are one level deep from `SKILL.md`
