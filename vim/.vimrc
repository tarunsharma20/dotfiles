" ==============================================================================
" ============================ Vundle Configuration ============================
" ==============================================================================
set nocompatible
filetype on
filetype off

call plug#begin('~/.vim/plugged')

" ============================== Vundle bundles ================================

" ------------------------------ Miscellaneous ---------------------------------
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-commentary'

" ------------------------------- Color Scheme ---------------------------------
Plug 'dracula/vim'                         " dracula (dark)
Plug 'nightsense/cosmic_latte'             " cosmic_latte (dark|light)
Plug 'antlypls/vim-colors-codeschool'      " codeschool
Plug 'ayu-theme/ayu-vim'                   " ayu
Plug 'gosukiwi/vim-atom-dark'              " atom-dark
Plug 'rakr/vim-one'                        " one (dark|light)
Plug 'mhartington/oceanic-next'            " OceanicNext | OceanicNextLight
Plug 'drewtempelmeyer/palenight.vim'       " palenight (dark)
Plug 'arcticicestudio/nord-vim'            " nord
Plug 'cocopon/iceberg.vim'                 " iceberg
Plug 'flrnd/plastic.vim'                   " plastic (dark)
Plug 'haishanh/night-owl.vim'              " night-owl

" ---------------------------- Syntax Highlighting -----------------------------
Plug 'sheerun/vim-polyglot'
Plug 'lilydjwg/colorizer'

" --------------------------------- Linting ------------------------------------
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier'

" ----------------------------- File Management --------------------------------
Plug 'jremmen/vim-ripgrep'
Plug 'ctrlpvim/ctrlp.vim'

" ----------------------------------- Git --------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

" ==============================================================================
" ================================== General ===================================
" ==============================================================================
scriptencoding utf-8
set history=1000          " Number of lines history to remember
set visualbell            " Turn off sounds

" ==============================================================================
" ============================== User Interface ================================
" ==============================================================================
" set number                 " Show line numbers
set lsp=0                  " Number of space between lines (line spacing)
set cursorline             " Highlight  current line
set showmatch              " highlight matching brackets
set spelllang=en_us        " spell checking
set encoding=utf-8 nobomb  " Set utf8 as standard encoding, BOM often causes trouble

set ruler                  " Always show cursor position
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
set clipboard=unnamed             " Use system clipboard

set ttyfast                       " Speed up scrolling in vim buffer
set lazyredraw                    " Don't redraw while running macros in buffer
set hidden            " Switch between buffers buffers without save files

set path+=**                      " Recursively traverse to find something
set wildmenu                      " Visual autocomplete for command menu
set wildmode=list:longest,full    " wildmenu in special format (long format)

" Ignore formats in wildmenu
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,tags
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png
set wildignore+=*/node_modules/*,*/bower_components/*,*/build/*

set backspace=indent,eol,start    " Make backspace behave as it is

set splitright       " :vsplit will open new window right of the current one
set splitbelow       " :split will open new window below the current one

if has("win32")
  set shell=~/AppData/Local/Programs/Git/bin/bash.exe
  " set shellslash     " Use unix style slash in windows as well
endif

" set lines=35 columns=150  " Vim to open with a given size
set textwidth=80          " Lines longer than 79 columns will be broken
set colorcolumn=-1        " Display line at the edge of textwidth

set noshowmode " Hide vim mode text from last line

" Omni completion provides smart autocompletion for program use <C-x><C-o>
" filetype plugin on
" set omnifunc=syntaxcomplete#Complete

" ------------------------------- Page Title -----------------------------------
set title  " Set the terminal's title
set guitablabel=\[%N\]\ %t\ %M
" set tabline=\[%N\]\ %t\ %M
" set showtabline=1

" Showing current file name and current working directory on buffer change
autocmd BufEnter * let &titlestring = ' ' . expand("%:f") . ' - ' . fnamemodify(getcwd(), ':t')

" ------------------------------- GUI Options ----------------------------------
let g:fnt_name = 'Menlo'
let g:fnt_size = 11

" if has("gui_running")
"   if has("gui_gtk2") || has("gui_gtk3")
"     let g:fnt_name = 'Inconsolata'
"     let g:fnt_size = 12
"   elseif has("gui_macvim")
"     let g:fnt_name = 'Menlo\ Regular'
"     let g:fnt_size = 14
"   elseif has("gui_win32")
"     let g:fnt_name = 'Consolas'
"     let g:fnt_size = 12
"   endif
" endif

" set guifont=Menlo:h11    " Set font for GUI

function! SetFont ()
  if has('gui_running')
    if has("gui_gtk2") || has("gui_gtk3")
      exe ':set guifont=' . g:fnt_name . '\ ' . string(g:fnt_size)
    else
      exe ':set guifont=' . g:fnt_name . ':h' . string(g:fnt_size)
    endif
  endif
endfunction

function! FontScaleUp ()
  let g:fnt_size = g:fnt_size + 1
  call SetFont()
endfunction

function! FontScaleDown ()
  let g:fnt_size = g:fnt_size - 1
  call SetFont()
endfunction

call SetFont()

set guioptions-=m        " Show/Hide menu bar
set guioptions-=T        " Show/Hide toolbar
" set guioptions-=r        " Show/Hide scrollbar

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
" set statusline+=\ %t
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
" set statusline+=\ \|
" set statusline+=\ %l:%c
set statusline+=\ \|
set statusline+=\ %L
set statusline+=\ Lines
" set statusline+=\ \|
" set statusline+=\ %p%%
set statusline+=\ \|
set statusline+=\ %{LinterStatus()}
set statusline+=\ %#Visual#
set statusline+=\ %{FugitiveHead()}
set statusline+=\ %*

" ==============================================================================
" =============================== Indentation ==================================
" ==============================================================================
filetype indent on        " Enable specific file based indentation

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
set foldmethod=manual

" Commenting code below to make linting fast
" set foldenable           " Enable folding option
" set foldlevelstart=10    " Open most folds by default
" set foldnestmax=10       " 10 nested fold max
" set foldmethod=indent    " Fold based on indent level

" ==============================================================================
" ================================== Colors ====================================
" ==============================================================================
syntax enable    " Enable syntax processing
set t_Co=256

" if has('gui_running')
  " set background=light
" else
  " set background=dark
" endif

set termguicolors     " enable true colors support

" let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu

let schemes = [
  \'one',
  \'OceanicNext',
  \'ayu',
  \'atom-dark',
  \'dracula',
  \'cosmic_latte',
  \'codeschool',
  \'palenight',
  \'nord',
  \'iceberg',
  \'plastic',
  \'night-owl'
  \]
let seconds = str2nr(strftime('%S'))

execute 'colorscheme '.schemes[seconds%len(schemes)]
redraw

set background=dark

" ==============================================================================
" ================================== Search ====================================
" ==============================================================================
set ignorecase    " Case-insensitive searching.
set smartcase     " But case-sensitive if expression contains a capital letter
set incsearch     " search as characters are entered
set hlsearch      " highlight matches
set magic         " Enable extended regexes.
set gdefault      " /g flag on search by default
"set noautocmd

" Use git for search from grep command
set grepprg=git\ --no-pager\ grep\ --no-color\ -n\ $*
set grepformat=%f:%l:%m,%m\ %f\ match%ts,%f

" Use ripgrep for search if available
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" ==============================================================================
" =============================== Files/Backup =================================
" ==============================================================================
set autoread              " Autoupdate when file changed from outside
set ffs=unix,dos,mac      " Use Unix as the standard file type

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
" let g:netrw_banner = 0            " Remove the banner
" let g:netrw_liststyle = 3         " Changing the directory
" let g:netrw_browse_split = 4      " To make the selection permanent add
" let g:netrw_altv = 1
" let g:netrw_winsize = 25          " Set the width of the directory explorer
" augroup ProjectDrawer
  " autocmd!
  " autocmd VimEnter * :Vexplore
" augroup END

" let g:netrw_browse_split = 0      " re-use the same window (default)
" let g:netrw_browse_split = 1      " horizontally split the window
" let g:netrw_browse_split = 2      " vertically split the window
" let g:netrw_browse_split = 3      " open file in new tab
" let g:netrw_browse_split = 4      " act like 'p' (ie. open preview window)

" ----------------------------------- ripgrep ----------------------------------
" use rp to search through ripgrep with smartcase enabled -S
let g:rg_command = 'rg --vimgrep -S'

" ------------------------------------ CtrlP -----------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Using ripgrep if avaliable
if executable('rg')
  let g:ctrlp_user_command = 'rg -F --files %s'
  let g:ctrlp_use_caching = 0
endif
" let g:ctrlp_max_files=0

" ------------------------------- Indent Guides --------------------------------
let g:indent_guides_guide_size = 1

" ---------------------------------- Emmet -------------------------------------
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_setting = { 'javascript.jsx' : { 'extends': 'jsx', }, }

" ----------------------------------- Ale --------------------------------------
" highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
" highlight clear ALEWarningSign " otherwise uses error bg color (typically red)

" highlight ALEErrorSign ctermfg=9 ctermbg=NONE guifg=#C30500 guibg=NONE
" highlight ALEWarningSign ctermfg=11 ctermbg=NONE guifg=#ED6237 guibg=NONE

" let g:ale_sign_error = 'X'
" let g:ale_sign_warning = '!'

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1 "Fix files on save
let g:ale_linters_explicit = 1

" let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_echo_msg_format = '%severity%: %linter% says - %s'
let g:ale_linters = {
  \ 'javascript': ['eslint']
  \ }
let g:ale_fixers = {
  \ 'javascript': ['prettier']
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

" go to file in vertical split instead of same file
" nnoremap gf :vertical wincmd f<CR>

" highlight last inserted text
nnoremap gV '[v']

" Space open/closes folds
nnoremap <space> za

" turn off search highlight
nnoremap <silent> <leader><space> :nohlsearch<CR>

" open terminal
nnoremap <silent> <leader>t :wincmd b \| bel terminal<CR>

" -------------------------- Navigating between tabs ---------------------------
nmap <silent> ]t :tabnext<CR>
nmap <silent> [t :tabprevious<CR>
nmap <silent> ]T :tabfirst<CR>
nmap <silent> [T :tablast<CR>

" ------------------------- Navigating between buffer --------------------------
" List buffer and prepare :b
" nnoremap <Leader>b :ls<CR>:b<Space>
nmap <silent> ]b :bnext<CR>
nmap <silent> [b :bprevious<CR>

" ------------------------------ Change fontsize -------------------------------
nnoremap <silent> <leader>= :call FontScaleUp()<CR>
nnoremap <silent> <leader>- :call FontScaleDown()<CR>

" ----------------------------------- NetRW ------------------------------------
nnoremap <silent> - :Explore<CR>
nnoremap <silent> _ :Ntree<CR>

" ------------------------------------ CtrlP -----------------------------------
" Open fuzzy search filename
" nmap <silent> <leader>f :CtrlP<CR>

" Open fuzzy search most recent files
" nmap <silent> <leader>r :CtrlPMRU<CR>

" Open fuzzy search buffers
" nmap <silent> <leader>b :CtrlPBuffer<CR>
"
" Open fuzzy search tags
" nmap <silent> <leader>b :CtrlPTag<CR>

" ------------------------ Edit file in same repository ------------------------
" nmap <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
" nmap <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
" nmap <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
" nmap <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Open explorer in same window
" nnoremap <silent> <leader>ew :Explore <CR> 

" Open explorer in horizontal split window
" nnoremap <silent> <leader>es :Sexplore <CR>

" Open explorer in vertical split window
" nnoremap <silent> <leader>ev :Vexplore <CR>

" Open explorer in new tab
" nnoremap <silent> <leader>et :Texplore <CR>

" ------------------------ Navigating the quickfix list ------------------------
nmap <silent> ]q :cnext<CR>zv
nmap <silent> [q :cprevious<CR>zv
nmap <silent> ]Q :cfirst<CR>zv
nmap <silent> [Q :clast<CR>zv

" ------------------------------------ ALE -------------------------------------
nnoremap <silent> <leader>af :ALEFix<CR>
nmap <silent> ]e <Plug>(ale_next_wrap)
nmap <silent> [e <Plug>(ale_previous_wrap)

" --------------------------------- Git Gutter ---------------------------------
nnoremap <silent> ]h :GitGutterNextHunk<CR>
nnoremap <silent> [h :GitGutterPrevHunk<CR>

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

" ==============================================================================
" =================================== Macro ====================================
" ==============================================================================
" Activating builtin macro matchit to enable jump in xml/html tags
runtime macros/matchit.vim

" ==============================================================================
" =============================== Abbreviations ================================
" ==============================================================================

" --------- lipsum<Tab> drops some Lorem ipsum text into the document ----------
" iabbrev lipsum
"   \ Pellentesque habitant morbi tristique senectus et netus et malesuada fames
"   \ ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget,
"   \ tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean
"   \ ultricies mi vitae est. Mauris placerat eleifend leo.

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

" noremap <Leader>y "*y
" noremap <Leader>p "*p
" noremap <Leader>Y "+y
" noremap <Leader>P "+p