# Claude Code Configuration

Managed by [chezmoi](https://chezmoi.io). Targets `~/.claude/`.

## MCP Servers

MCP servers are configured at user scope in `~/.claude.json` (not tracked by chezmoi).
Set up manually with `claude mcp add`:

```sh
# Proxyman - HTTP debugging proxy
claude mcp add --scope user proxyman -- /Applications/Proxyman.app/Contents/MacOS/mcp-server

# Fetch - web fetching with custom user agent
claude mcp add --scope user fetch -- uvx mcp-server-fetch \
  --ignore-robots-txt \
  "--user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:147.0) Gecko/20100101 Firefox/147.0"
```
