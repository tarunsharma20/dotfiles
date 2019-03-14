" ==============================================================================
" ============================== Configure Vundle ==============================
" ==============================================================================
set nocompatible
filetype on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ============================== Vundle bundles ================================

" ------------------------------ Miscellaneous ---------------------------------
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
"Plugin 'ryanoasis/vim-devicons'
Plugin 'w0rp/ale'
Plugin 'godlygeek/tabular'

" ------------------------------- Color Scheme ---------------------------------
Plugin 'jpo/vim-railscasts-theme'
Plugin 'tomasr/molokai'

" ---------------------------- Syntax Highlighting -----------------------------
Plugin 'scrooloose/syntastic'
Plugin 'rust-lang/rust.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" ----------------------------------- Git --------------------------------------
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'


call vundle#end()

" ==============================================================================
" ================================== General ===================================
" ==============================================================================
scriptencoding utf-8
set history=1000          " Number of lines history to remember
set visualbell            " Turn off sounds

" ==============================================================================
" ============================== User Interface ================================
" ==============================================================================
set title                                                                 " Set the terminal's title
set guifont=menlo:h11                                                     " Set font for GUI
"set number                                                                " Show line numbers
set lsp=0                                                                 " Number of space between lines (line spacing)
set cursorline                                                            " Highlight  current line
set showmatch                                                             " highlight matching brackets
set ruler                                                                 " Always show cursor position
set rulerformat=%=%h%m%r%w\ %(%c%V%),%l/%L\ %P
set showmode                                                              " Show the current mode
set showcmd                                                               " Show the last used command at bottom right of VIM
set cmdheight=1                                                           " Height of commandbar
set wrap                                                                  " Turn on line wrapping.
set laststatus=2                                                          " Always show status line
set list                                                                  " Show white space characters
set listchars=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail:·            " Define symbols for listchars
set mouse=a                                                               " Enable mouse in all modes
set clipboard=unnamed                                                     " Use system clipboard.
set lazyredraw                                                            " Redraw only when we need to.
set wildmenu                                                              " Visual autocomplete for command menu
set wildmode=list:longest,full                                            " wildmenu in special format (long format)
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*.jpg,*.gif,*.png  " Ignore formats in wildmenu
set backspace=indent,eol,start                                            " Make backspace behave as it is

" ==============================================================================
" =============================== Line Number ==================================
" ==============================================================================
set number relativenumber                                                 " Show relative line numbers

" Show absolute line number in insert mode, and hybrid(absolute + relative) in normal mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" ==============================================================================
" ================================ Status Bar ==================================
" ==============================================================================
set statusline=

set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ REPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %f
set statusline+=\ %h%m%r%w

set statusline+=%=

set statusline+=\ %{strlen(&ft)?&ft:'none'}
set statusline+=\ \|
set statusline+=\ %{&fileformat}
set statusline+=[
set statusline+=%{strlen(&fileencoding)?&fileencoding:&encoding}
set statusline+=]
set statusline+=\ \|
set statusline+=\ Ln:
set statusline+=%l
set statusline+=,\ Col:
set statusline+=%c
set statusline+=\ \|
set statusline+=\ %L
set statusline+=\ Lines
set statusline+=\ \|
set statusline+=\ %p%%
set statusline+=\ 

" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] " statusline example: ~\myfile[+] [FORMAT=format] [TYPE=type] [ASCII=000] [HEX=00] [POS=0000,0000][00%] [LEN=000]
" set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" ==============================================================================
" =============================== Indentation ==================================
" ==============================================================================
filetype indent on             " Enable specific file based indentation
set textwidth=80               " Lines longer than 79 columns will be broken
set colorcolumn=-1             " Display line at the edge of textwidth
set shiftwidth=2               " Allow >> and << indent/unindent 2 visual spaces
set tabstop=2                  " Number of visual spaces per tab
set expandtab                  " Turns tab into spaces
set softtabstop=2              " Number of spaces in tab when editing
set shiftround                 " Round indent to multiple of 'shiftwidth'
set autoindent                 " Align the new line indent match with previous line
set smartindent                " Automatically inserts one extra level of indentation
set smarttab                   " Use the 'shiftwidth' setting for inserting tabs instead of 'tabstop'

" ==============================================================================
" ================================= Movement ===================================
" ==============================================================================
set scrolloff=3                " show context above/below cursorline.

" ==============================================================================
" =============================== Code Folding =================================
" ==============================================================================
set foldenable                 " Enable folding option
set foldlevelstart=10          " Open most folds by default
set foldnestmax=10             " 10 nested fold max
set foldmethod=indent          " Fold based on indent level

" ==============================================================================
" ================================== Colors ====================================
" ==============================================================================
syntax enable                  " Enable syntax processing
set t_Co=256

if has('gui_running')
  set background=light
else
  set background=dark
endif

colorscheme railscasts

" ==============================================================================
" ================================== Search ====================================
" ==============================================================================
set ignorecase                              " Case-insensitive searching.
set smartcase                               " But case-sensitive if expression contains a capital letter
set incsearch                               " search as characters are entered
set hlsearch                                " highlight matches
set gdefault                                " /g flag on search by default

" ==============================================================================
" =============================== Files/Backup =================================
" ==============================================================================
set autoread                         " Autoupdate when file changed from outside
set lazyredraw                       " Don't redraw while running macros
set encoding=utf8                    " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac                 " Use Unix as the standard file type

set hidden                           " Handle multiple buffers

filetype on                          " Turn on file type detection.
filetype off                         " Turn off file type detection.
filetype plugin on                   " Turn on file type plugins.

set nobackup                         " Don't make backup before overwriting a file
set noswapfile                       " Disable file swapping
set nowritebackup                    " And again
set backupdir=$HOME/.vim/backups     " backup files directory
set directory=$HOME/.vim/swaps       " temp files directory
if exists("&undodir")
  set undodir=$HOME/.vim/undo        " undo history directory
endif


" ==============================================================================
" ================================= Plugins ====================================
" ==============================================================================

" --------------------------------- NERDTree -----------------------------------

"Open NERDTree automatically when vim start up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Close vim if only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let NERDTreeShowHidden=1 " show hidden files in NERDTree

" ---------------------------------- CtrlP -------------------------------------

" Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'                  " Unless a starting directory specified, CtrlP will set its local working directory

" Use a custom file listing command
let g:ctrlp_user_command = 'find %s -type f'          " MacOSX/Linux
" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

" --------------------------------- Syntastic ----------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ------------------------------- Indent Guides --------------------------------
let g:indent_guides_guide_size = 1

" ---------------------------------- Emmet -------------------------------------
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_setting = { 'javascript.jsx' : { 'extends': 'jsx', }, }

" ==============================================================================
" ============================ Keyboard Shortcuts ==============================
" ==============================================================================

let mapleader=","
" nnoremap j gj                               " move down by visual line
" nnoremap k gk                               " move up by visual line
nnoremap gV '[v']                           " highlight last inserted text
nnoremap <space> za                         " Space open/closes folds
nnoremap <leader><space> :nohlsearch<CR>    " turn off search highlight
nnoremap <leader> g :IndentGuidesToggle<CR> " toggle indent guides
map <C-n> :NERDTreeToggle<CR>               "To open NERDTree with Ctrl+n