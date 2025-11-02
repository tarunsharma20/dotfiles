local icons = require('user.icons')

vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    'biome',
    'cssls',
    'eslint',
    'html',
    'jsonls',
    'lua_ls',
    'tailwindcss',
    'ts_ls'
  }
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = { diagnostics = { globals = { 'vim' } } }
  }
})

vim.diagnostic.config({
  -- virtual_lines = true,
  virtual_text = { current_line = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.ERROR,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.WARN,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.INFO,
      [vim.diagnostic.severity.HINT] = icons.diagnostics.HINT,
    },
  },
  update_in_insert = true,
  severity_sort = true,
})
