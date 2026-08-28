---
name: pr-submission
description: Draft, review, and submit GitHub pull requests without rewriting the approved body. Use whenever the user asks for a PR message, wants to review a PR before submission, or asks to submit/create/open a PR.
---

# PR Submission

Keep the reviewed body as the source of truth through submission.

## Draft for review

1. Inspect the branch, working tree, commit scope, repository PR conventions, and likely base branch. For stacked work, check whether the parent branch has an open PR.
2. Write only the proposed body to `local://pr-body.md`. Present the proposed title in chat.
3. Open `local://pr-body.md` with the system `open` command so the user can review and edit it. Do not create a PR until the user explicitly approves or asks to submit it.
4. Apply requested body revisions directly to `local://pr-body.md` so submission reuses the reviewed text.

## Submit after approval

1. Confirm the work is committed and the branch is pushed. Never include unrelated changes.
2. Check for an existing PR from the current branch to avoid duplicates.
3. Select the actual base branch from ancestry and stacked-PR context; do not assume `main`.
4. Create the PR with the approved title from the conversation and `local://pr-body.md` via `gh pr create --body-file`.
5. Report the PR URL, head branch, and base branch.

Do not rewrite, summarize, or regenerate the reviewed PR body during submission.
