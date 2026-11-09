# AI Skill Repository

This repository is a compact library of practical skills for working with AI as a technical partner. It is designed for software engineering tasks that require careful reasoning, investigation, design, and documentation.

The goal is simple: provide reusable prompts and guidance patterns that help an assistant think more like a strong engineering collaborator instead of a generic chatbot.

## What is in here?

The repo is organized under `core/` and contains a set of skills for common engineering workflows:

- `code-review` — review code critically and look for correctness, risk, and maintainability issues
- `codebase-design` — reason about architecture, boundaries, and system structure
- `diagnosing-bugs` — investigate failures systematically and narrow to root cause
- `domain-modeling` — clarify business concepts, vocabulary, and domain boundaries
- `grill-with-docs` — use documentation as a source of truth while challenging assumptions
- `grilling` — pressure-test ideas, answers, and implementation decisions
- `research` — gather and synthesize technical evidence before making decisions
- `wait-what` — pause and re-evaluate assumptions when something seems off

## Repo structure

```text
core/
├── AGENTS.md
└── skills/
    ├── code-review/
    ├── codebase-design/
    ├── diagnosing-bugs/
    ├── domain-modeling/
    ├── grill-with-docs/
    ├── grilling/
    ├── research/
    └── wait-what/
```

`core/AGENTS.md` provides the general operating guidance for how the assistant should behave: be critical, investigate before acting, prefer simple correct solutions, and verify claims.

Each skill folder contains a focused playbook or template for a specific workflow, sometimes paired with supporting formats like ADRs, glossaries, and checklists.

## How to use this repo

1. Pick the skill that matches the task.
2. Read the relevant `SKILL.md` or related format file.
3. Apply the guidance to a prompt, architecture review, bug investigation, design discussion, or research task.
4. Keep the engineering bias: challenge assumptions, verify evidence, and prefer clarity over complexity.

## Why this exists

This repo is meant to make AI assistance more useful in real engineering work. The emphasis is on:

- correctness over speed
- evidence over guesswork
- simple, durable decisions over clever but fragile abstractions
- explicit reasoning and clear communication

## Notes

This is a knowledge repository, not an application or service. It is best used as a reference set of reusable operating patterns for AI-assisted engineering work.
