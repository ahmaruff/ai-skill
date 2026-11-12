---
name: explore
description: "Map an unfamiliar codebase: entry points, data flow, conventions, gotchas. Use when the user asks \"how does X work\", or when ramping into a new repo or area."
---

# Explore

Build a short, high-signal map before writing code. Finding facts is your job, not the user's.

## Axes

Dispatch parallel sub-agents, one per axis, each with a fresh context:

- **Entry points** — how it starts: CLI, routes, jobs, handlers, `main`.
- **Data flow** — trace one representative operation end to end.
- **Conventions** — layout, naming, errors, config, logging, tests.
- **Gotchas** — dead code, fragile areas, TODOs, build/test quirks.

Match axes to the question; narrow questions need one or two.

## Brief

Give each sub-agent the repo root, its axis, the question, and a word cap. Require `file:line` evidence and an explicit "could not determine X". No speculation.

## Map

Write to one Markdown file (repo convention, else pick a path): start-here files, flow with `file:line`, conventions to imitate, gotchas, open questions. Then answer the question in chat and point at the map — don't paste it.
