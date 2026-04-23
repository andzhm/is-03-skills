---
name: architecture-impact-check
description: Analyze how proposed changes affect Excalidraw architecture boundaries and invariants. Use when planning refactors, adding features, or changing state/rendering flow in the monorepo.
---

# Architecture Impact Check

## When to use this skill

Use when a request touches architecture-sensitive areas:
- state flow (`actionManager`, `AppState`, action files)
- rendering path (scene, renderer, canvas output)
- workspace boundaries (`excalidraw-app/` vs `packages/`)
- cross-package contracts (`@excalidraw/*`)

## Quick workflow

1. Identify touched modules and map each to one of:
   - app shell
   - core editor package
   - shared package
2. Check if state writes still happen through `actionManager.dispatch()`.
3. Check if drawing still flows through canvas rendering pipeline.
4. Call out coupling risks (new cross-package dependencies, circular imports).
5. Propose safer alternatives when a change violates boundaries.

## Output format

Return architecture feedback in this structure:

```markdown
## Architecture Impact
- Change scope:
- Invariants preserved:
- Invariants at risk:
- Boundary violations:
- Recommended adjustment:
```

## Detailed checks

Use the reference checklist for full pass/fail criteria and red flags:
- [Architecture Checklist](references/ARCHITECTURE-CHECKLIST.md)
