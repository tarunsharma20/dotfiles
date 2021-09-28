-- =============================================================================
-- ================================== Options ==================================
-- ========================================================================= {{{
local set = vim.opt                      -- Global, window and buffer options
local fn = vim.fn                        -- Vim function
local cmd = vim.cmd                      -- Vim command
-- -----------------------------------------------------------------------------
-- ------------------------------- Behavioural ---------------------------------
-- ------------------------------------------------------------------------- {{{

-- ------------------------------ Files/Backup ----------------------------- {{{
-- font alternative
-- set.nobackup = true          -- Don't make backup before overwriting a file
-- set.noswapfile = true        -- Disable file swapping
-- set.nowritebackup = true     -- And again
-- set.backupdir = fn.stdpath('data')..'/nvim/backup'   -- backup files directory
-- set.directory = fn.stdpath('data')..'/nvim/swaps'    -- temp files directory
-- if fn.exists('&undodir') then
--  set.undodir = fn.stdpath('data')..'/nvim/undo'      -- undo history directory
-- end

-- don't give |ins-completion-menu| messages.
set.shortmess:append('c')
-- End of File/Backup }}}

-- ----------------------------- Miscellaneous ----------------------------- {{{
set.clipboard = 'unnamed'             -- Use system clipboard

-- Remove conceal feature it's hiding double quotes in JSON
-- set.conceallevel = 0
set.concealcursor = ''
set.spell = true                 -- spell checking
set.spelllang = 'en_us'
set.lazyredraw = true             -- Don't redraw while running macros in buffer
set.fileformats = {'unix', 'dos', 'mac'} -- Use Unix as the standard file type
cmd [[
  filetype on        " Turn on file type detection.
  filetype off       " Turn off file type detection.
  filetype plugin on " Turn on file type plugins.
]]

if fn.has("win32") == 1 then
  -- set.shell=~/AppData/Local/Programs/Git/bin/bash.exe
  -- set.shellslash     -- Use unix style slash in windows as well
end
-- End of Miscellaneous }}}
-- End of Behavioural }}}

-- -----------------------------------------------------------------------------
-- ------------------------------ User Interface -------------------------------
-- ------------------------------------------------------------------------- {{{

-- ----------------------------------- Ruler ------------------------------- {{{
set.rulerformat = '%=%h%m%r%w\\ %(%c%V%),%l/%L\\ %P'
set.showmode = true                                     -- Show the current mode
set.cmdheight = 1                                       -- Height of commandbar
-- End of Ruler }}}

-- ------------------------------ Line Number ------------------------------ {{{
set.number = true -- Show relative line numbers

-- End of Line Number }}}

-- ------------------------------ Indentation ------------------------------ {{{
set.shiftwidth = 2       -- Allow >> and << indent/unindent 2 visual spaces
set.tabstop = 2          -- Number of visual spaces per tab
set.expandtab = true     -- Turns tab into spaces
set.softtabstop = 2      -- Number of spaces in tab when editing
set.shiftround = true    -- Round indent to multiple of 'shiftwidth'
set.smartindent = true   -- Automatically inserts one extra level of indentation
-- End of Indentation }}}

-- --------------------------- Page Title & Tabs --------------------------- {{{
set.title = true  -- Set the terminal's title
-- End of Page Title & Tabs }}}

-- ----------------------------- Color Scheme ------------------------------ {{{
set.termguicolors = true     -- enable true colors support
cmd 'colorscheme witching-hour'
-- End of Color Scheme }}}

-- ----------------------------- Miscellaneous ----------------------------- {{{
set.linespace = 0                -- Number of space between lines (line spacing)
set.cursorline = true            -- Highlight  current line
set.wrap = true                  -- Turn on line wrapping.
set.list = true                  -- Show white space characters

-- Define symbols for listchars
cmd [[
  set listchars=nbsp:¤,eol:¶,tab:→\ ,extends:»,precedes:«,trail:·
  let &showbreak = '↳ '
]]

if fn.has('gui_running') == 1 then
  set.guioptions:remove('m')   -- Show/Hide menu bar
  set.guioptions:remove('T')   -- Show/Hide toolbar
end

set.textwidth = 80                -- Lines longer than 79 columns will be broken
set.colorcolumn = '+1'            -- Display line at the edge of textwidth
-- End of Miscellaneous }}}
-- End of User Interface }}}

-- -----------------------------------------------------------------------------
-- -----------------------------  User Interaction -----------------------------
-- ------------------------------------------------------------------------- {{{

-- ------------------------------ Code Folding ----------------------------- {{{
set.foldenable = true            -- Enable folding option
set.foldlevelstart = 10          -- Open most folds by default
set.foldnestmax = 10             -- 10 nested fold max
set.foldmethod = 'indent'        -- Fold based on indent level

-- End of Code Folding }}}

-- -------------------------------- Search --------------------------------- {{{
set.path:append('**')                   -- Recursively traverse to find something
set.wildmode = {'list:longest' , 'full'} -- wildmenu in special format (long format)

-- Ignore formats in wildmenu
set.wildignore = {'*.dll', '*.o', '*.obj', '*.bak', '*.exe', '*.pyc', '*.swp', 'tags'}
set.wildignore:append({'*.bmp', '*.gif', '*.ico', '*.jpg', '*.jpeg', '*.png'})
set.wildignore:append({'*/node_modules/*', '*/bower_components/*', '*/build/*'})

set.ignorecase = true -- Case-insensitive searching.
set.smartcase = true  -- But case-sensitive if expression contains a capital letter
set.magic = true      -- Enable extended regexes.
set.gdefault = true   -- /g flag on search by default
--set.noautocmd

-- Use git for search from grep command
set.grepprg = 'git\\ --no-pager\\ grep\\ --no-color\\ -n\\ $*'
set.grepformat = {'%f:%l:%m', '%m\\ %f\\ match%ts', '%f'}

-- Use ripgrep for search if available
if fn.executable('rg') then
  set.grepprg = 'rg\\ --vimgrep\\ --no-heading'
  set.grepformat = '%f:%l:%c:%m,%f:%l:%m'
end
-- End of Search }}}

-- ----------------------------- Miscellaneous ----------------------------- {{{
set.showmatch = true  -- highlight matching brackets
set.splitright = true -- :vsplit will open new window right of the current one
set.splitbelow = true -- :split will open new window below the current one

set.mouse = 'a'                    -- Enable mouse in all modes

-- Omni completion provides smart autocompletion for program use <C-x><C-o>
-- <C-x><C-f> completes filepath, <C-x><C-]> completes based on tags,
-- <C-n> invokes keyword completion.
set.complete:append('kspell')
set.completeopt = {'longest', 'menuone', 'menu', 'preview'}
set.omnifunc = 'syntaxcomplete#Complete'

set.signcolumn = 'auto'
set.scrolloff = 3    -- show context above/below cursorline.

-- End of Miscellaneous }}}
-- End of User Interaction }}}

-- Icons
-- ▶ » ◀ « ⤴ ➔ ➥ ⎇ ⊘ ¶ ρ ␊ ⎇ ρ Þ ∥ Ξ       

