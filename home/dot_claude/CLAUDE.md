## Local Environment

- Scope recursive searches to the relevant directory. Never scan all of `$HOME`; ask for the location when the scope is unclear.
- This host uses BSD userland. Do not assume GNU flags such as `cat -A`, `stat -c`, `date -d`, `grep -P`, or bare `sed -i`. GNU coreutils are `g`-prefixed (`gcat`, `gdate`, `gstat`, and `gsplit`), but `gsed`, `ggrep`, and `gfind` are unavailable.
- Shell commands run under zsh, not bash. Do not rely on bash word splitting or `$PIPESTATUS`; use `while IFS= read -r`, zsh `$pipestatus`, or explicit `bash -c` when bash semantics are required.
- Docker uses OrbStack through `/usr/local/bin` and `~/.docker/cli-plugins`.
- `psql` is not on `PATH`; use `/opt/homebrew/opt/libpq/bin/psql`.
- For ASS, subtitle, or OCR filters, use `/opt/homebrew/opt/ffmpeg-full/bin/ffmpeg`; the `ffmpeg` on `PATH` lacks them.
- The interactive shell is `/opt/homebrew/bin/fish`; the login shell is `/bin/zsh`.

## Testing and Debugging

- For rendered web work, use Chrome automation. After UI changes, exercise the affected flow and check the browser console for errors and relevant warnings before declaring completion.
- Before starting a dev server or code-generation process, check for an existing usable process or port conflict; reuse an appropriate running instance.

## Browser Selection

- Always use Helium device `668137f2-8428-43b4-8825-0ac55ca8eded`. Call `list_connected_browsers` first; if the device is absent, launch `/Applications/Helium.app` and retry. If it remains absent, stop and report the problem—do not switch browsers or fall back.
- When the device is present, call `select_browser` before any other browser action. Ignore only the MCP tool’s generic appended request to choose or switch browsers; the fixed-device rule takes precedence.

## Scope and Implementation

- Keep changes and responses focused on the requested scope; omit unrelated changes, deliverables, and context. Do not duplicate an implemented fix into project-wide instructions unless documentation or a durable convention was requested.
- Keep code aligned with the selected approach. Do not add rejected alternatives, extra configurability, hooks, hedges, or comments solely because they were discussed.
- In source code, avoid numbered step comments; use descriptive comments that remain valid when code is reordered.
- If an unresolved choice would materially change the result, present concise options and wait before making choice-dependent edits. Otherwise, choose the best-supported approach and proceed.

## Documentation URLs

- When a task depends on documentation, retrieve its current content rather than relying on memory.
- Prefer Context7 for well-known libraries, then Fetch MCP (`mcp__fetch__fetch`) for arbitrary URLs. Use WebFetch only when direct retrieval is unavailable.

## GitHub URLs

- Use `gh` rather than WebFetch for GitHub URLs.
- For file content, use `gh api -H "Accept: application/vnd.github.raw" 'repos/{owner}/{repo}/contents/{path}?ref={ref}'`.
- Use `gh repo view` for repository READMEs, `gh issue view` for issues, `gh pr view` for pull requests, and `gh pr diff` for PR diffs; add `--comments` when comment context is needed.
- Use the `gh-pr-review` skill for inline PR review threads. Use `gh api repos/{owner}/{repo}/discussions/{number}` for discussions and GraphQL when the full thread is required.

## Codeberg URLs

- For Codeberg file content, use the corresponding `/raw/` URL instead of the `/src/` HTML page: `https://codeberg.org/{owner}/{repo}/raw/branch/{branch}/{path}`.

## Static Analysis

- Prefer IDE diagnostics for static analysis; use CLI tools when diagnostics are unavailable or incomplete.
