---
name: domain-modeling
description: Define domain terms in GLOSSARY.md and record decisions as ADRs. Use when discussing codebase terminology or editing GLOSSARY.md / ADRs.
---

# Domain Modeling

Build and sharpen the domain model as you design. This is the *active* discipline: changing the model, not just reading it.

## During the session

- **Challenge** terms that conflict with `GLOSSARY.md`: "you said X, the glossary says Y — which?"
- **Sharpen** vague or overloaded words into one canonical term.
- **Stress-test** with concrete edge-case scenarios that force precise boundaries.
- **Cross-check** claims against the code; surface contradictions.

## Write it down

- Update `GLOSSARY.md` the moment a term resolves (format in `GLOSSARY-FORMAT.md`). Glossary only — no implementation details, no specs.
- Create files lazily; follow `GLOSSARY-MAP.md` for multi-context repos.
- Offer an ADR (format in `ADR-FORMAT.md`) only when all three hold: hard to reverse, surprising without context, a real trade-off.
