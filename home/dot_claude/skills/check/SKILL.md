---
allowed-tools: Bash(git status*), Bash(git diff*), Bash(git log*)
description: Review staged changes and provide feedback
---

## Context

- Status: !`git status -sb`
- Changed files: !`git diff --staged --compact-summary`
- Staged changes (first 500 lines): !`git diff --staged | head -n 500`

Read source files using the Read tool if the diff is truncated.

## Task

Review the staged changes and provide:

- Observations about code quality, consistency, or potential issues
- Suggestions for improvements if any (accessibility, security, best practices)
- Keep feedback concise and actionable
