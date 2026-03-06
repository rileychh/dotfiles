---
name: gh-pr-review
description: View and manage inline GitHub PR review comments with full thread context from the terminal
---

# gh-pr-review

GitHub CLI extension for inline PR review comment access with LLM-friendly JSON output.

When inside a git repo, `-R owner/repo` and PR number are inferred automatically from the remote and current branch.

## Commands

### View reviews and threads

```sh
gh pr-review review view [<pr-number>] [--unresolved] [--not_outdated] [--reviewer <login>] [--states APPROVED|CHANGES_REQUESTED|COMMENTED|DISMISSED] [--tail <n>] [--include-comment-node-id]
```

### Reply to a thread

```sh
gh pr-review comments reply [<pr-number>] --thread-id <PRRT_...> --body "message"
```

### List threads

```sh
gh pr-review threads list [<pr-number>] [--unresolved] [--mine]
```

### Resolve/unresolve threads

```sh
gh pr-review threads resolve [<pr-number>] --thread-id <PRRT_...>
gh pr-review threads unresolve [<pr-number>] --thread-id <PRRT_...>
```

### Create and submit reviews

```sh
# Start pending review
gh pr-review review --start [<pr-number>]

# Add inline comment
gh pr-review review --add-comment [<pr-number>] --review-id <PRR_...> --path <file> --line <num> --body "comment"

# Submit review
gh pr-review review --submit [<pr-number>] --review-id <PRR_...> --event <APPROVE|REQUEST_CHANGES|COMMENT> --body "summary"
```

## Output

All commands return structured JSON. IDs use GraphQL format: `PRR_...` (reviews), `PRRT_...` (threads), `PRRC_...` (comments with `--include-comment-node-id`). Thread replies sorted by `created_at` ascending. Empty arrays when no data matches filters.

## Tips

- Use `--unresolved --not_outdated` to focus on actionable comments
- Use `--tail 1` to reduce output by keeping only latest replies per thread
- Save `thread_id` values from `review view` output for replying/resolving
