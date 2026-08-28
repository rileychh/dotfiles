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

# GitHub

- Use the `gh-pr-review` skill only for review-thread operations unavailable through the standard GitHub tools, including replies, resolve/unresolve, pending inline comments, and review submission. Use `gh` directly only when no specialized operation exists.

# Codeberg URLs

- For Codeberg file content, use the corresponding `/raw/` URL instead of the `/src/` HTML page: `https://codeberg.org/{owner}/{repo}/raw/branch/{branch}/{path}`.
