local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')
lspconfig.zls.setup({});

-- see :help lsp-zero-guide:integrate-with-mason-nvim
-- to learn how to use mason.nvim with lsp-zero
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'tsserver', 'html' },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function ()
        lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
    end,
  }
})

local cmp = require('cmp');
local cmp_action = lsp_zero.cmp_action();

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),

        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
    }),
})
