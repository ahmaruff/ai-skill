---
name: codebase-design
description: "Design deep modules (small interface, lots of hidden behaviour). Use when designing a module's interface, deciding how to split or structure code, placing a seam, or improving testability."
---

# Codebase Design

Design **deep modules**: lots of behaviour behind a small interface, at a clean seam. Use this language exactly.

## Terms

- **Module** — anything with an interface and implementation (function, class, package, slice).
- **Interface** — everything a caller must know: signature, invariants, ordering, errors, config, performance.
- **Seam** — where an interface lives; a place you can change behaviour without editing in place.
- **Depth** — leverage at the interface: behaviour per unit of interface. Deep = small interface, large implementation.
- **Adapter** — a concrete thing satisfying an interface (role, not substance).

## Principles

- Depth is a property of the interface; a deep module can hide small swappable parts.
- **Deletion test**: if deleting it makes complexity vanish, it was a pass-through; if complexity scatters to callers, it earned its keep.
- The interface is the test surface; callers and tests cross the same seam.
- **One adapter = hypothetical seam; two = real.** Don't add a seam until something varies across it.

## Testability

- Accept dependencies, don't create them.
- Return results, don't mutate.
- Small surface: fewer methods, fewer params.

## Avoid

Shallow modules (interface as complex as implementation), and "boundary" (say seam or interface).
