# Local Environment

- Scope recursive searches to the relevant directory. Never scan all of `$HOME`; ask for the location when the scope is unclear.
- This host uses BSD userland. Do not assume GNU flags such as `cat -A`, `stat -c`, `date -d`, `grep -P`, or bare `sed -i`. GNU coreutils are `g`-prefixed (`gcat`, `gdate`, `gstat`, and `gsplit`), but `gsed`, `ggrep`, and `gfind` are unavailable.
- Shell commands run under zsh, not bash. Do not rely on bash word splitting or `$PIPESTATUS`; use `while IFS= read -r`, zsh `$pipestatus`, or explicit `bash -c` when bash semantics are required.
- Docker uses OrbStack through `/usr/local/bin` and `~/.docker/cli-plugins`.
- `psql` is not on `PATH`; use `/opt/homebrew/opt/libpq/bin/psql`.
- For ASS, subtitle, or OCR filters, use `/opt/homebrew/opt/ffmpeg-full/bin/ffmpeg`; the `ffmpeg` on `PATH` lacks them.
- The interactive shell is `/opt/homebrew/bin/fish`; the login shell is `/bin/zsh`.

# Testing and Debugging

- After rendered web UI changes, exercise the affected flow and check the browser console for errors and relevant warnings before declaring completion.
- Before starting a dev server or code-generation process, check for an existing usable process or port conflict; reuse an appropriate running instance.

# Version Control

- When writing a commit message, follow the repository's existing commit-message conventions. Inspect recent commits when the convention is unclear.
- When branch history, divergence, rebasing intent, or the correct push strategy is uncertain, stop and ask what to preserve before rebasing, resetting, merging, or force-pushing.

# GitHub

- Prefer GitHub MCP for supported GitHub operations, except when creating or updating an issue or pull request with a reviewed message: use `gh issue create`/`gh issue edit` or `gh pr create`/`gh pr edit` with `--body-file` so the proposed body is submitted verbatim instead of being reconstructed. Use `gh api` only when MCP and these exact-body commands lack the action. After addressing multiple comments from one PR review, batch the replies into a pending review via `gh api` because MCP replies send immediately. Keep `pr://` and built-in tooling for reads, diffs, checkouts, and pushes.
- Before creating an issue or pull request, inspect templates, conventions, and related items. Present the title, write only the body to `local://ISSUE.md` or `local://PR.md`, and submit the exact reviewed title and body only after explicit approval. When requesting approval, provide the written file path and never repeat its body inline; the user reviews the file directly. Pass the resolved local file directly through `gh`'s `--body-file`; never copy, regenerate, or rewrite the reviewed body into command arguments or another tool call. For pull requests, also verify the work is committed and pushed, exclude unrelated changes, avoid duplicates, derive the correct base, and report the URL, head, and base.

# Online Actions

- Never push commits, post comments, submit reviews, resolve or unresolve threads, or perform any other online interaction as the user unless the user explicitly approves the action.

# Codeberg URLs

- For Codeberg file content, use the corresponding `/raw/` URL instead of the `/src/` HTML page: `https://codeberg.org/{owner}/{repo}/raw/branch/{branch}/{path}`.
