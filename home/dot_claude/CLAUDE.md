## Git Operations

- Read-only git commands (diff, status, log, branch, show, etc.) can be run freely
- State-changing git commands (add, commit, push, rebase, reset, branch -D, etc.) require explicit user instruction

## Commit and PR Messages

- Do not include self-attribution or Co-Authored-By lines
- Do not mention that the changes were made by Claude or AI assistance
- Write commit messages from the perspective of the developer/user

## Testing and Debugging

- For web projects, use Chrome browser automation tools to test and debug rendered pages
- When implementing UI changes in web projects, verify the result in Chrome before considering the task complete
- Check browser console for errors and warnings during testing
- Before starting dev servers or code generation processes, check if one is already running to avoid port conflicts and duplicate processes

## Vue.js Ref Unwrapping

- In Vue templates, refs are automatically unwrapped - do NOT use `.value`
- In script sections (setup, computed, watch, etc.), you MUST use `.value` to access ref values
- Example:
  ```vue
  <script setup>
  const count = ref(0)
  console.log(count.value) // ✓ Correct in script
  </script>

  <template>
    <div>{{ count }}</div> <!-- ✓ Correct in template (no .value) -->
    <div>{{ count.value }}</div> <!-- ✗ Wrong in template -->
  </template>
  ```

## Code Comments

- Do not use numbered list comments (e.g., `// 1. First step`, `// 2. Second step`)
- Numbered comments create unnecessary diffs when reordering and are difficult to maintain when inserting items
- Use plain descriptive comments instead
- Example:
  ```
  // ✗ Avoid
  // 1. Initialize
  // 2. Process

  // ✓ Prefer
  // Initialize
  // Process
  ```

## Presenting Options and Plans

- When presenting multiple approaches or options to the user, do not make any file changes until the user selects their preferred option
- This includes using Edit, Write, or any other file modification tools
- Present the options clearly, explain trade-offs, then wait for user confirmation before proceeding
- Only make file changes after the user has explicitly chosen an approach
- Example workflow:
  - ✓ Present 2-3 options with pros/cons → Wait for user choice → Implement chosen option
  - ✗ Present options while simultaneously making file changes

## Documentation URLs

- Do not rely on cached knowledge or assumptions about what the documentation contains
- Ensure responses are based on the actual current content of the documentation
- Priority order for fetching documentation:
  - **Context7** — use first for well-known libraries (resolves library ID, then queries docs)
  - **Fetch MCP** (`mcp__fetch__fetch`) — use for arbitrary URLs; returns content as markdown or raw HTML. Increase `max_length` for long pages (default 5000)
  - **WebFetch** — last resort only; it summarizes content through an AI model and loses code examples and details

## GitHub URLs

- When given a GitHub URL, use `gh` CLI instead of WebFetch — it returns raw content without summarization
- **File content** (`github.com/{owner}/{repo}/blob/{ref}/{path}`):
  ```bash
  gh api -H "Accept: application/vnd.github.raw" repos/{owner}/{repo}/contents/{path}?ref={ref}
  ```
- **Repository README**: `gh repo view {owner}/{repo}`
- **Issues**: `gh issue view {number} -R {owner}/{repo}` (add `--comments` for comments)
- **Pull requests**: `gh pr view {number} -R {owner}/{repo}` (add `--comments` for comments)
- **PR review comments**: use the `/gh-pr-review` skill for inline review comments with full thread context
- **PR diff**: `gh pr diff {number} -R {owner}/{repo}`
- **Discussions**: `gh api repos/{owner}/{repo}/discussions/{number}` (requires GraphQL for full threads)

## Codeberg URLs

- Codeberg serves AI-poisoned garbage content on `/src/` paths (the web view) — do not use those URLs
- Instead, use the `/raw/` path to get actual file content: `https://codeberg.org/{owner}/{repo}/raw/branch/{branch}/{path}`

## Static Analysis

- Use IDE diagnostics for static analysis instead of running CLI tools from the terminal. IDE diagnostics are faster and already available in real-time.

## Bash Commands

- Do not chain multiple commands with `;`, `&&`, or `||` in a single Bash call — permission is matched against the entire command string, so chaining triggers a permission prompt even if each command is individually allowed
- Instead, use separate parallel Bash tool calls for independent commands, or sequential calls when order matters

## CLI Tools

- `jq` - JSON processor for parsing and transforming JSON
- `eza` - Modern replacement for `ls` with git integration
