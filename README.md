# AI Skill Repository

A compact library of reusable skills for working with AI as a technical partner. The agent investigates and writes code; **you review every diff line by line and commit manually.**

The bias throughout: small, incremental changes; evidence over guesswork; explicit reasoning.

## Skills

### Think

- `code-review` — review a diff on two axes: standards and spec
- `codebase-design` — design deep modules, place seams, improve testability
- `diagnosing-bugs` — build a red-capable loop, minimise, hypothesise, fix
- `domain-modeling` — sharpen terms in `GLOSSARY.md`, record decisions as ADRs
- `research` — gather evidence from primary sources into Markdown
- `grilling` — stress-test a plan by interviewing the user
- `grill-with-docs` — grilling + domain-modeling in one pass

### Do

- `explore` — map an unfamiliar codebase: entry points, data flow, conventions, gotchas
- `implement` — pin the contract, test first, smallest change, verify, hand off the diff (includes refactoring)

### Meta

- `wait-what` — pause and re-pitch the last message in plain language (manual only)

`/skills` routes a task to the right skill.

## Repo structure

```text
core/
├── AGENTS.md
├── skills/
│   ├── code-review/
│   ├── codebase-design/
│   ├── diagnosing-bugs/
│   ├── domain-modeling/
│   ├── explore/
│   ├── grill-with-docs/
│   ├── grilling/
│   ├── implement/
│   ├── research/
│   └── wait-what/
└── command/          # thin slash-command wrappers that load a skill
```

`core/AGENTS.md` is the shared operating guidance: be critical, investigate before acting, prefer simple correct solutions, verify claims.

## Install / update

This repo lives on disk and is symlinked into opencode's global config. The sync script is idempotent and prunes links for deleted skills:

```bash
git clone git@github.com:ahmaruff/ai-skill.git ~/ai-skill
~/ai-skill/bin/sync.sh          # create/refresh symlinks, prune stale ones
~/ai-skill/bin/sync.sh --check  # report drift; exit non-zero if out of sync
```

It links `core/AGENTS.md`, every `core/skills/<name>/`, and every `core/command/*.md` into `~/.config/opencode/`. Set `OPENCODE_CONFIG_DIR` to target a different config directory. Restart opencode after syncing.

## How to use

1. Pick the skill that matches the task, or run `/skills` to have the assistant route it.
2. Most skills are model-invocable from their `description`; slash commands are explicit entry points.
3. Keep the engineering bias: challenge assumptions, verify evidence, prefer clarity over complexity.
