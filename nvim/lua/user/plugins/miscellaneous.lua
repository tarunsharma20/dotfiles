return {
  -- colorscheme
  {
    'tarunsharma20/witching-hour',
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[colorscheme witching-hour]])
    end,
  },
  -- {
  --   'LunarVim/darkplus.nvim',
  --   lazy = false,
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     vim.cmd([[colorscheme darkplus]])
  --   end,
  -- },
  'lukas-reineke/indent-blankline.nvim',
  'tpope/vim-commentary',
  'tpope/vim-surround',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  'godlygeek/tabular',
  'kyazdani42/nvim-web-devicons',
  'christoomey/vim-tmux-navigator',
  -- 'Bekaboo/dropbar.nvim'
}
