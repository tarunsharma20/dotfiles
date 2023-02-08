local utils = require('utils')

local go = utils.go
local bo = utils.bo
local wo = utils.wo
local opt = utils.opt
local fn = utils.fn
local cmd = utils.cmd

cmd [[
  filetype on        " Turn on file type detection.
  filetype off       " Turn off file type detection.
  filetype plugin on " Turn on file type plugins. (By default enabled)
  syntax enable      " Enable syntax processing
  filetype indent on " Enable specific file based indentation (By default enabled)
]]

go.title = true                            -- Set the terminal's title | {boolean} (default off)
bo.autoread = true                         -- Autoupdate when file changed from outside | {boolean} (default on)
-- go.autoread = true                         -- Autoupdate when file changed from outside | {boolean} (default on)
go.autowrite = false                       -- Automatically :write | {boolean} (default off)
go.background = "dark"                     -- (default "dark") | {string} (default "dark")
go.backspace = 'indent,eol,start'          -- Make backspace behave as it is | {string} (default "indent,eol,start")
go.clipboard = "unnamedplus"               -- allows to access the system clipboard | {string} (default "")
go.cmdheight = 1                           -- Height of commandbar | {number} (default 1)
go.hidden = true                           -- Switch between buffers without save files (default true) | {boolean} (default on)
go.history = 1000                          -- Number of lines history to remember | {number} (default 10000)
go.laststatus = 3                          -- Always show status line | {number} (default 2)
-- wo.winbar = '%f'                           -- Enables the window bar and determines its contents
go.lazyredraw = true                       -- Don't redraw while running macros in buffer| {boolean} (default off)
go.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds) | {number} (default 1000)
go.updatetime = 300                        -- faster completion | {number} (default 4000)
bo.undofile = true                         -- enable persistent undo | {boolean} (default off)
go.showmatch = true                        -- highlight matching brackets | {boolean} (default off)
go.showmode = false                        -- Show the current mode | {boolean} (default on)
go.showcmd = true                          -- Show the last/incomplete command at bottom right of VIM | {boolean} (default off)
go.showtabline = 2                         -- always show tabs | {number} (default 1)
-- go.sidescrolloff = 8                       -- {number} (default 0)
wo.sidescrolloff = 8                       -- {number} (default 0)
wo.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time | {string} (default "auto")
wo.wrap = false                            -- Turn on line wrapping. | {boolean} (default on)
wo.list = true                             -- Show white space characters | {boolean} (default off)
-- go.scrolloff = 3                           -- show context above/below cursorline. | {number} (default 0)
wo.scrolloff = 3                           -- show context above/below cursorline. | {number} (default 0)

wo.concealcursor = ''                      -- {string} (default: "")
wo.conceallevel = 0                        -- so that `` is visible in markdown files | {number} (default 0)

bo.textwidth = 80                          -- Lines longer than 79 columns will be broken | {number} (default 0)
wo.colorcolumn = '+1'                      -- Display line at the edge of textwidth, it might make screen redrawing slower | {string} (default "")
wo.cursorline = true                       -- highlight the current line | {boolean} (default off)

bo.fileencoding = "utf-8 nobomb"           -- Set utf8 as standard encoding, BOM often causes trouble | {string} (default "")
go.fileformats = 'unix,dos,mac'            -- Use Unix as the standard file type | {string}
wo.spell = true                            -- spell checking | {boolean} (default off)
bo.spelllang = 'en_us'                     -- {string} (default "en")

wo.foldenable = true                       -- Enable folding option | {boolean} (default on)
go.foldlevelstart = 10                     -- Open most folds by default | {number} (default -1)
wo.foldmethod = 'indent'                   -- Fold based on indent level | {string} (default "manual")
wo.foldnestmax = 10                        -- 10 nested fold max | {number} (default 20)

go.gdefault = true                         -- /g flag on search by default | {boolean} (default off)
go.hlsearch = true                         -- highlight all matches on previous search pattern | {boolean} (default true)
go.ignorecase = true                       -- Case-insensitive searching. | {boolean} (default off)
go.incsearch = true                        -- While typing a search command, show where the pattern as it was typed. | {boolean} (default on)
go.magic = true                            -- Enable extended regexes. | {boolean} (default on)

wo.number = true                           -- set numbered lines | {boolean} (default off)
wo.relativenumber = false                  -- set relative numbered lines | {boolean} (default off)
wo.numberwidth = 4                         -- set number column width | {number} {default 4}

bo.omnifunc = 'syntaxcomplete#Complete'    -- {string} (default: empty)
go.completeopt = 'longest,menuone,menu,preview' -- {string} (default: "menu,preview")
go.wildmode = 'list:longest,full'          -- wildmenu in special format | {string} (default "full")
go.pumheight = 10                          -- pop up menu height | {number} (default 0)
go.ruler = true                            -- Always show cursor position | {boolean} (default on)
go.rulerformat = '%=%h%m%r%w\\ %(%c%V%),%l/%L\\ %P' -- {string} (default empty)

go.smartcase = true                        -- case-sensitive if expression contains a capital letter | {boolean} (default off)
bo.smartindent = true                      -- Automatically inserts one extra level of indentation | {boolean} (default off)
go.smarttab = true                         -- Use the 'shiftwidth' setting for inserting tabs instead of 'tabstop' | {bollean} (default off)
bo.softtabstop = 2                         -- Number of spaces in tab when editing | {number} (default 0)
bo.tabstop = 2                             -- Number of visual spaces per tab | {number} (default 8)
go.shiftround = true                       -- Round indent to multiple of 'shiftwidth' | {boolean} (default off)
bo.shiftwidth = 2                          -- Allow >> and << indent/unindent 2 visual spaces | {number} (default 8)
bo.expandtab = true                        -- Turns tab into spaces | {boolean} (default off)
bo.autoindent = true                       -- Align the new line indent match with previous line | {boolean} (default on)

go.splitbelow = true                       -- :split will open new window below the current one | {boolean} (default off)
go.splitright = true                       -- :vsplit will open new window right of the current one | {boolean} (default off)

go.backup = false                          -- Creates a backup file | {boolean} (default off)
go.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited | {boolean} (default on)
bo.swapfile = false                        -- Creates a swapfile | {boolean} (default on)
go.termguicolors = true                    -- set term gui colors (most terminals support this) | {boolean} (default off)

go.mouse = "a"                             -- allow the mouse to be used | {string} (default "")
go.linespace = 0                           -- Number of space between lines. Only works in the GUI | {number} (default 0)
-- go.guifont = 'FiraCode\\ Nerd\\ Font\\ Mono:h14'               -- The font used in graphical applications | {string} (default "")
-- cmd [[set guifont=FiraCode\ Nerd\ Font\ Mono:h18]]

opt.shortmess:append "c"  -- don't give |ins-completion-menu| messages.
opt.complete:append('kspell')
opt.path:append('**')  -- Recursively traverse to find something

cmd "set whichwrap+=<,>,[,],h,l"
cmd [[set iskeyword+=-]]

-- cmd [[
-- try
--   colorscheme witching-hour
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]]

-- Define symbols for listchars
cmd [[
  set listchars=nbsp:¤,eol:¶,tab:→\ ,extends:»,precedes:«,trail:·
  let &showbreak = '↳ '
]]

-- Ignore formats in wildmenu
opt.wildignore = {'*.dll', '*.o', '*.obj', '*.bak', '*.exe', '*.pyc', '*.swp', 'tags'}
opt.wildignore:append({'*.bmp', '*.gif', '*.ico', '*.jpg', '*.jpeg', '*.png'})
opt.wildignore:append({'*/node_modules/*', '*/bower_components/*', '*/build/*'})

-- Use git for search from grep command
-- go.grepprg = 'git\\ --no-pager\\ grep\\ --no-color\\ -n\\ $*'
bo.grepprg = 'git\\ --no-pager\\ grep\\ --no-color\\ -n\\ $*'
go.grepformat = '%f:%l:%m,%m\\ %f\\ match%ts,%f'

-- Use ripgrep for search if available
if fn.executable('rg') then
  -- go.grepprg = 'rg\\ --vimgrep\\ --no-heading'
  bo.grepprg = 'rg\\ --vimgrep\\ --no-heading'
  go.grepformat = '%f:%l:%c:%m,%f:%l:%m'
end
-- End of Search }}}

-- Icons
-- ▶ » ◀ « ⤴ ➔ ➥ ⎇ ⊘ ¶ ρ ␊ ⎇ ρ Þ ∥ Ξ       
