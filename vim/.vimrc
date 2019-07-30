" ==============================================================================
" ============================ Vundle Configuration ============================
" ==============================================================================
set nocompatible
filetype on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ============================== Vundle bundles ================================

" ------------------------------ Miscellaneous ---------------------------------
Plugin 'VundleVim/Vundle.vim'
"Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Yggdroot/indentLine'
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
"Plugin 'ryanoasis/vim-devicons'
Plugin 'w0rp/ale'
Plugin 'godlygeek/tabular'
" ------------------------------- Color Scheme ---------------------------------
Plugin 'dracula/vim'                         " dracula (dark)
Plugin 'nightsense/cosmic_latte'             " cosmic_latte (dark|light)
Plugin 'antlypls/vim-colors-codeschool'      " codeschool
Plugin 'ayu-theme/ayu-vim'                   " ayu

" ---------------------------- Syntax Highlighting -----------------------------
Plugin 'scrooloose/syntastic'
Plugin 'rust-lang/rust.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'wavded/vim-stylus'

" ----------------------------------- Git --------------------------------------
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
"Plugin 'Xuyuanp/nerdtree-git-plugin'

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
"set number               " Show line numbers
set lsp=0                " Number of space between lines (line spacing)
set cursorline           " Highlight  current line
set showmatch            " highlight matching brackets

set ruler                                          " Always show cursor position
set rulerformat=%=%h%m%r%w\ %(%c%V%),%l/%L\ %P

set showmode        " Show the current mode
set showcmd         " Show the last used command at bottom right of VIM
set cmdheight=1     " Height of commandbar
set wrap            " Turn on line wrapping.
set laststatus=2    " Always show status line

set list                                           " Show white space characters
" Define symbols for listchars
set listchars=nbsp:¬,eol:¶,tab:¦-,extends:»,precedes:«,trail:·

" Remove conceal feature it's hiding double quotes in JSON
set conceallevel=0
set concealcursor=""

set mouse=a                       " Enable mouse in all modes
set clipboard=unnamed             " Use system clipboard.
set lazyredraw                    " Redraw only when we need to.
set path+=**                      " Recursively traverse to find something
set wildmenu                      " Visual autocomplete for command menu
set wildmode=list:longest,full    " wildmenu in special format (long format)

" Ignore formats in wildmenu
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*.jpg,*.gif,*.png
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png
set wildignore+=*/node_modules/*,*/bower_components/*,*/build/*

set backspace=indent,eol,start    " Make backspace behave as it is

" ------------------------------- Page Title -----------------------------------
set title  " Set the terminal's title

" Showing current file name and current working directory on buffer change
autocmd BufEnter * let &titlestring = ' ' . expand("%:t") . ' - ' . fnamemodify(getcwd(), ':t')

" ------------------------------- GUI Options ----------------------------------
set guifont=Menlo:h11    " Set font for GUI
set guioptions-=m        " Show/Hide menu bar
set guioptions-=T        " Show/Hide toolbar
"set guioptions-=r        " Show/Hide scrollbar

" ==============================================================================
" =============================== Line Number ==================================
" ==============================================================================
set number relativenumber    " Show relative line numbers

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
set statusline+=%#Visual#%{(mode()=='v:')?'\ \ VISUAL\ ':''}
set statusline+=%#Cursor#
set statusline+=\ %f
set statusline+=\ %h%m%r%w

set statusline+=%=

set statusline+=\ %{strlen(&ft)?&ft:'none'}
set statusline+=\ \|
set statusline+=\ %{&fileformat}
set statusline+=[
set statusline+=%{strlen(&fileencoding)?&fileencoding:&encoding}
set statusline+=]
"set statusline+=\ Ln:
"set statusline+=%l
"set statusline+=,\ Col:
"set statusline+=%c
"set statusline+=\ \|
"set statusline+=\ %L
"set statusline+=\ Lines
"set statusline+=\ \|
"set statusline+=\ %p%%
"set statusline+=\ \|
set statusline+=\ \|
set statusline+=\ %l:%c
set statusline+=\ \|
set statusline+=\ %{LinterStatus()}
set statusline+=\ %#Visual#
set statusline+=\ %{FugitiveHead()}
set statusline+=\ %*

" ==============================================================================
" =============================== Indentation ==================================
" ==============================================================================
filetype indent on        " Enable specific file based indentation
"set spell                 " spell checking on
set textwidth=80          " Lines longer than 79 columns will be broken
set colorcolumn=-1        " Display line at the edge of textwidth
"set lines=35 columns=150  " Vim to open with a given size
set shiftwidth=2          " Allow >> and << indent/unindent 2 visual spaces
set tabstop=2             " Number of visual spaces per tab
set expandtab             " Turns tab into spaces
set softtabstop=2         " Number of spaces in tab when editing
set shiftround            " Round indent to multiple of 'shiftwidth'
set autoindent            " Align the new line indent match with previous line
set smartindent           " Automatically inserts one extra level of indentation

" Use the 'shiftwidth' setting for inserting tabs instead of 'tabstop'
set smarttab

" ==============================================================================
" ================================= Movement ===================================
" ==============================================================================
set scrolloff=3    " show context above/below cursorline.

" ==============================================================================
" =============================== Code Folding =================================
" ==============================================================================
set foldenable           " Enable folding option
set foldlevelstart=10    " Open most folds by default
set foldnestmax=10       " 10 nested fold max
set foldmethod=indent    " Fold based on indent level

" ==============================================================================
" ================================== Colors ====================================
" ==============================================================================
syntax enable    " Enable syntax processing
set t_Co=256

"if has('gui_running')
  "set background=light
"else
  "set background=dark
"endif

set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" ==============================================================================
" ================================== Search ====================================
" ==============================================================================
set ignorecase    " Case-insensitive searching.
set smartcase     " But case-sensitive if expression contains a capital letter
set incsearch     " search as characters are entered
set hlsearch      " highlight matches
set gdefault      " /g flag on search by default

" ==============================================================================
" =============================== Files/Backup =================================
" ==============================================================================
set autoread            " Autoupdate when file changed from outside
set lazyredraw          " Don't redraw while running macros
set encoding=utf8       " Set utf8 as standard encoding
set ffs=unix,dos,mac    " Use Unix as the standard file type

set hidden            " Handle multiple buffers

filetype on           " Turn on file type detection.
filetype off          " Turn off file type detection.
filetype plugin on    " Turn on file type plugins.

set nobackup                       " Don't make backup before overwriting a file
set noswapfile                     " Disable file swapping
set nowritebackup                  " And again
set backupdir=$HOME/.vim/backups   " backup files directory
set directory=$HOME/.vim/swaps     " temp files directory
if exists("&undodir")
  set undodir=$HOME/.vim/undo      " undo history directory
endif


" ==============================================================================
" ================================= Plugins ====================================
" ==============================================================================

" ----------------------------------- NetRW ------------------------------------
"let g:netrw_banner = 0            " Remove the banner
"let g:netrw_liststyle = 3         " Changing the directory
"let g:netrw_browse_split = 4      " To make the selection permanent add
"let g:netrw_altv = 1
"let g:netrw_winsize = 25          " Set the width of the directory explorer
"augroup ProjectDrawer
  "autocmd!
  "autocmd VimEnter * :Vexplore
"augroup END

" --------------------------------- NERDTree -----------------------------------

"Open NERDTree automatically when vim start up if no files were specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" show hidden files in NERDTree
"let NERDTreeShowHidden=1

" Ignore files in nerdtree
"let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp', 'node_modules', '.git']

" ---------------------------------- CtrlP -------------------------------------

" Change the default mapping and the default command to invoke CtrlP
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'

" Unless a starting directory specified, CtrlP will set its local working directory
"let g:ctrlp_working_path_mode = 'ra'

"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "Ignore files in .gitignore
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Use a custom file listing command
"let g:ctrlp_user_command = 'find %s -type f'          " MacOSX/Linux
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

" ------------------------------ NERD Commenter --------------------------------
let g:NERDSpaceDelims = 1     " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments

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

" ----------------------------------- Ale --------------------------------------
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)

highlight ALEErrorSign ctermfg=9 ctermbg=NONE guifg=#C30500 guibg=NONE
highlight ALEWarningSign ctermfg=11 ctermbg=NONE guifg=#ED6237 guibg=NONE

let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'

" let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_enter=0
"let g:ale_linters_explicit=1

"let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_echo_msg_format = '%severity%: %linter% says - %s'
let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \ }

" Will keep gutter open for error sign
let g:ale_sign_column_always = 1

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'OK' : printf(
        \   '%d W, %d E',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
" ==============================================================================
" ============================ Keyboard Shortcuts ==============================
" ==============================================================================
let mapleader=","

" highlight last inserted text
nnoremap gV '[v']

" Space open/closes folds
nnoremap <space> za

" turn off search highlight
nnoremap <silent> <leader><space> :nohlsearch<CR>

" ------------------------- Navigating between errors --------------------------
nmap <silent> ]e <Plug>(ale_previous_wrap)
nmap <silent> [e <Plug>(ale_next_wrap)

" ------------------------- Navigating between buffer --------------------------
" List buffer and prepare :b
nnoremap <Leader>b :ls<CR>:b<Space>
nmap <silent> [b :bnext<CR>
nmap <silent> ]b :bprevious<CR>

" go to file in vertical split instead of same file
nnoremap gf :vertical wincmd f<CR>

" ------------------------ Edit file in same repository ------------------------
nmap <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" ------------------------ Navigating the quickfix list ------------------------
nmap <silent> [q :cprevious<CR>zv
nmap <silent> ]q :cnext<CR>zv
nmap <silent> [Q :cfirst<CR>zv
nmap <silent> ]Q :clast<CR>zv

" ---- Move current line or selected block up and down with Alt+j and Alt+k ----
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" --------------------------------- Auto Pairs ---------------------------------
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ` ``<left>
" inoremap ( ()<left>
" inoremap (<CR> (<CR>)<ESC>O
" inoremap [ []<left>
" inoremap [<CR> [<CR>]<ESC>O
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O

" ----------- Visually select text then press ~ to change text case ------------
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" ---------------------------------- NERDTree ----------------------------------
" To open NERDTree with ,n
"map <C-n> :NERDTreeToggle<CR>
"nmap <leader>n :NERDTreeToggle<CR>

" Locate the focused file in NERDTree with ,j
"nmap <leader>j :NERDTreeFind<CR>

" ==============================================================================
" =============================== Abbreviations ================================
" ==============================================================================

" --------- lipsum<Tab> drops some Lorem ipsum text into the document ----------
"iabbrev lipsum
"  \ Pellentesque habitant morbi tristique senectus et netus et malesuada fames
"  \ ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget,
"  \ tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean
"  \ ultricies mi vitae est. Mauris placerat eleifend leo.

" ==============================================================================
" ============================ Miscellaneous Stuff =============================
" ==============================================================================
" will automatically open the quickfix window whenever you do :vimgrep or other
" commands that populate the quickfix/location list
augroup qf
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    cwindow
    autocmd VimEnter        *     cwindow
augroup END