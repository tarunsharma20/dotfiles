vim.cmd [[
  filetype on        " Turn on file type detection.
  filetype off       " Turn off file type detection.
  filetype plugin on " Turn on file type plugins. (By default enabled)
  syntax enable      " Enable syntax processing
  filetype indent on " Enable specific file based indentation (By default enabled)
]]

local options = {
  autoindent = true,                       -- Align the new line indent match with previous line (default true)
  autoread = true,                         -- Autoupdate when file changed from outside (default true)
  autowrite = false,                       -- Automatically :write
  background = "dark",                     -- (default "dark")
  backspace = {'indent', 'eol', 'start'},  -- Make backspace behave as it is (default "indent,eol,start")
  backup = false,                          -- Creates a backup file
  clipboard = "unnamedplus",               -- allows to access the system clipboard
  cmdheight = 1,                           -- Height of commandbar
  colorcolumn = '+1',                      -- Display line at the edge of textwidth
  completeopt = {'longest', 'menuone', 'menu', 'preview'},
  concealcursor = '',
  conceallevel = 0,                        -- so that `` is visible in markdown files
  cursorline = true,                       -- highlight the current line
  expandtab = true,                        -- Turns tab into spaces
  ffs = {'unix', 'dos', 'mac'},            -- Use Unix as the standard file type
  fileencoding = "utf-8 nobomb",           -- Set utf8 as standard encoding, BOM often causes trouble
  fileformats = {'unix', 'dos', 'mac'},    -- Use Unix as the standard file type
  foldenable = true,                       -- Enable folding option
  foldlevelstart = 10,                     -- Open most folds by default
  foldmethod = 'indent',                   -- Fold based on indent level
  foldnestmax = 10,                        -- 10 nested fold max
  gdefault = true,                         -- /g flag on search by default
  guifont = 'FiraCode\\ Nerd\\ Font\\ Mono:h14',               -- The font used in graphical applications
  hidden = true,                           -- Switch between buffers without save files (default true)
  history = 1000,                          -- Number of lines history to remember (default 10000)
  hlsearch = true,                         -- highlight all matches on previous search pattern ( default true)
  ignorecase = true,                       -- Case-insensitive searching.
  incsearch = true,                        -- (default true)
  laststatus = 3,                          -- Always show status line (default 2)
  lazyredraw = true,                       -- Don't redraw while running macros in buffer
  linespace = 0,                           -- Number of space between lines (line spacing)
  list = true,                             -- Show white space characters
  magic = true,                            -- Enable extended regexes.
  mouse = "a",                             -- allow the mouse to be used
  number = true,                           -- set numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  omnifunc = 'syntaxcomplete#Complete',
  pumheight = 10,                          -- pop up menu height
  relativenumber = false,                  -- set relative numbered lines
  ruler = true,                            -- Always show cursor position (default true)
  rulerformat = '%=%h%m%r%w\\ %(%c%V%),%l/%L\\ %P',
  scrolloff = 3,                           -- show context above/below cursorline.
  shiftround = true,                       -- Round indent to multiple of 'shiftwidth'
  shiftwidth = 2,                          -- Allow >> and << indent/unindent 2 visual spaces
  showcmd = true,                          -- Show the last/incomplete command at bottom right of VIM (default true)
  showmatch = true,                        -- highlight matching brackets
  showmode = false,                        -- Show the current mode
  showtabline = 2,                         -- always show tabs
  sidescrolloff = 8,
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  smartcase = true,                        -- case-sensitive if expression contains a capital letter
  smartindent = true,                      -- Automatically inserts one extra level of indentation
  smarttab = true,                         -- Use the 'shiftwidth' setting for inserting tabs instead of 'tabstop' (default true)
  softtabstop = 2,                         -- Number of spaces in tab when editing
  spell = true,                            -- spell checking
  spelllang = 'en_us',
  splitbelow = true,                       -- :split will open new window below the current one
  splitright = true,                       -- :vsplit will open new window right of the current one
  swapfile = false,                        -- Creates a swapfile
  tabstop = 2,                             -- Number of visual spaces per tab
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  textwidth = 80,                          -- Lines longer than 79 columns will be broken
  timeoutlen = 1000,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  title = true,                            -- Set the terminal's title
  ttyfast = true,                          -- Speed up scrolling in vim buffer ( default true )
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  wildmode = {'list:longest' , 'full'},    -- wildmenu in special format (long format)
  wrap = false,                            -- Turn on line wrapping.
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

vim.opt.shortmess:append "c"  -- don't give |ins-completion-menu| messages.
vim.opt.complete:append('kspell')
vim.opt.path:append('**')  -- Recursively traverse to find something

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set guifont=FiraCode\ Nerd\ Font\ Mono:h18]]

vim.cmd [[
try
  colorscheme witching-hour
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

-- Define symbols for listchars
vim.cmd [[
  set listchars=nbsp:¤,eol:¶,tab:→\ ,extends:»,precedes:«,trail:·
  let &showbreak = '↳ '
]]

-- Ignore formats in wildmenu
vim.opt.wildignore = {'*.dll', '*.o', '*.obj', '*.bak', '*.exe', '*.pyc', '*.swp', 'tags'}
vim.opt.wildignore:append({'*.bmp', '*.gif', '*.ico', '*.jpg', '*.jpeg', '*.png'})
vim.opt.wildignore:append({'*/node_modules/*', '*/bower_components/*', '*/build/*'})

-- Use git for search from grep command
vim.opt.grepprg = 'git\\ --no-pager\\ grep\\ --no-color\\ -n\\ $*'
vim.opt.grepformat = {'%f:%l:%m', '%m\\ %f\\ match%ts', '%f'}

-- Use ripgrep for search if available
if vim.fn.executable('rg') then
  vim.opt.grepprg = 'rg\\ --vimgrep\\ --no-heading'
  vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
end
-- End of Search }}}

-- Icons
-- ▶ » ◀ « ⤴ ➔ ➥ ⎇ ⊘ ¶ ρ ␊ ⎇ ρ Þ ∥ Ξ       
vim.cmd [[
if exists('g:neovide')
  let g:neovide_cursor_vfx_mode = "ripple"
endif
]]
