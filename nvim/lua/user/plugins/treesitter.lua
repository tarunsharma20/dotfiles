vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
})

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    'bash',
    'c',
    'gitcommit',
    'graphql',
    'html',
    'javascript',
    'json',
    'json5',
    'jsonc',
    'lua',
    'markdown',
    'markdown_inline',
    'python',
    'query',
    'regex',
    'rust',
    'scss',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
  },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99
