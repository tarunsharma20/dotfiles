local utils = require('utils')

local fn = utils.fn
local api = utils.api

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
local packerUserConfig = api.nvim_create_augroup("PackerUserConfig", { clear = true })

api.nvim_create_autocmd("BufWritePost",
  { pattern = "plugins.lua", command = "source <afile> | PackerSync", group = packerUserConfig }
)

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

-- miscellaneous
  use 'lukas-reineke/indent-blankline.nvim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'mattn/emmet-vim'
  -- use 'godlygeek/tabular'
  use 'vimwiki/vimwiki'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'romgrk/barbar.nvim'
  use 'christoomey/vim-tmux-navigator'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', }
  use 'nvim-treesitter/nvim-treesitter-refactor'
  -- use 'nvim-treesitter/playground'
  use 'tarunsharma20/witching-hour' -- colorscheme
  -- use 'LunarVim/darkplus.nvim' -- colorscheme
  use 'norcalli/nvim-colorizer.lua'
  -- use 'sbdchd/neoformat'
  -- use 'sunjon/shade.nvim'
  use 'chentoast/marks.nvim'
  use 'folke/which-key.nvim'

  -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  -- use 'williamboman/nvim-lsp-installer'
  use "jose-elias-alvarez/null-ls.nvim" -- formatters and linters

  -- autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-nvim-lsp'

  -- git
  use 'tpope/vim-fugitive'
  -- use 'airblade/vim-gitgutter'
  use 'lewis6991/gitsigns.nvim'


  -- file explorer
  -- use 'tamago324/lir.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'justinmk/vim-dirvish'
  use { 'roginfarrer/vim-dirvish-dovish', branch = 'main' } -- depend on https://formulae.brew.sh/formula/trash

  -- telescope
  -- use {
  --   'nvim-telescope/telescope.nvim',
  --   requires = { {'nvim-lua/plenary.nvim'} }
  -- }
  -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- use 'nvim-telescope/telescope-project.nvim'
  -- use 'nvim-telescope/telescope-live-grep-raw.nvim'
  -- use 'nvim-telescope/telescope-file-browser.nvim'

  -- fzf
  use 'nvim-lua/plenary.nvim'
  use { 'junegunn/fzf', run = './install --bin' }
  -- use 'junegunn/fzf.vim'
  use 'ibhagwan/fzf-lua'

  -- use {
  --   'goolord/alpha-nvim',
  --   config = function ()
  --     require'alpha'.setup(require'alpha.themes.dashboard'.config)
  --   end
  -- }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
