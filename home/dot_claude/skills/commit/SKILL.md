---
allowed-tools: Bash(git status*), Bash(git diff*), Bash(git log*), Bash(echo*)
argument-hint: [type] [scope]
description: Write a Conventional Commits style commit message
---

## Arguments

- Type argument: $0
- Scope argument: $1

## Context

- Status: !`git status -sb`
- Changed files: !`git diff --staged --compact-summary`
- Staged changes (first 500 lines): !`git diff --staged | head -n 500`
- Recent commits: !`git log --oneline -5`

Read source files using the Read tool if the diff is truncated.

## Task

Write a commit message and run `git commit`:

- Use Conventional Commits format
- Type: if the type argument above is non-empty, use it exactly; otherwise analyze changes to determine type (feat/fix/chore/docs/style/refactor/test/etc.)
- Scope: if the scope argument above is non-empty and not "none", include it as `(scope)`; otherwise omit the scope entirely
- Check for project contributing guidelines (CLAUDE.md, CONTRIBUTING.md) and follow any commit message conventions
- Format: `type: description` or `type(scope): description`
- Copy the message to clipboard with `echo -n "<message>" | pbcopy`
- Run: `git commit -m "<message>"`
- Do not ask for confirmation — commit directly
- Do not include Co-Authored-By lines
