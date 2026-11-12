---
name: code-review
description: "Review a PR, branch, or changes since a commit for standards + spec. Use when the user says \"review\", \"review this\", or \"review since X\"."
---

# Code Review

Review the diff from a fixed point to `HEAD` on two independent axes, each as a parallel sub-agent with fresh context, then report them separately.

## Fixed point

The user's commit, branch, or tag is the fixed point; ask if missing. Use `git diff <point>...HEAD`. Confirm the ref resolves and the diff is non-empty before spawning agents.

## Axis 1 — Standards

Find the repo's standards files (`CONTRIBUTING.md`, `CODING_STANDARDS.md`, docs). The repo overrides the baseline. Apply these smells as judgement calls; skip what tooling enforces:

Mysterious Name · Duplicated Code · Feature Envy · Data Clumps · Primitive Obsession · Repeated Switches · Shotgun Surgery · Divergent Change · Speculative Generality · Message Chains · Middle Man · Refused Bequest.

## Axis 2 — Spec

Locate the spec via commit issue refs → user path → `docs/`, `specs/`, `.scratch/`. If none, skip this axis and say so. Report missing/partial requirements, scope creep, and wrong implementations, quoting the spec line.

## Report

Two headings, `## Standards` and `## Spec`, findings verbatim. Do **not** merge or rerank across axes. End with one line per axis: count plus the worst issue.
