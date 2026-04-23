---
name: pr-review-excalidraw
description: Review Excalidraw code changes for correctness, regressions, architecture safety, and test coverage. Use when the user asks for a review of a diff, branch, or pull request.
---

# PR Review for Excalidraw

## When to use this skill

Use when reviewing:
- local diffs before commit
- pull requests
- risky refactors in rendering/state paths

## Review priorities

1. Correctness and regression risk
2. Architecture invariants (state and rendering)
3. Security and data safety implications
4. Test completeness for changed behavior
5. Maintainability and readability

## Findings format

Start with findings ordered by severity:

```markdown
## Findings
- [high] ...
- [medium] ...
- [low] ...

## Open questions
- ...

## Change summary
- ...
```

## Excalidraw-specific checks

- Verify state writes still use `actionManager`.
- Ensure rendering behavior changes have tests or manual verification notes.
- Check for unintended package boundary coupling.
- Confirm no protected core behavior is modified casually.
