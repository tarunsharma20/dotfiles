vim.pack.add({
  "https://github.com/stevearc/oil.nvim",
  -- "https://github.com/nvim-tree/nvim-tree.lua",
})

require("oil").setup({
  view_options = { show_hidden = true },
  delete_to_trash = true,
})

-- require("nvim-tree").setup()

vim.keymap.set('n', '-', '<CMD>lua require("oil").open(nil)<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '_', '<CMD>lua require("oil").open(vim.fn.getcwd())<CR>', { desc = 'Open cwd' })

-- vim.keymap.set('n', '<Leader>e', '<CMD>NvimTreeToggle<CR>', { desc = 'Toggle nvim-tree' })
-- vim.keymap.set('n', '<Leader>o', '<CMD>NvimTreeFocus<CR>', { desc = 'Focus on nvim-tree' })
