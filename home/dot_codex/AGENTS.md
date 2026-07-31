## Local Environment

- Scope recursive searches to the relevant directory. Never scan all of `$HOME`; ask for the location when the scope is unclear. Prefer `rg` and `rg --files`.
- This host uses BSD userland. Do not assume GNU flags; BSD `sed -i` requires an explicit extension. Installed GNU coreutils are `g`-prefixed (`gcat`, `gdate`, `gstat`, and `gsplit`), but `gsed`, `ggrep`, and `gfind` are unavailable.
- Codex shell commands default to zsh, not bash. Do not rely on bash word splitting or `$PIPESTATUS`; use `while IFS= read -r`, zsh `$pipestatus`, or explicit `bash -c` when bash semantics are required.
- `psql` is not on `PATH`; use `/opt/homebrew/opt/libpq/bin/psql`.
- For ASS, subtitle, or OCR filters, use `/opt/homebrew/opt/ffmpeg-full/bin/ffmpeg`; the `ffmpeg` on `PATH` lacks them.

## Testing and Debugging

- For rendered web UI work whose affected flow is accessible, use Codex browser automation. After UI changes, exercise that flow and, when browser tooling exposes them, check for new console or runtime errors and relevant warnings before declaring completion.
- Before starting a long-running dev server or watcher, check for an existing usable process or port conflict; reuse an appropriate running instance.

## Scope and Implementation

- Keep changes and responses focused on the requested scope; omit unrelated changes, deliverables, and context.
- Keep code aligned with the selected approach. Do not add rejected alternatives, extra configurability, hooks, or comments solely because they were discussed.
- In source code, avoid numbered step comments; use descriptive comments that remain valid when code is reordered.
- If an unresolved choice would materially change the result, present concise options and wait before making choice-dependent edits. Otherwise, choose the best-supported approach and proceed.

## External Sources

- For version-sensitive technical claims, verify against current primary documentation for the relevant version.
- For Codeberg file content, use the corresponding `/raw/` URL or `git` instead of scraping the `/src/` HTML page.
