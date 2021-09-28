set nocompatible " Set compatibility to Vim only

" Helps force plug-ins to load correctly when it is turned back on below
filetype on
filetype off

" ==============================================================================
" ================================= Plugins ====================================
" ========================================================================== {{{
call plug#begin('~/.vim/plugged')

" ------------------------------------------------------------------------------
" ------------------------------- Miscellaneous --------------------------------
" -------------------------------------------------------------------------- {{{
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vimwiki/vimwiki'
" End of Miscellaneous }}}

" ------------------------------------------------------------------------------
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
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier'
" End of Linting }}}

" ------------------------------------------------------------------------------
" ------------------------------ File Management -------------------------------
" -------------------------------------------------------------------------- {{{
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" End of File Management }}}

" ------------------------------------------------------------------------------
" ------------------------------------ Git -------------------------------------
" -------------------------------------------------------------------------- {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
" End of Git }}}

call plug#end()
" End of Plugins }}}

" ==============================================================================
" ================================= Behavioural ================================
" ========================================================================== {{{

" ------------------------------------------------------------------------------
" -------------------------------- Files/Backup --------------------------------
" -------------------------------------------------------------------------- {{{
set nobackup                       " Don't make backup before overwriting a file
set noswapfile                     " Disable file swapping
set nowritebackup                  " And again
set backupdir=$HOME/.vim/backups   " backup files directory
set directory=$HOME/.vim/swaps     " temp files directory
if exists("&undodir")
  set undodir=$HOME/.vim/undo      " undo history directory
endif

" don't give |ins-completion-menu| messages.
set shortmess+=c
" End of File/Backup }}}

" ------------------------------------------------------------------------------
" ------------------------------- Miscellaneous --------------------------------
" -------------------------------------------------------------------------- {{{
set clipboard=unnamed             " Use system clipboard
"
" Remove conceal feature it's hiding double quotes in JSON
set conceallevel=0
set concealcursor=""

set spell                 " spell checking
set spelllang=en_us
set encoding=utf-8 nobomb " Set utf8 as standard encoding, BOM often causes trouble
scriptencoding utf-8

set history=1000            " Number of lines history to remember

set visualbell              " Turn off sounds
set ttyfast                 " Speed up scrolling in vim buffer
set lazyredraw              " Don't redraw while running macros in buffer
" set redrawtime=10000      " The time in milliseconds for redrawing the display
set hidden                  " Switch between buffers without save files

set noshowmode " Hide vim mode text from last line

" set autowrite        " Automatically :write
set autoread         " Autoupdate when file changed from outside
set ffs=unix,dos,mac " Use Unix as the standard file type

filetype on        " Turn on file type detection.
filetype off       " Turn off file type detection.
filetype plugin on " Turn on file type plugins.

if has("win32")
  set shell=~/AppData/Local/Programs/Git/bin/bash.exe
  " set shellslash     " Use unix style slash in windows as well
endif

" will automatically open the quickfix window whenever you do :vimgrep or other
" commands that populate the quickfix/location list
augroup qf
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost l*    cwindow
  autocmd VimEnter        *     cwindow
augroup END
" End of Miscellaneous }}}
" End of Behavioural }}}

" ==============================================================================
" ============================== User Interface ================================
" ========================================================================== {{{

" ------------------------------------------------------------------------------
" ----------------------------------- Ruler ------------------------------------
" -------------------------------------------------------------------------- {{{
set ruler        " Always show cursor position
set rulerformat=%=%h%m%r%w\ %(%c%V%),%l/%L\ %P
set showmode     " Show the current mode
set showcmd      " Show the last/incomplete command at bottom right of VIM
set cmdheight=1  " Height of commandbar
set laststatus=2 " Always show status line
" End of Ruler }}}

" ------------------------------------------------------------------------------
" --------------------------------- Line Number --------------------------------
" -------------------------------------------------------------------------- {{{
set number relativenumber " Show relative line numbers

" Show absolute line number in insert mode, and hybrid(absolute + relative) in normal mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" End of Line Number }}}

" ------------------------------------------------------------------------------
" --------------------------------- Indentation --------------------------------
" -------------------------------------------------------------------------- {{{
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
" End of Indentation }}}

" ------------------------------------------------------------------------------
" --------------------------------- Status Bar ---------------------------------
" -------------------------------------------------------------------------- {{{
function! StatuslineMode()
    let l:mode=mode()
    if l:mode==#"n"
        return "NORMAL"
    elseif l:mode==?"v"
        return "VISUAL"
    elseif l:mode==#"i"
        return "INSERT"
    elseif l:mode==#"R"
        return "REPLACE"
    endif
endfunction

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    lcd %:p:h
    let l:gitrevparse=system("git rev-parse --abbrev-ref HEAD")
    lcd -
    if l:gitrevparse!~"fatal: not a git repository"
      let b:gitbranch=" ".substitute(l:gitrevparse, '\n', '', 'g')." "
    endif
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END

function! ShowNewline() abort
  let s:newline_labels = {'unix': 'LF', 'mac': 'CR', 'dos': 'CRLF'}
  return get(s:newline_labels, &fileformat, &fileformat)
endfunction

set statusline=

set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ REPLACE\ ':''}
set statusline+=%#Visual#%{(mode()=='v:')?'\ \ VISUAL\ ':''}

" Comment line below if your colorscheme support active statusline color
" set statusline+=%#Cursor#

" Uncomment line below if your colorscheme support active statusline color
set statusline+=%*

set statusline+=\ %t
set statusline+=\ %h%m%r%w

set statusline+=%=

set statusline+=\ %{strlen(&ft)?&ft:'none'}
set statusline+=\ \ %{ShowNewline()}
set statusline+=\ \ %{strlen(&fileencoding)?toupper(&fileencoding):toupper(&encoding)}
set statusline+=\ \ %l:%c
set statusline+=\ \ %{LSPStatus()}
set statusline+=\ %#Visual#
set statusline+=%{b:gitbranch}
set statusline+=%*
" End of Status Bar }}}

" ------------------------------------------------------------------------------
" ------------------------------ Page Title & Tabs -----------------------------
" -------------------------------------------------------------------------- {{{
set title  " Set the terminal's title
set guitablabel=\[%N\]\ %t\ %M

" Showing current file name and current working directory on buffer change
autocmd BufEnter * let &titlestring = ' ' . expand("%:f") . ' - ' . fnamemodify(getcwd(), ':t')
" End of Page Title & Tabs }}}

" ------------------------------------------------------------------------------
" ------------------------------ Font Name & Size ------------------------------
" -------------------------------------------------------------------------- {{{
let g:fnt_name = 'Fira\ Code'
let g:fnt_size = 15

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

if has("mac") || has("macunix")
  set macligatures  " Enable font ligatures in MacVim
endif
" End of Font Name & Size }}}

" ------------------------------------------------------------------------------
" -------------------------------- Color Scheme --------------------------------
" -------------------------------------------------------------------------- {{{
syntax enable    " Enable syntax processing
set t_Co=256

set termguicolors     " enable true colors support

colorscheme witching-hour
set background=dark
" End of Color Scheme }}}

" ------------------------------------------------------------------------------
" ------------------------------- Miscellaneous --------------------------------
" -------------------------------------------------------------------------- {{{
set lsp=0      " Number of space between lines (line spacing)
set cursorline " Highlight  current line
set wrap       " Turn on line wrapping.

set list       " Show white space characters

" Define symbols for listchars
set listchars=nbsp:¤,eol:¶,tab:→\ ,extends:»,precedes:«,trail:·
let &showbreak = '↳ '

if has('gui_running')
  set guioptions-=m   " Show/Hide menu bar
  set guioptions-=T   " Show/Hide toolbar
  " set guioptions-=r   " Show/Hide scrollbar
endif

set textwidth=80          " Lines longer than 79 columns will be broken
set colorcolumn=+1        " Display line at the edge of textwidth
" End of Miscellaneous }}}
" End of User Interface }}}

" ==============================================================================
" ============================= User Interaction ===============================
" ========================================================================== {{{

" ------------------------------------------------------------------------------
" -------------------------------- Code Folding --------------------------------
" -------------------------------------------------------------------------- {{{
set foldmethod=manual

" Commenting code below to make linting fast
set foldenable           " Enable folding option
set foldlevelstart=10    " Open most folds by default
set foldnestmax=10       " 10 nested fold max
set foldmethod=indent    " Fold based on indent level

augroup Folds
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" End of Code Folding }}}

" ------------------------------------------------------------------------------
" ----------------------------------- Search -----------------------------------
" -------------------------------------------------------------------------- {{{
set path+=**                   " Recursively traverse to find something
set wildmenu                   " Visual autocomplete for command menu
set wildmode=list:longest,full " wildmenu in special format (long format)

" Ignore formats in wildmenu
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,tags
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png
set wildignore+=*/node_modules/*,*/bower_components/*,*/build/*

set ignorecase " Case-insensitive searching.
set smartcase  " But case-sensitive if expression contains a capital letter
set incsearch  " Incremental search, search as characters are entered
set hlsearch   " Highlight matches
set magic      " Enable extended regexes.
set gdefault   " /g flag on search by default
"set noautocmd

" Use git for search from grep command
set grepprg=git\ --no-pager\ grep\ --no-color\ -n\ $*
set grepformat=%f:%l:%m,%m\ %f\ match%ts,%f

" Use ripgrep for search if available
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" End of Search }}}

" ------------------------------------------------------------------------------
" ------------------------------- Miscellaneous --------------------------------
" -------------------------------------------------------------------------- {{{
set showmatch  " highlight matching brackets
set splitright " :vsplit will open new window right of the current one
set splitbelow " :split will open new window below the current one

set mouse=a                    " Enable mouse in all modes
set backspace=indent,eol,start " Make backspace behave as it is

" Omni completion provides smart autocompletion for program use <C-x><C-o>
" <C-x><C-f> completes filepath, <C-x><C-]> completes based on tags,
" <C-n> invokes keyword completion.
" filetype plugin on
set complete+=kspell
" set completeopt=menuone,longest
set completeopt=longest,menuone,menu,preview,popup
set omnifunc=syntaxcomplete#Complete

set scl=no
set scl=yes
set scl=auto
set scrolloff=3    " show context above/below cursorline.

" Activating builtin macro matchit to enable jump in xml/html tags
runtime macros/matchit.vim
" End of Miscellaneous }}}
" End of User Interaction }}}

" ==============================================================================
" ============================ Plugin Configuration ============================
" ========================================================================== {{{

" ------------------------------------------------------------------------------
" ----------------------------------- ripgrep ----------------------------------
" -------------------------------------------------------------------------- {{{
" use rg to search through ripgrep with smartcase enabled -S
let g:rg_command = 'rg --vimgrep -S'
let g:rg_highlight = 'true'
" End of ripgrep }}}

" ------------------------------------------------------------------------------
" ------------------------------------- FZF ------------------------------------
" -------------------------------------------------------------------------- {{{
let g:fzf_command_prefix = 'F'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
" let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'

" Tell FZF to use Rg
if executable('rg')
  " --files — List files which ripgrep will search instead of searching them
  " --hidden — Show hidden (.file) files
  " --no-ignore-vcs — Show files ignored by your VCS
  " --vimgrep — Results are returned on a single line in vimgrep format
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
endif

function! RipgrepFzf(query, fullscreen)
  " let command_fmt = 'rg --column --line-number --no-heading --fixed-strings --smart-case --hidden --follow --glob "!{.git,node_modules}/*" --color=always %s || true'
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang FRG call RipgrepFzf(<q-args>, <bang>0)
" End of FZF }}}

" ------------------------------------------------------------------------------
" -------------------------------- Buftabline ----------------------------------
" -------------------------------------------------------------------------- {{{
let g:buftabline_numbers = 2
let g:buftabline_indicators = 1
let g:buftabline_separators = 1
" End of Buftabline }}}

" ------------------------------------------------------------------------------
" ------------------------------- Indent Guides --------------------------------
" -------------------------------------------------------------------------- {{{
let g:indent_guides_guide_size = 1
" End of Indent Guides }}}

" ------------------------------------------------------------------------------
" ----------------------------------- Emmet ------------------------------------
" -------------------------------------------------------------------------- {{{
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_setting = { 'javascript.jsx' : { 'extends': 'jsx', }, }
" End of Emmet }}}

" ------------------------------------------------------------------------------
" ------------------------------------ Ale -------------------------------------
" -------------------------------------------------------------------------- {{{
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '🚸'

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1 "Fix files on save
let g:ale_linters_explicit = 1

let g:ale_echo_msg_format = '%severity%: %linter% says - %s'
let g:ale_linters = {
  \ 'javascript': ['eslint']
  \ }
let g:ale_fixers = {
  \ 'javascript': ['prettier', 'eslint']
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
" End of Ale }}}

" ------------------------------------------------------------------------------
" -------------------------------- Asyncomplete --------------------------------
" -------------------------------------------------------------------------- {{{
" Register asyncomplete-file.vim
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))
" End of Asyncomplete }}}

" ------------------------------------------------------------------------------
" ------------------------------------ LSP -------------------------------------
" -------------------------------------------------------------------------- {{{
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

  nmap <buffer> <C-]> <plug>(lsp-definition)
  nmap <buffer> <leader>gd <plug>(lsp-definition)
  nmap <buffer> <leader>gr <plug>(lsp-references)
  nmap <buffer> <leader>gi <plug>(lsp-implementation)
  nmap <buffer> <leader>gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [d <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]d <Plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)

endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_signs_enabled = 1           " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '⚠'} " icons require GUI
let g:lsp_signs_hint = {'text': '💡'} " icons require GUI

" Highlight references to the symbol under the cursor
let g:lsp_highlight_references_enabled = 1

function! LSPStatus() abort
  let l:counts = lsp#get_buffer_diagnostics_counts()
  let l:errors  = l:counts.error
  let l:warnings  = l:counts.warning
  let l:hints  = l:counts.hint
  let l:informations  = l:counts.information

  let l:total  = l:errors + l:warnings + l:hints + l:informations

  return l:total == 0 ? 'OK' : printf(
        \   'E %d  W %d  H %d  i %d',
        \   l:errors,
        \   l:warnings,
        \   l:hints,
        \   l:informations
        \)
endfunction
" End of LSP }}}

" ------------------------------------------------------------------------------
" ---------------------------------- Vimwiki ----------------------------------
" -------------------------------------------------------------------------- {{{
let g:vimwiki_global_ext=0

" augroup vimwikiConceal
"   autocmd!
"   autocmd FileType vimwiki call matchadd('Conceal', '\[\ \]', 10, -1, {'conceal': '☐'})
"   autocmd FileType vimwiki call matchadd('Conceal', '\[X\]', 10, -1, {'conceal': '☑'})
"   autocmd FileType vimwiki call matchadd('Conceal', '\[-\]', 10, -1, {'conceal': '☒'})
"   autocmd FileType vimwiki call matchadd('Conceal', '\[\.\]', 10, -1, {'conceal': '⊡'})
"   autocmd FileType vimwiki call matchadd('Conceal', '\[o\]', 10, -1, {'conceal': '⬕'})
" augroup END
" End of Vimwiki }}}
" End of Plugin Configuration }}}

" ==============================================================================
" ================================== Mappings ==================================
" ========================================================================== {{{
" map vs noremap
"
" map is recursive but noremap is non-recursive. In example below j will mapped
"
" to gg, Q will also mapped to qq. However W is mapped to j not gg.
" map j gg
" map Q j
" noremap W j
"
"-----------------------------------------------------------------------------------"
" Commands \ Modes         | Normal | Insert | Command | Visual | Select | Operator |
"--------------------------|--------|--------|---------|--------|--------|----------|
" map  / noremap  / unmap  |    @   |   -    |    -    |   @    |   @    |    @     |
" nmap / nnoremap / nunmap |    @   |   -    |    -    |   -    |   -    |    -     |
" vmap / vnoremap / vunmap |    -   |   -    |    -    |   @    |   @    |    -     |
" omap / onoremap / ounmap |    -   |   -    |    -    |   -    |   -    |    @     |
" xmap / xnoremap / xunmap |    -   |   -    |    -    |   @    |   -    |    -     |
" smap / snoremap / sunmap |    -   |   -    |    -    |   -    |   @    |    -     |
" map! / noremap! / unmap! |    -   |   @    |    @    |   -    |   -    |    -     |
" imap / inoremap / iunmap |    -   |   @    |    -    |   -    |   -    |    -     |
" cmap / cnoremap / cunmap |    -   |   -    |    @    |   -    |   -    |    -     |
"-----------------------------------------------------------------------------------"

let mapleader="\<Space>"

" ------------------------------------------------------------------------------
" -------------------------------- Miscellaneous -------------------------------
" -------------------------------------------------------------------------- {{{

" Disabling arrow keys
nmap <Up>    <Nop>
nmap <Down>  <Nop>
nmap <Left>  <Nop>
nmap <Right> <Nop>
vmap <Up>    <Nop>
vmap <Down>  <Nop>
vmap <Left>  <Nop>
vmap <Right> <Nop>

" go to file in vertical split instead of same file
" nnoremap gf :vertical wincmd f<CR>

" highlight last inserted text
nnoremap gV '[v']

" Space open/closes folds
" nnoremap <space> za

" turn off search highlight
nnoremap <silent> <leader><space> :nohlsearch<CR>

" open terminal
nnoremap <silent> <leader>t :wincmd b \| bel terminal<CR>

" Change word under cursor in file with dot and skip with n
nnoremap <leader>c* *``cgn

" Same as above but in reverse order
nnoremap <leader>c# *``cgN

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Switch/Toggle conceallevel
nnoremap <silent><Leader>sc :call ToggleConcealLevel()<CR>
function! ToggleConcealLevel()
  if &conceallevel == 0
    setlocal conceallevel=3
  else
    setlocal conceallevel=0
  endif
endfunction
" End of Miscellaneous }}}

" ------------------------------------------------------------------------------
" -------------------------------- Split window --------------------------------
" -------------------------------------------------------------------------- {{{
" Move cursor to right window
nnoremap <C-l> :wincmd l<CR>

" Move cursor to left window
nnoremap <C-h> :wincmd h<CR>

" Move cursor to window below
nnoremap <C-j> :wincmd j<CR>

" Move cursor to window top
nnoremap <C-k> :wincmd k<CR>

" Scale-up/down horizontal/vertically split window by 3 rows/columns
if has("gui_macvim")
  nnoremap <silent> <D-Up> :resize +3<cr>
  nnoremap <silent> <D-Down> :resize -3<cr>
  nnoremap <silent> <D-Right> :vertical resize +3<cr>
  nnoremap <silent> <D-Left> :vertical resize -3<cr>
else
  nnoremap <silent> <C-Up> :resize +3<cr>
  nnoremap <silent> <C-Down> :resize -3<cr>
  nnoremap <silent> <C-Right> :vertical resize +3<cr>
  nnoremap <silent> <C-Left> :vertical resize -3<cr>
endif
" End of Split window }}}

" ------------------------------------------------------------------------------
" --------------------------- Navigating between tabs --------------------------
" -------------------------------------------------------------------------- {{{
nmap <silent> ]t :tabnext<CR>
nmap <silent> [t :tabprevious<CR>
nmap <silent> ]T :tabfirst<CR>
nmap <silent> [T :tablast<CR>
" End of Navigating between tabs }}}

" ------------------------------------------------------------------------------
" ------------------------ Navigating the quickfix list ------------------------
" -------------------------------------------------------------------------- {{{
nmap <silent> ]q :cnext<CR>zv
nmap <silent> [q :cprevious<CR>zv
nmap <silent> ]Q :cfirst<CR>zv
nmap <silent> [Q :clast<CR>zv
" End of Navigating the quickfix list }}}

" ------------------------------------------------------------------------------
" ----------------------------------- Buffer -----------------------------------
" -------------------------------------------------------------------------- {{{
" Delete all buffers but current (buffer only)
nnoremap <silent> <Leader>bo :%bd\|e#\|bd# <CR>

" Fix broken syntax highlighting (buffer refresh)
nnoremap <silent> <Leader>br :syntax sync fromstart<CR>

nmap <silent> ]b :bnext<CR>
nmap <silent> [b :bprevious<CR>
nmap <silent> ]B :bfirst<CR>
nmap <silent> [B :blast<CR>
" End of Buffer }}}

" ------------------------------------------------------------------------------
" ------------------------------ Change fontsize -------------------------------
" -------------------------------------------------------------------------- {{{
nnoremap <silent> <leader>= :call FontScaleUp()<CR>
nnoremap <silent> <leader>- :call FontScaleDown()<CR>
" End of Change fontsize }}}

" ------------------------------------------------------------------------------
" ----------------------------------- NetRW ------------------------------------
" -------------------------------------------------------------------------- {{{
" Open parent directory
nnoremap <silent> - :Explore<CR>

" Open root directory
nnoremap <silent> _ :Ntree<CR>
" End of NetRW }}}

" ------------------------------------------------------------------------------
" ----------- Visually select text then press ~ to change text case ------------
" -------------------------------------------------------------------------- {{{
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
" End of Visually select text then press ~ to change text case }}}

" ------------------------------------------------------------------------------
" ---- Move current line or selected block up and down with Alt+j and Alt+k ----
" -------------------------------------------------------------------------- {{{
nnoremap <silent> <leader>j :move .+1<CR>==
nnoremap <silent> <leader>k :move .-2<CR>==
vnoremap <silent> <leader>j :move '>+1<CR>gv=gv
vnoremap <silent> <leader>k :move '<-2<CR>gv=gv
" End of Move current line or selected block up and down with Alt+j and Alt+k }}}

" ------------------------------------------------------------------------------
" ----------------------------------- Popups -----------------------------------
" -------------------------------------------------------------------------- {{{
nnoremap <leader>cp :call popup_clear() <CR>
" End of Popups }}}

" ------------------------------------------------------------------------------
" ------------------------------------ FZF -------------------------------------
" -------------------------------------------------------------------------- {{{
nnoremap <leader>ff :FFiles<CR>
nnoremap <silent> <leader>fg :FRG<CR>
nnoremap <silent> <Leader>* :exec "FRG ".expand("<cword>")<CR>
nnoremap <Leader>fb :FBuffers<CR>
nnoremap <Leader>fL :FLines<CR>
nnoremap <Leader>fl :FBLines<CR>
" End of FZF }}}

" ------------------------------------------------------------------------------
" ------------------------------------ ALE -------------------------------------
" -------------------------------------------------------------------------- {{{
nnoremap <silent> <leader>af :ALEFix<CR>
nmap <silent> ]e <Plug>(ale_next_wrap)
nmap <silent> [e <Plug>(ale_previous_wrap)
" End of ALE }}}

" ------------------------------------------------------------------------------
" --------------------------------- Git Gutter ---------------------------------
" -------------------------------------------------------------------------- {{{
nnoremap <silent> ]h :GitGutterNextHunk<CR>
nnoremap <silent> [h :GitGutterPrevHunk<CR>
" End of Git Gutter }}}

" ------------------------------------------------------------------------------
" -------------------------------- Buftabline ----------------------------------
" -------------------------------------------------------------------------- {{{
for i in range(1, 9)
  execute 'nmap <silent> <Leader>' . (i) . ' <Plug>BufTabLine.Go('. i .')'
endfor
" End of BufTabLine }}}

" ------------------------------------------------------------------------------
" ------------------------------ Vim Presentation ------------------------------
" -------------------------------------------------------------------------- {{{
autocmd BufNewFile,BufRead *.vpm call SetVimPresentationMode()

function! SetVimPresentationMode()
  set filetype=markdown

  nnoremap <buffer> <Right> :n<CR>
  nnoremap <buffer> <Left> :N<CR>
endfunction
" End of Vim Presentation }}}

" ------------------------------------------------------------------------------
" ------------------------------- Vim TODO List --------------------------------
" -------------------------------------------------------------------------- {{{
autocmd BufNewFile,BufRead *.todo call SetVimToDoMode()

function! SetVimToDoMode()
  nnoremap <buffer><silent> o o[ ]<space>
  nnoremap <buffer><silent> O O[ ]<space>
  inoremap <buffer><silent> <CR> <Esc>o[ ]<space>
  inoremap <buffer><silent> <C-j> <Esc>o[ ]<space>
  nnoremap <buffer><silent> <CR> :call ToggleComplete()<CR>
endfunction

function! ToggleComplete()
    " Get current line:
    let l:line = getline('.')

    " Get the char to test with the help of a pattern, ' ' or 'X':
    " \zs and \ze lets you retrieve only the part between themselves:
    let l:char = matchstr(l:line, '\[\zs.\ze]')

    if l:char == 'X'
        let l:char = ' '
    else
        let l:char = 'X'
    endif

    call setline(line('.'), substitute(l:line, '\[\zs.\ze]', l:char, ''))
endfunction
" End of Vim TODO List }}}
" End of Mappings }}}

" Icons
" ▶ » ◀ « ⤴ ➔ ➥ ⎇ ⊘ ¶ ρ ␊ ⎇ ρ Þ ∥ Ξ       

" if has("nvim")
"   let $PLUGIN_DIR = stdpath('data') . '/plugged'
" elseif has('win32')
"   let $PLUGIN_DIR = "~/vimfiles/plugged"
" else
"   let $PLUGIN_DIR = "~/.vim/plugged"
" endif

" call plug#begin($MYPLUGDIRECTORY)

" if has("nvim")
"   let s:plugin_dir = stdpath('data') . '/plugged'
" elseif has('win32')
"   let s:plugin_dir = "~/vimfiles/plugged"
" else
"   let s:plugin_dir = "~/.vim/plugged"
" endif

" call plug#begin(s:plugin_dir)

function! FlashYankedText()
    if (!exists('g:yankedTextMatches'))
        let g:yankedTextMatches = []
    endif

    let matchId = matchadd('IncSearch', ".\\%>'\\[\\_.*\\%<']..")
    let windowId = winnr()

    call add(g:yankedTextMatches, [windowId, matchId])
    call timer_start(500, 'DeleteTemporaryMatch')
endfunction

function! DeleteTemporaryMatch(timerId)
    while !empty(g:yankedTextMatches)
        let match = remove(g:yankedTextMatches, 0)
        let windowID = match[0]
        let matchID = match[1]

        try
            call matchdelete(matchID, windowID)
        endtry
    endwhile
endfunction

augroup highlightYankedText
    autocmd!
    autocmd TextYankPost * call FlashYankedText()
augroup END
