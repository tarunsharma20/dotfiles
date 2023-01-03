local utils = require('utils')

local api = utils.api
local wo = utils.wo

-- Highlight on yank
local yankGroup = api.nvim_create_augroup("YankHighlight", { clear = true })

api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGroup,
})

-- Go to last location when opening a buffer
local lastLocation = api.nvim_create_augroup("GoToLastLocation", { clear = true })

api.nvim_create_autocmd("BufReadPost", {
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]],
  group = lastLocation,
})


-- show cursor line only in active window
local cursorGroup = api.nvim_create_augroup("CursorLine", { clear = true })

api.nvim_create_autocmd(
  { "InsertLeave", "WinEnter" },
  { command = "set cursorline", group = cursorGroup }
)

api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { command = "set nocursorline", group = cursorGroup }
)

-- Show absolute line number in insert mode, and hybrid(absolute + relative) in normal mode
wo.relativenumber = true
local numberToggle = api.nvim_create_augroup("NumberToggle", { clear = true })

api.nvim_create_autocmd(
  { "BufEnter", "FocusGained", "InsertLeave" },
  { command = "set relativenumber", group = numberToggle }
)

api.nvim_create_autocmd(
  { "BufLeave", "FocusLost", "InsertEnter" },
  { command = "set norelativenumber", group = numberToggle }
)

-- show cursor line only in active window
local openTerminalInInsertMode = api.nvim_create_augroup("OpenTerminalInInsertMode", { clear = true })

api.nvim_create_autocmd("TermOpen", {
  command = "startinsert",
  group = openTerminalInInsertMode
})

-- Showing current file name and current working directory on buffer change
local titleString = api.nvim_create_augroup("TitleString", { clear = true })

api.nvim_create_autocmd("BufEnter", {
  command = [[let &titlestring = ' ' . expand("%:f") . ' - ' . fnamemodify(getcwd(), ':t')]],
  group = titleString,
})

-- will automatically open the quickfix window whenever you do :vimgrep or other
-- commands that populate the quickfix/location list
wo.relativenumber = true
local qf = api.nvim_create_augroup("Qf", { clear = true })

api.nvim_create_autocmd("QuickFixCmdPost",
  { pattern = {"[^l]*", "l*"}, command = "cwindow", group = qf }
)

api.nvim_create_autocmd("VimEnter",
  { command = "cwindow", group = qf }
)
