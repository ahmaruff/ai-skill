---
name: implement
description: "Write or change code: pin the contract, test first, make the smallest change, verify, hand off the diff. Use when the user asks to build, add, implement, fix, refactor, or clean up code."
---

# Implement

You write the code; the user reviews the diff line by line and commits. Do not commit, push, or open a PR.

## Contract first

State in one or two sentences what must change: input, observable output, error modes, and what must *not* change. If it is ambiguous or hides a design decision, resolve it first (`grilling`, or ask) — don't guess.

Find the seam: the smallest interface a test can call. If none exists, say so — that's a design finding.

## Small steps

Make one small, verifiable change at a time, test first:

1. Write a failing test at the seam; watch it fail for the right reason.
2. Make the smallest change that turns it green.
3. Run the new test and the full relevant suite; run the repo's lint/typecheck.
4. Repeat.

Never a big-bang edit tested only at the end.

## Refactoring (behavior-preserving)

When only structure moves and behavior stays fixed: add characterization tests that pin current behavior first, then take the smallest green step (rename, extract, inline, move), running the suite after each. If a step goes red, revert it — don't debug forward.

## Hand off

Show the diff (`git diff`) and state what changed, what it proves, and anything you deliberately left out. Leave commit and push to the user.
