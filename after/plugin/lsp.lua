local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.setup_servers({'lua_ls', 'rust_analyzer', 'zls', 'html'})

-- see :help lsp-zero-guide:integrate-with-mason-nvim
-- to learn how to use mason.nvim with lsp-zero
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls','rust_analyzer' },
  handlers = {
    lsp_zero.default_setup,
  }
})
