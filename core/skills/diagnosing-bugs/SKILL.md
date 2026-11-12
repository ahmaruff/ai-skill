---
name: diagnosing-bugs
description: Diagnose or debug a bug. Use when the user says "diagnose", "debug this", or reports something broken, failing, or slow.
---

# Diagnosing Bugs

Read `GLOSSARY.md` and nearby ADRs first. Show commands and output, but **redact secrets** as `<REDACTED>`.

## 1. Build a red-capable loop

This is the skill; everything else is mechanical. Construct a tight pass/fail signal that goes red on *this* bug: a failing test, a curl script, a CLI fixture diff, a headless-browser assert, a replayed trace, or a throwaway harness. Tighten it until it is deterministic, a few seconds fast, and agent-runnable.

Done when you can name **one command** you have already run that asserts the user's exact symptom. No red-capable command, no theorising.

If you cannot build a loop, stop and ask for environment access or a captured artifact.

## 2. Reproduce and minimise

Run it; confirm it fails the way the user described. Then cut inputs, config, and steps one at a time until every remaining element is load-bearing.

## 3. Hypothesise

Write 3–5 ranked, falsifiable hypotheses ("If X, then Y makes it disappear"). Show the ranking to the user before testing.

## 4. Instrument

Change one variable at a time. Prefer a debugger over logs; if logging, tag every line `[DEBUG-xxxx]`. For perf, measure a baseline and bisect instead.

## 5. Fix and lock down

Write a regression test at a seam that exercises the real bug path *before* the fix; watch it fail, fix, watch it pass. If no correct seam exists, say so — that's an architecture finding.

## 6. Clean up

Re-run the original loop; remove all `[DEBUG-*]` (`grep`); delete throwaway harnesses. State the confirmed cause in the handoff.
