-- local lspconfig = require('lspconfig')
-- lspconfig.clangd.setup{}
-- lspconfig.pyright.setup{}
-- lspconfig.rls.setup{}
-- lspconfig.vimls.setup{}
-- lspconfig.jsonls.setup{
--   filetypes = {"json", "jsonc"};
-- }
-- lspconfig.tsserver.setup{}
-- lspconfig.html.setup{
--   filetypes = {"html", "css", "scss", "less"};
-- }
-- lspconfig.bashls.setup{
--   filetypes = {"sh", "bash"};
-- }
-- lspconfig.clangd.setup{}
-- lspconfig.sumneko_lua.setup{}

require'lspinstall'.setup()

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end
