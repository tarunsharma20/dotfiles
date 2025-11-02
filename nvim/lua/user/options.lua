-- Line numbers and cursor
vim.opt.number = true         -- set numbered lines | {boolean} (default off)
vim.opt.relativenumber = true -- set relative numbered lines | {boolean} (default off)
vim.opt.scrolloff = 3         -- show context above/below cursorline. | {number} (default 0)
vim.opt.cursorline = true     -- highlight the current line | {boolean} (default off)

-- Tabs and indentation
vim.opt.smartindent = true -- Automatically inserts one extra level of indentation | {boolean} (default off)
vim.opt.smarttab = true    -- Use the 'shiftwidth' setting for inserting tabs instead of 'tabstop' | {bollean} (default off)
vim.opt.softtabstop = 2    -- Number of spaces in tab when editing | {number} (default 0)
vim.opt.tabstop = 2        -- Number of visual spaces per tab | {number} (default 8)
vim.opt.shiftround = true  -- Round indent to multiple of 'shiftwidth' | {boolean} (default off)
vim.opt.shiftwidth = 2     -- Allow >> and << indent/unindent 2 visual spaces | {number} (default 8)
vim.opt.expandtab = true   -- Turns tab into spaces | {boolean} (default off)

-- Search and highlighting
vim.opt.gdefault = true   -- /g flag on search by default | {boolean} (default off)
vim.opt.ignorecase = true -- Case-insensitive searching. | {boolean} (default off)
vim.opt.smartcase = true  -- case-sensitive if expression contains a capital letter | {boolean} (default off)
-- vim.opt.hlsearch = true -- highlight all matches on previous search pattern | {boolean} (default true)
-- vim.opt.incsearch = true -- While typing a search command, show where the pattern as it was typed. | {boolean} (default on)
vim.opt.path:append("**") -- Recursively traverse to find something

-- Use git for search from grep command
vim.opt.grepprg = "git\\ --no-pager\\ grep\\ --no-color\\ -n\\ $*"
vim.opt.grepformat = "%f:%l:%m,%m\\ %f\\ match%ts,%f"

-- Use ripgrep for search if available
if vim.fn.executable("rg") then
  vim.opt.grepprg = "rg\\ --vimgrep\\ --no-heading"
  vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end
--
-- Ignore formats in wildmenu
vim.opt.wildignore = { "*.dll", "*.o", "*.obj", "*.bak", "*.exe", "*.pyc", "*.swp", "tags" }
vim.opt.wildignore:append({ "*.bmp", "*.gif", "*.ico", "*.jpg", "*.jpeg", "*.png" })
vim.opt.wildignore:append({ "*/node_modules/*", "*/bower_components/*", "*/build/*" })


-- Split window behavior
vim.opt.splitbelow = true -- :split will open new window below the current one | {boolean} (default off)
vim.opt.splitright = true -- :vsplit will open new window right of the current one | {boolean} (default off)

-- Files and backups
vim.opt.undofile = true     -- enable persistent undo | {boolean} (default off)
vim.opt.undodir = os.getenv("HOME") .. "/.undodir"
vim.opt.backup = false      -- Creates a backup file | {boolean} (default off)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited | {boolean} (default on)
vim.opt.swapfile = false    -- Creates a swapfile | {boolean} (default on)


-- User interface
vim.opt.concealcursor = "nc"      -- {string} (default: "")
vim.opt.conceallevel = 0          -- use 0 to make `` visible in markdown files | {number} (default 0)

vim.opt.title = true              -- Set the terminal's title | {boolean} (default off)
vim.opt.clipboard = "unnamedplus" -- allows to access the system clipboard | {string} (default "")
vim.opt.history = 1000            -- Number of lines history to remember | {number} (default 10000)
vim.opt.laststatus = 3            -- Always show status line | {number} (default 2)
vim.opt.lazyredraw = true         -- Don't redraw while running macros in buffer| {boolean} (default off)
vim.opt.updatetime = 300          -- faster completion | {number} (default 4000)
vim.opt.showmatch = true          -- highlight matching brackets | {boolean} (default off)
vim.opt.showmode = false          -- Show the current mode | {boolean} (default on)
vim.opt.showcmd = true            -- Show the last/incomplete command at bottom right of VIM | {boolean} (default off)
vim.opt.showtabline = 2           -- always show tabs | {number} (default 1)
vim.opt.sidescrolloff = 8         -- {number} (default 0)
vim.opt.signcolumn =
"yes"                             -- always show the sign column, otherwise it would shift the text each time | {string} (default "auto")
vim.opt.wrap = false              -- Turn on line wrapping. | {boolean} (default on)
vim.opt.list = true               -- Show white space characters | {boolean} (default off)


vim.opt.textwidth = 80                -- Lines longer than 79 columns will be broken | {number} (default 0)
vim.opt.colorcolumn =
"+1"                                  -- Display line at the edge of textwidth, it might make screen redrawing slower | {string} (default "")

vim.opt.fileencoding = "utf-8 nobomb" -- Set utf8 as standard encoding, BOM often causes trouble | {string} (default "")
vim.opt.fileformats = "unix,dos,mac"  -- Use Unix as the standard file type | {string}
vim.opt.spell = true                  -- spell checking | {boolean} (default off)
vim.opt.spelllang = "en_us"           -- {string} (default "en")

vim.opt.foldlevelstart = 10           -- Open most folds by default | {number} (default -1)
vim.opt.foldmethod = "indent"         -- Fold based on indent level | {string} (default "manual")
vim.opt.foldnestmax = 10              -- 10 nested fold max | {number} (default 20)


vim.opt.omnifunc = "syntaxcomplete#Complete"             -- {string} (default: empty)
vim.opt.completeopt = "longest,menuone,menu,preview"     -- {string} (default: "menu,preview")
vim.opt.wildmode = "list:longest,full"                   -- wildmenu in special format | {string} (default "full")
vim.opt.pumheight = 10                                   -- pop up menu height | {number} (default 0)
vim.opt.rulerformat = "%=%h%m%r%w\\ %(%c%V%),%l/%L\\ %P" -- {string} (default empty)

-- opt.autoindent = true -- Align the new line indent match with previous line | {boolean} (default on)


vim.opt.termguicolors = true -- set term gui colors (most terminals support this) | {boolean} (default off)

vim.opt.mouse = "a"          -- allow the mouse to be used | {string} (default "")
-- vim.opt.guifont = 'FiraCode\\ Nerd\\ Font\\ Mono:h14'               -- The font used in graphical applications | {string} (default "")

vim.opt.shortmess:append("c") -- don't give |ins-completion-menu| messages.
vim.opt.complete:append("kspell")

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])


-- Define symbols for listchars
vim.opt.listchars = { nbsp = '¤', eol = '¶', tab = '→\\ ', extends = '»', precedes = '«', trail = '·' }
vim.cmd([[
  let &showbreak = '↳ '
]])
