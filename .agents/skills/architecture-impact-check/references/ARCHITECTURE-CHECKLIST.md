# Architecture Checklist

Use this checklist when validating architecture impact in Excalidraw changes.

## 1) State management invariants

- [ ] State changes are initiated via `actionManager.dispatch()`.
- [ ] No Redux, Zustand, MobX, or other global store was introduced.
- [ ] `AppState` contract remains coherent with readers/writers.
- [ ] Changes avoid hidden state writes inside render helpers.

## 2) Rendering invariants

- [ ] Drawing output remains in canvas rendering pipeline.
- [ ] No React DOM-based replacement of core drawing behavior.
- [ ] Scene updates and render timing are not coupled to UI side effects.
- [ ] Performance-sensitive loops avoid unnecessary object churn.

## 3) Monorepo boundaries

- [ ] `excalidraw-app/` changes are app-runtime specific.
- [ ] reusable editor logic stays in `packages/excalidraw/` or shared packages.
- [ ] Imports use existing package boundaries and aliases.
- [ ] New dependencies between packages are justified and minimal.

## 4) API and contracts

- [ ] Public APIs are backward compatible or explicitly documented.
- [ ] Type-level changes are reflected in relevant call sites/tests.
- [ ] Data shape migrations include restore/serialization considerations.

## 5) Review output guidance

When issues are found:
1. Name the violated invariant.
2. Describe practical runtime risk.
3. Provide one low-risk alternative implementation path.
