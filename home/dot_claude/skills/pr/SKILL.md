---
allowed-tools: Bash(git status*), Bash(git diff*), Bash(git log*), Bash(gh *), Bash(echo*), Read
argument-hint: [base-branch]
description: Write PR message for current branch
---

## Arguments

- Base branch argument: $0

## Context

- Status: !`git status -sb`
- Recent commits: !`git log --oneline -5`

## Task

Write a PR message:

- Base branch: if the base branch argument above is non-empty, use it exactly; otherwise use `main` or `master`
- Use `git diff <base-branch>...HEAD` and `git log` against base branch to understand full changes
- Check for project contributing guidelines (CLAUDE.md, CONTRIBUTING.md) and follow any PR conventions
- Title in first line without any heading
- Description in subsequent lines
- Copy the message to clipboard with `echo -n "<message>" | pbcopy`
- Run: `gh pr create --title "<title>" --body "<body>"`
- Do not ask for confirmation — create the PR directly
