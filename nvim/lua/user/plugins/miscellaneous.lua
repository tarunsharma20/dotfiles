vim.pack.add({
  { src = "https://github.com/projekt0n/github-nvim-theme", name = "github-theme" },
  "https://github.com/tpope/vim-surround",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/tpope/vim-repeat",
  "https://github.com/nvimdev/indentmini.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/romgrk/barbar.nvim",
  "https://github.com/norcalli/nvim-colorizer.lua",
  "https://github.com/mattn/emmet-vim",
  "https://github.com/folke/which-key.nvim",
})

vim.cmd("colorscheme github_dark_default")

require('barbar').setup({
  icons = { buffer_index = true },
})

require('colorizer').setup({
  "*",    -- Highlight all files, but customize some others.
  "!vim", -- Exclude vim from highlighting.
})

require("indentmini").setup()
vim.cmd.highlight("IndentLine guifg=#1a293b")
vim.cmd.highlight("IndentLineCurrent guifg=#336d9f")

vim.g.user_emmet_leader_key = '<Tab>'
