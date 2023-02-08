local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- setting <space> as the leader key
-- It must be defined before plugins are required
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.user_emmet_leader_key='<Tab>'

require('lazy').setup({
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

-- -----------------------------------------------------------------------------
-- ------------------------------ Miscellaneous --------------------------------
-- -----------------------------------------------------------------------------
  'lukas-reineke/indent-blankline.nvim',
  'tpope/vim-commentary',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'mattn/emmet-vim',
  -- 'godlygeek/tabular',
  'vimwiki/vimwiki',
  'kyazdani42/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'romgrk/barbar.nvim',
  'christoomey/vim-tmux-navigator',
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  'nvim-treesitter/nvim-treesitter-refactor',
  -- 'nvim-treesitter/playground',
  'norcalli/nvim-colorizer.lua',
  -- 'sbdchd/neoformat',
  'chentoast/marks.nvim',
  { 'folke/which-key.nvim', lazy = true },

-- -----------------------------------------------------------------------------
-- ----------------------------------- LSP -------------------------------------
-- -----------------------------------------------------------------------------
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  {
    'jose-elias-alvarez/null-ls.nvim', -- formatters and linters
    lazy = false
  },

-- -----------------------------------------------------------------------------
-- ------------------------------ Autocomplete ---------------------------------
-- -----------------------------------------------------------------------------
  {
    'hrsh7th/nvim-cmp',
    lazy = false,
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp'
    }
  },

-- -----------------------------------------------------------------------------
-- ----------------------------------- Git -------------------------------------
-- -----------------------------------------------------------------------------
  'tpope/vim-fugitive',
  'lewis6991/gitsigns.nvim',


-- -----------------------------------------------------------------------------
-- ------------------------------ File Explorer --------------------------------
-- -----------------------------------------------------------------------------
  'kyazdani42/nvim-tree.lua',
  'justinmk/vim-dirvish',
  { 'roginfarrer/vim-dirvish-dovish', branch = 'main' }, -- depend on https://formulae.brew.sh/formula/trash

-- -----------------------------------------------------------------------------
-- -------------------------------- Telescope ----------------------------------
-- -----------------------------------------------------------------------------
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'nvim-telescope/telescope-project.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  'nvim-telescope/telescope-live-grep-args.nvim',
})
