set nocompatible " Set compatibility to Vim only

" Helps force plug-ins to load correctly when it is turned back on below
filetype on
filetype off

" ==============================================================================
" ================================= Plugins ====================================
" ========================================================================== {{{
call plug#begin($DATA_PATH . '/plugged')

" ------------------------------------------------------------------------------
" ------------------------------- Miscellaneous --------------------------------
" -------------------------------------------------------------------------- {{{
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'akinsho/bufferline.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kdheepak/tabline.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vimwiki/vimwiki'
" Plug 'mhinz/vim-startify'
" End of Miscellaneous }}}

" -----------------------------------------------------------------------------
" -------------------------------- Color Scheme --------------------------------
" -------------------------------------------------------------------------- {{{
Plug 'tarunsharma20/witching-hour'         " witching-hour
" End of Color Scheme }}}

" ------------------------------------------------------------------------------
" ------------------------------------ LSP -------------------------------------
" -------------------------------------------------------------------------- {{{
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" End of LSP }}}

" ------------------------------------------------------------------------------
" ---------------------------- Syntax Highlighting -----------------------------
" -------------------------------------------------------------------------- {{{
Plug 'sheerun/vim-polyglot'
Plug 'lilydjwg/colorizer'
" End of Syntax Highlighting }}}

" ------------------------------------------------------------------------------
" ---------------------------------- Linting -----------------------------------
" -------------------------------------------------------------------------- {{{
" Plug 'w0rp/ale'
" Plug 'prettier/vim-prettier'
Plug 'sbdchd/neoformat'
" End of Linting }}}

" ------------------------------------------------------------------------------
" ------------------------------ File Management -------------------------------
" -------------------------------------------------------------------------- {{{
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-fzf-writer.nvim'

Plug 'jremmen/vim-ripgrep'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" End of File Management }}}

" ------------------------------------------------------------------------------
" ------------------------------------ Git -------------------------------------
" -------------------------------------------------------------------------- {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
" End of Git }}}

call plug#end()
" End of Plugins }}}-

