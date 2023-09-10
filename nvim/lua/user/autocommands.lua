local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

--
-- Highlight on yank
--
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '300' })
  end
})


--
-- Go to last location when opening a buffer
--
local lastLocation = augroup('GoToLastLocation', { clear = true })

autocmd('BufReadPost', {
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]],
  group = lastLocation,
})

--
-- show cursor line only in active window
--
augroup('CursorLine', { clear = true })

autocmd(
  { 'InsertLeave', 'WinEnter' },
  {
    group = 'CursorLine',
    callback = function()
      opt.cursorline = true
    end
  }
)

autocmd(
  { 'InsertEnter', 'WinLeave' },
  {
    group = 'CursorLine',
    callback = function()
      opt.cursorline = false
    end
  }
)
--
-- Show absolute line number in insert mode, and hybrid(absolute + relative) in normal mode
--
augroup('NumberToggle', { clear = true })
opt.relativenumber = true

autocmd(
  { 'BufEnter', 'FocusGained', 'InsertLeave' },
  {
    group = 'NumberToggle',
    callback = function()
      opt.relativenumber = true
    end
  }
)

autocmd(
  { 'BufLeave', 'FocusLost', 'InsertEnter' },
  {
    group = 'NumberToggle',
    callback = function()
      opt.relativenumber = false
    end
  }
)

--
-- Start with insert mode in terminal
--
augroup('OpenTerminalInInsertMode', { clear = true })

autocmd('TermOpen', {
  command = 'startinsert',
  group = 'OpenTerminalInInsertMode'
})


--
-- Showing current file name and current working directory on buffer change
--
augroup('TitleString', { clear = true })

autocmd('BufEnter', {
  command = [[let &titlestring = ' ' . expand("%:f") . ' - ' . fnamemodify(getcwd(), ':t')]],
  group = 'TitleString',
})


--
-- Hide spell check for filtypes
--
augroup('SpellCheck', { clear = true })

autocmd('Filetype', {
  group = 'SpellCheck',
  pattern = { 'cucumber'},
  callback = function()
    opt.spell = false
  end
})

--
-- Hide conceal for filetypes
--
augroup('DisableConceal', { clear = true })

autocmd('Filetype', {
  group = 'DisableConceal',
  pattern = { 'json'},
  callback = function()
    opt.conceallevel = 0
  end
})

--
-- Automatically open the quickfix window whenever you do :vimgrep or other
-- commands that populate the quickfix/location list
--
augroup('Qf', { clear = true })

autocmd('QuickFixCmdPost',
  {
    pattern = {"[^l]*", "l*"},
    command = 'cwindow',
    group = 'Qf'
  }
)

autocmd('VimEnter',
  {
    command = 'cwindow',
    group = 'Qf'
  }
)
