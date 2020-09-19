set nocompatible " Set compatibility to Vim only

" Helps force plug-ins to load correctly when it is turned back on below
filetype on
filetype off

" ==============================================================================
" ============================ Plugin Configuration ============================
" ==============================================================================
 " Call the .vimrc.plug file
 " if filereadable(expand("~/.vimrc.plug"))
 "     source ~/.vimrc.plug
 " endif
call plug#begin('~/.vim/plugged')

" ------------------------------------------------------------------------------
" ------------------------------- Miscellaneous --------------------------------
" ------------------------------------------------------------------------------
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
" Plug 'ap/vim-buftabline'           " Shows only buffers in tabline
Plug 'pacha/vem-tabline'             " Shows buffers as well as tabs in tabline
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ------------------------------------------------------------------------------
" -------------------------------- Color Scheme --------------------------------
" ------------------------------------------------------------------------------
" Plug 'dracula/vim'                         " dracula (dark)
" Plug 'nightsense/cosmic_latte'             " cosmic_latte (dark|light)
" Plug 'antlypls/vim-colors-codeschool'      " codeschool
" Plug 'ayu-theme/ayu-vim'                   " ayu
" Plug 'gosukiwi/vim-atom-dark'              " atom-dark
" Plug 'rakr/vim-one'                        " one (dark|light)
" Plug 'mhartington/oceanic-next'            " OceanicNext | OceanicNextLight
" Plug 'drewtempelmeyer/palenight.vim'       " palenight (dark)
" Plug 'arcticicestudio/nord-vim'            " nord
" Plug 'cocopon/iceberg.vim'                 " iceberg
" Plug 'flrnd/plastic.vim'                   " plastic (dark)
Plug 'haishanh/night-owl.vim'              " night-owl

" ------------------------------------------------------------------------------
" ---------------------------- Syntax Highlighting -----------------------------
" ------------------------------------------------------------------------------
Plug 'sheerun/vim-polyglot'
Plug 'lilydjwg/colorizer'

" ------------------------------------------------------------------------------
" ---------------------------------- Linting -----------------------------------
" ------------------------------------------------------------------------------
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier'

" ------------------------------------------------------------------------------
" ------------------------------ File Management -------------------------------
" ------------------------------------------------------------------------------
Plug 'jremmen/vim-ripgrep'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" ------------------------------------------------------------------------------
" ------------------------------------ Git -------------------------------------
" ------------------------------------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

call plug#end()

" ==============================================================================
" ================================= Behavioural ================================
" ==============================================================================

" ------------------------------------------------------------------------------
" -------------------------------- Files/Backup --------------------------------
" ------------------------------------------------------------------------------
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

" ------------------------------------------------------------------------------
" ------------------------------- Miscellaneous --------------------------------
" ------------------------------------------------------------------------------
set clipboard=unnamed             " Use system clipboard
"
" Remove conceal feature it's hiding double quotes in JSON
set conceallevel=0
set concealcursor=""

set spell                 " spell checking
set spelllang=en_us
set encoding=utf-8 nobomb " Set utf8 as standard encoding, BOM often causes trouble
scriptencoding utf-8

set history=1000          " Number of lines history to remember

set visualbell " Turn off sounds
set ttyfast    " Speed up scrolling in vim buffer
set lazyredraw " Don't redraw while running macros in buffer
set hidden     " Switch between buffers without save files

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

" ==============================================================================
" ============================== User Interface ================================
" ==============================================================================

" ------------------------------------------------------------------------------
" ----------------------------------- Ruler ------------------------------------
" ------------------------------------------------------------------------------
set ruler        " Always show cursor position
set rulerformat=%=%h%m%r%w\ %(%c%V%),%l/%L\ %P
set showmode     " Show the current mode
set showcmd      " Show the last/incomplete command at bottom right of VIM
set cmdheight=1  " Height of commandbar
set laststatus=2 " Always show status line

" ------------------------------------------------------------------------------
" --------------------------------- Line Number --------------------------------
" ------------------------------------------------------------------------------
set number relativenumber " Show relative line numbers

" Show absolute line number in insert mode, and hybrid(absolute + relative) in normal mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" ------------------------------------------------------------------------------
" --------------------------------- Indentation --------------------------------
" ------------------------------------------------------------------------------
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

" ------------------------------------------------------------------------------
" --------------------------------- Status Bar ---------------------------------
" ------------------------------------------------------------------------------
function! ShowNewline() abort
  let s:newline_labels = {'unix': 'LF', 'mac': 'CR', 'dos': 'CRLF'}
  return get(s:newline_labels, &fileformat, &fileformat)
endfunction

set statusline=

set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ REPLACE\ ':''}
set statusline+=%#Visual#%{(mode()=='v:')?'\ \ VISUAL\ ':''}
set statusline+=%#Cursor#
set statusline+=\ %t
" set statusline+=\ %f
set statusline+=\ %h%m%r%w

set statusline+=%=

set statusline+=\ %{strlen(&ft)?&ft:'none'}
set statusline+=\ \ %{ShowNewline()}
set statusline+=\ \ %{strlen(&fileencoding)?toupper(&fileencoding):toupper(&encoding)}
" set statusline+=\ \ %{&expandtab?'Spaces':'Tab'}
" set statusline+=:
" set statusline+=%{shiftwidth()}
" set statusline+=\ \|
" set statusline+=\ Ln:
" set statusline+=%l
" set statusline+=,\ Col:
" set statusline+=%c
" set statusline+=\ \|
" set statusline+=\ %L
" set statusline+=\ Lines
" set statusline+=\ \|
" set statusline+=\ %p%%
set statusline+=\ \ %l:%c
set statusline+=\ \ %{LinterStatus()}
set statusline+=\ %#Visual#
set statusline+=%{strlen(FugitiveHead())?'\ '.FugitiveHead().'\ ':''}
set statusline+=%*

" ------------------------------------------------------------------------------
" ------------------------------ Page Title & Tabs -----------------------------
" ------------------------------------------------------------------------------
set title  " Set the terminal's title
set guitablabel=\[%N\]\ %t\ %M
" set tabline=\[%N\]\ %t\ %M
" set showtabline=1

" Showing current file name and current working directory on buffer change
autocmd BufEnter * let &titlestring = ' ' . expand("%:f") . ' - ' . fnamemodify(getcwd(), ':t')

" ------------------------------------------------------------------------------
" ------------------------------ Font Name & Size ------------------------------
" ------------------------------------------------------------------------------
" let g:fnt_name = 'Fira\ Code'
" let g:fnt_size = 15
" set guifont=Menlo:h11    " Set font for GUI

if has("gui_running")
  if has("gui_gtk2") || has("gui_gtk3")
    let g:fnt_name = 'Inconsolata'
    let g:fnt_size = 12
  elseif has("gui_macvim")
    let g:fnt_name = 'Menlo\ Regular'
    let g:fnt_size = 15
  elseif has("gui_win32")
    " let g:fnt_name = 'Consolas'
    let g:fnt_name = 'Menlo'
    let g:fnt_size = 11
  endif
endif

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

" ------------------------------------------------------------------------------
" -------------------------------- Color Scheme --------------------------------
" ------------------------------------------------------------------------------
syntax enable    " Enable syntax processing
set t_Co=256

" if has('gui_running')
"   set background=light
" else
"   set background=dark
" endif

set termguicolors     " enable true colors support

" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
colorscheme night-owl

" let schemes = [
"   \'one',
"   \'OceanicNext',
"   \'ayu',
"   \'atom-dark',
"   \'dracula',
"   \'cosmic_latte',
"   \'codeschool',
"   \'palenight',
"   \'nord',
"   \'iceberg',
"   \'plastic',
"   \'night-owl'
"   \]
" let seconds = str2nr(strftime('%S'))

" execute 'colorscheme '.schemes[seconds%len(schemes)]
" redraw

set background=dark

" ------------------------------------------------------------------------------
" ------------------------------- Miscellaneous --------------------------------
" ------------------------------------------------------------------------------
set lsp=0      " Number of space between lines (line spacing)
set cursorline " Highlight  current line
set wrap       " Turn on line wrapping.

set list       " Show white space characters
" Define symbols for listchars
" set listchars=nbsp:¬,eol:¶,tab:¦-,extends:»,precedes:«,trail:·
let &showbreak = '↳ '
set listchars=nbsp:¬,eol:¶,tab:-→,extends:»,precedes:«,trail:•

set guioptions-=m   " Show/Hide menu bar
set guioptions-=T   " Show/Hide toolbar
" set guioptions-=r   " Show/Hide scrollbar


" set lines=35 columns=150  " Vim to open with a given size
set textwidth=80          " Lines longer than 79 columns will be broken
set colorcolumn=+1        " Display line at the edge of textwidth

" ==============================================================================
" ============================= User Interaction ===============================
" ==============================================================================

" ------------------------------------------------------------------------------
" -------------------------------- Code Folding --------------------------------
" ------------------------------------------------------------------------------
set foldmethod=manual

" Commenting code below to make linting fast
set foldenable           " Enable folding option
set foldlevelstart=10    " Open most folds by default
set foldnestmax=10       " 10 nested fold max
set foldmethod=indent    " Fold based on indent level

" ------------------------------------------------------------------------------
" ----------------------------------- Search -----------------------------------
" ------------------------------------------------------------------------------
set path+=**                   " Recursively traverse to find something
set wildmenu                   " Visual autocomplete for command menu
set wildmode=list:longest,full " wildmenu in special format (long format)

" Ignore formats in wildmenu
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,tags
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png
set wildignore+=*/node_modules/*,*/bower_components/*,*/build/*

set ignorecase " Case-insensitive searching.
set smartcase  " But case-sensitive if expression contains a capital letter
set incsearch  " search as characters are entered
set hlsearch   " highlight matches
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

" ------------------------------------------------------------------------------
" ------------------------------- Miscellaneous --------------------------------
" ------------------------------------------------------------------------------

set showmatch  " highlight matching brackets
set splitright " :vsplit will open new window right of the current one
set splitbelow " :split will open new window below the current one

set mouse=a                    " Enable mouse in all modes
set backspace=indent,eol,start " Make backspace behave as it is

" Omni completion provides smart autocompletion for program use <C-x><C-o>
" filetype plugin on
" set omnifunc=syntaxcomplete#Complete

" Time Vim waits after you stop typing before it triggers the plugin.
" Default updatetime is 4000 milliseconds
" set updatetime=300
" set signcolumn=yes    " always show signcolumns
" signcolumn no/yes/auto to disappear/appear/auto
set scl=no
set scl=yes
set scl=auto
set scrolloff=3    " show context above/below cursorline.

" Activating builtin macro matchit to enable jump in xml/html tags
runtime macros/matchit.vim

" ==============================================================================
" ================================= Plugins ====================================
" ==============================================================================

" ------------------------------------------------------------------------------
" ----------------------------------- NetRW ------------------------------------
" ------------------------------------------------------------------------------
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

" ------------------------------------------------------------------------------
" ----------------------------------- ripgrep ----------------------------------
" ------------------------------------------------------------------------------
" use rg to search through ripgrep with smartcase enabled -S
let g:rg_command = 'rg --vimgrep -S'
let g:rg_highlight = 'true'

" ------------------------------------------------------------------------------
" ------------------------------------ CtrlP -----------------------------------
" ------------------------------------------------------------------------------
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'

" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" if has('win32')
"   let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d' " Windows
" else
"   let g:ctrlp_user_command = 'find %s -type f' " MacOSX/Linux
" endif

" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" " Using ripgrep if avaliable
" if executable('rg')
"   let g:ctrlp_user_command = 'rg -F --files %s'
"   let g:ctrlp_use_caching = 0
" endif
" " let g:ctrlp_max_files=0

" ------------------------------------------------------------------------------
" ------------------------------- Indent Guides --------------------------------
" ------------------------------------------------------------------------------
let g:indent_guides_guide_size = 1

" ------------------------------------------------------------------------------
" ----------------------------------- Emmet ------------------------------------
" ------------------------------------------------------------------------------
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_setting = { 'javascript.jsx' : { 'extends': 'jsx', }, }

" ------------------------------------------------------------------------------
" ------------------------------------ Ale -------------------------------------
" ------------------------------------------------------------------------------
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)

" highlight ALEErrorSign ctermfg=9 ctermbg=NONE guifg=#C30500 guibg=NONE
" highlight ALEWarningSign ctermfg=11 ctermbg=NONE guifg=#ED6237 guibg=NONE

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '🚸'

"📄💡"📄💡▲✘⚠️!X

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

" ------------------------------------------------------------------------------
" ------------------------------------ COC -------------------------------------
" ------------------------------------------------------------------------------
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions

" let g:coc_node_path = '/Users/yourname/.nvm/versions/node/v14.8.0/bin/node'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ==============================================================================
" ================================== Mappings ==================================
" ==============================================================================
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
" ------------------------------------------------------------------------------

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

" ------------------------------------------------------------------------------
" -------------------------------- Split window --------------------------------
" ------------------------------------------------------------------------------
" Move cursor to right window
nnoremap <C-l> <C-w>l

" Move cursor to left window
nnoremap <C-h> <C-w>h

" Move cursor to window below
nnoremap <C-j> <C-w>j

" Move cursor to window top
nnoremap <C-k> <C-w>k

" Scale horizontal split window by 3 rows
if has("gui_macvim")
  nnoremap <silent> <D-Up> :resize +3<cr>
else
  nnoremap <silent> <C-Up> :resize +3<cr>
endif

" Scale down horizontal split window by 3 rows
if has("gui_macvim")
  nnoremap <silent> <D-Down> :resize -3<cr>
else
  nnoremap <silent> <C-Down> :resize -3<cr>
endif

" Scale vertical split window by 3 rows
if has("gui_macvim")
  nnoremap <silent> <D-Right> :vertical resize +3<cr>
else
  nnoremap <silent> <C-Right> :vertical resize +3<cr>
endif

" Scale down vertical split window by 3 rows
if has("gui_macvim")
  nnoremap <silent> <D-Left> :vertical resize -3<cr>
else
  nnoremap <silent> <C-Left> :vertical resize -3<cr>
endif

" ------------------------------------------------------------------------------
" --------------------------- Navigating between tabs --------------------------
" ------------------------------------------------------------------------------
nmap <silent> ]t :tabnext<CR>
nmap <silent> [t :tabprevious<CR>
nmap <silent> ]T :tabfirst<CR>
nmap <silent> [T :tablast<CR>

" ------------------------------------------------------------------------------
" ------------------------ Navigating the quickfix list ------------------------
" ------------------------------------------------------------------------------
nmap <silent> ]q :cnext<CR>zv
nmap <silent> [q :cprevious<CR>zv
nmap <silent> ]Q :cfirst<CR>zv
nmap <silent> [Q :clast<CR>zv

" ------------------------------------------------------------------------------
" -------------------------- Navigating between buffer -------------------------
" ------------------------------------------------------------------------------
" List buffer and prepare (buffer switch)
" nnoremap <Leader>bs :ls<CR>:b<Space>

" Delete all buffers but current (buffer only)
nnoremap <silent> <Leader>bo :%bd\|e#\|bd# <CR>

nmap <silent> ]b :bnext<CR>
nmap <silent> [b :bprevious<CR>

" ------------------------------------------------------------------------------
" ------------------------------ Change fontsize -------------------------------
" ------------------------------------------------------------------------------
nnoremap <silent> <leader>= :call FontScaleUp()<CR>
nnoremap <silent> <leader>- :call FontScaleDown()<CR>

" ------------------------------------------------------------------------------
" ----------------------------------- NetRW ------------------------------------
" ------------------------------------------------------------------------------
" Toggle Vexplore
" function! ToggleVExplorer()
"   if exists("t:expl_buf_num")
"     let expl_win_num = bufwinnr(t:expl_buf_num)
"     let cur_win_num = winnr()

"     if expl_win_num != -1
"       while expl_win_num != cur_win_num
"         exec "wincmd w"
"         let cur_win_num = winnr()
"       endwhile

"       close
"     endif

"     unlet t:expl_buf_num
"   else
"     Vexplore
"     let t:expl_buf_num = bufnr("%")
"   endif
" endfunction

" Open exlorer in sidebar
" map <silent> <leader>n :call ToggleVExplorer()<CR>

" Open parent directory
nnoremap <silent> - :Explore<CR>

" Open root directory
nnoremap <silent> _ :Ntree<CR>

" ------------------------------------------------------------------------------
" --------------------------------- Auto Pairs ---------------------------------
" ------------------------------------------------------------------------------
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ` ``<left>
" inoremap ( ()<left>
" inoremap (<CR> (<CR>)<ESC>O
" inoremap [ []<left>
" inoremap [<CR> [<CR>]<ESC>O
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O

" ------------------------------------------------------------------------------
" ----------- Visually select text then press ~ to change text case ------------
" ------------------------------------------------------------------------------
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

" ------------------------------------------------------------------------------
" ---- Move current line or selected block up and down with Alt+j and Alt+k ----
" ------------------------------------------------------------------------------
nnoremap <silent> <leader>j :move .+1<CR>==
nnoremap <silent> <leader>k :move .-2<CR>==
vnoremap <silent> <leader>j :move '>+1<CR>gv=gv
vnoremap <silent> <leader>k :move '<-2<CR>gv=gv

" ------------------------------------------------------------------------------
" ----------------------------------- Popups -----------------------------------
" ------------------------------------------------------------------------------
nnoremap <leader>cd :call popup_clear() <CR>

" ------------------------------------------------------------------------------
" ---------------------------------- Vim clap ----------------------------------
" ------------------------------------------------------------------------------
nnoremap <silent> <leader>F :Clap<CR>
nnoremap <silent> <leader>f :Clap files<CR>
nnoremap <silent> <leader>/ :Clap grep<CR>
nnoremap <silent> <leader>* :Clap grep ++query=<cword><CR>
vnoremap <silent> <leader>* :Clap grep ++query=@visual<CR>
nnoremap <Leader>bs :Clap buffers<CR>

" ------------------------------------------------------------------------------
" ------------------------------------ CtrlP -----------------------------------
" ------------------------------------------------------------------------------
" Open fuzzy search filename
" nmap <silent> <leader>f :CtrlP<CR>

" Open fuzzy search most recent files
" nmap <silent> <leader>r :CtrlPMRU<CR>

" Open fuzzy search buffers
" nmap <silent> <leader>b :CtrlPBuffer<CR>
"
" Open fuzzy search tags
" nmap <silent> <leader>b :CtrlPTag<CR>

" ------------------------------------------------------------------------------
" ------------------------------------ ALE -------------------------------------
" ------------------------------------------------------------------------------
nnoremap <silent> <leader>af :ALEFix<CR>
nmap <silent> ]e <Plug>(ale_next_wrap)
nmap <silent> [e <Plug>(ale_previous_wrap)

" ------------------------------------------------------------------------------
" --------------------------------- Git Gutter ---------------------------------
" ------------------------------------------------------------------------------
nnoremap <silent> ]h :GitGutterNextHunk<CR>
nnoremap <silent> [h :GitGutterPrevHunk<CR>

" ------------------------------------------------------------------------------
" ------------------------------------ COC -------------------------------------
" ------------------------------------------------------------------------------
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <c-]> <Plug>(coc-definition)
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Use ,sd to show documentation in preview window
nnoremap <silent> <leader>sd :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Show all diagnostics
nnoremap <silent> <leader>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR>

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

"if has('win32')
  " windows
"elseif has('mac')
  " for mac user
"elseif has('unix')
  " for unix
"endif
"if has('nvim')
  " for neovim
"endif

" noremap d "_d
" noremap c "_c
" noremap r d
" nnoremap <silent> <C-x><C-=> :call FontScaleUp()<CR>