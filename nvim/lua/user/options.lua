local opt = vim.opt
local cmd = vim.cmd
local fn = vim.fn

cmd [[
  filetype on        " Turn on file type detection.
  filetype off       " Turn off file type detection.
  filetype plugin on " Turn on file type plugins. (By default enabled)
  syntax enable      " Enable syntax processing
  filetype indent on " Enable specific file based indentation (By default enabled)
]]

opt.title = true                            -- Set the terminal's title | {boolean} (default off)
opt.autoread = true                         -- Autoupdate when file changed from outside | {boolean} (default on)
opt.autowrite = false                       -- Automatically :write | {boolean} (default off)
opt.background = "dark"                     -- (default "dark") | {string} (default "dark")
opt.backspace = 'indent,eol,start'          -- Make backspace behave as it is | {string} (default "indent,eol,start")
opt.clipboard = "unnamedplus"               -- allows to access the system clipboard | {string} (default "")
opt.cmdheight = 1                           -- Height of commandbar | {number} (default 1)
opt.hidden = true                           -- Switch between buffers without save files (default true) | {boolean} (default on)
opt.history = 1000                          -- Number of lines history to remember | {number} (default 10000)
opt.laststatus = 3                          -- Always show status line | {number} (default 2)
-- opt.winbar = '%f'                           -- Enables the window bar and determines its contents
opt.lazyredraw = true                       -- Don't redraw while running macros in buffer| {boolean} (default off)
opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds) | {number} (default 1000)
opt.updatetime = 300                        -- faster completion | {number} (default 4000)
opt.undofile = true                         -- enable persistent undo | {boolean} (default off)
opt.showmatch = true                        -- highlight matching brackets | {boolean} (default off)
opt.showmode = false                        -- Show the current mode | {boolean} (default on)
opt.showcmd = true                          -- Show the last/incomplete command at bottom right of VIM | {boolean} (default off)
opt.showtabline = 2                         -- always show tabs | {number} (default 1)
-- opt.sidescrolloff = 8                       -- {number} (default 0)
opt.sidescrolloff = 8                       -- {number} (default 0)
opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time | {string} (default "auto")
opt.wrap = false                            -- Turn on line wrapping. | {boolean} (default on)
opt.list = true                             -- Show white space characters | {boolean} (default off)
-- opt.scrolloff = 3                           -- show context above/below cursorline. | {number} (default 0)
opt.scrolloff = 3                           -- show context above/below cursorline. | {number} (default 0)

opt.concealcursor = 'nc'                      -- {string} (default: "")
opt.conceallevel = 3                        -- use 0 to make `` visible in markdown files | {number} (default 0)

opt.textwidth = 80                          -- Lines longer than 79 columns will be broken | {number} (default 0)
opt.colorcolumn = '+1'                      -- Display line at the edge of textwidth, it might make screen redrawing slower | {string} (default "")
opt.cursorline = true                       -- highlight the current line | {boolean} (default off)

opt.fileencoding = "utf-8 nobomb"           -- Set utf8 as standard encoding, BOM often causes trouble | {string} (default "")
opt.fileformats = 'unix,dos,mac'            -- Use Unix as the standard file type | {string}
opt.spell = true                            -- spell checking | {boolean} (default off)
opt.spelllang = 'en_us'                     -- {string} (default "en")

opt.foldenable = true                       -- Enable folding option | {boolean} (default on)
opt.foldlevelstart = 10                     -- Open most folds by default | {number} (default -1)
opt.foldmethod = 'indent'                   -- Fold based on indent level | {string} (default "manual")
opt.foldnestmax = 10                        -- 10 nested fold max | {number} (default 20)

opt.gdefault = true                         -- /g flag on search by default | {boolean} (default off)
opt.hlsearch = true                         -- highlight all matches on previous search pattern | {boolean} (default true)
opt.ignorecase = true                       -- Case-insensitive searching. | {boolean} (default off)
opt.incsearch = true                        -- While typing a search command, show where the pattern as it was typed. | {boolean} (default on)
opt.magic = true                            -- Enable extended regexes. | {boolean} (default on)

opt.number = true                           -- set numbered lines | {boolean} (default off)
opt.relativenumber = false                  -- set relative numbered lines | {boolean} (default off)
opt.numberwidth = 4                         -- set number column width | {number} {default 4}

opt.omnifunc = 'syntaxcomplete#Complete'    -- {string} (default: empty)
opt.completeopt = 'longest,menuone,menu,preview' -- {string} (default: "menu,preview")
opt.wildmode = 'list:longest,full'          -- wildmenu in special format | {string} (default "full")
opt.pumheight = 10                          -- pop up menu height | {number} (default 0)
opt.ruler = true                            -- Always show cursor position | {boolean} (default on)
opt.rulerformat = '%=%h%m%r%w\\ %(%c%V%),%l/%L\\ %P' -- {string} (default empty)

opt.smartcase = true                        -- case-sensitive if expression contains a capital letter | {boolean} (default off)
opt.smartindent = true                      -- Automatically inserts one extra level of indentation | {boolean} (default off)
opt.smarttab = true                         -- Use the 'shiftwidth' setting for inserting tabs instead of 'tabstop' | {bollean} (default off)
opt.softtabstop = 2                         -- Number of spaces in tab when editing | {number} (default 0)
opt.tabstop = 2                             -- Number of visual spaces per tab | {number} (default 8)
opt.shiftround = true                       -- Round indent to multiple of 'shiftwidth' | {boolean} (default off)
opt.shiftwidth = 2                          -- Allow >> and << indent/unindent 2 visual spaces | {number} (default 8)
opt.expandtab = true                        -- Turns tab into spaces | {boolean} (default off)
opt.autoindent = true                       -- Align the new line indent match with previous line | {boolean} (default on)

opt.splitbelow = true                       -- :split will open new window below the current one | {boolean} (default off)
opt.splitright = true                       -- :vsplit will open new window right of the current one | {boolean} (default off)

opt.backup = false                          -- Creates a backup file | {boolean} (default off)
opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited | {boolean} (default on)
opt.swapfile = false                        -- Creates a swapfile | {boolean} (default on)
opt.termguicolors = true                    -- set term gui colors (most terminals support this) | {boolean} (default off)

opt.mouse = "a"                             -- allow the mouse to be used | {string} (default "")
opt.linespace = 0                           -- Number of space between lines. Only works in the GUI | {number} (default 0)
-- opt.guifont = 'FiraCode\\ Nerd\\ Font\\ Mono:h14'               -- The font used in graphical applications | {string} (default "")
-- cmd [[set guifont=FiraCode\ Nerd\ Font\ Mono:h18]]

opt.shortmess:append "c"  -- don't give |ins-completion-menu| messages.
opt.complete:append('kspell')
opt.path:append('**')  -- Recursively traverse to find something

vim.g.vim_json_syntax_conceal = 0          -- Disable conceal from JSON
vim.g.vim_json_conceal = 0

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
-- opt.grepprg = 'git\\ --no-pager\\ grep\\ --no-color\\ -n\\ $*'
opt.grepprg = 'git\\ --no-pager\\ grep\\ --no-color\\ -n\\ $*'
opt.grepformat = '%f:%l:%m,%m\\ %f\\ match%ts,%f'

-- Use ripgrep for search if available
if fn.executable('rg') then
  -- opt.grepprg = 'rg\\ --vimgrep\\ --no-heading'
  opt.grepprg = 'rg\\ --vimgrep\\ --no-heading'
  opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
end
-- End of Search }}}

-- Icons
-- ▶ » ◀ « ⤴ ➔ ➥ ⎇ ⊘ ¶ ρ ␊ ⎇ ρ Þ ∥ Ξ       
