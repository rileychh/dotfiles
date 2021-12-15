-- https://github.com/williamboman/nvim-lsp-installer#setup
require("nvim-lsp-installer").on_server_ready(function(server)
  server:setup({})
end)
