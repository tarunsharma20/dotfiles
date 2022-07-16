local utils = require('utils')

local map = utils.map
local unmap = utils.unmap

vim.g.mapleader = ' '

-- -----------------------------------------------------------------------------
-- ------------------------------- Miscellaneous -------------------------------
-- -----------------------------------------------------------------------------
-- Disabling arrow keys
map('n', '<Up>', '<Nop>')
map('v', '<Up>', '<Nop>')
map('n', '<Down>', '<Nop>')
map('v', '<Down>', '<Nop>')
map('n', '<Left>', '<Nop>')
map('v', '<Left>', '<Nop>')
map('n', '<Right>', '<Nop>')
map('v', '<Right>', '<Nop>')

-- Re-setting custom mapping defined by neovim
-- unmap('n', 'Y')

-- turn off search highlight
map('n', '<leader><space>', '<cmd>nohlsearch<cr>')

-- Change word under cursor in file with dot and skip with n
map('n', '<leader>c*', '*``cgn')

-- Same as above but in reverse order
map('n', '<leader>c#', '*``cgN')

-- Allow gf to open non-existent files
map('n', 'gf', ':edit <cfile><CR>')

-- Reselect visual selection after indenting
map('v', '<', '<gv')
map('v', '>', '>gv')
map('v', '=', '=gv')

vim.cmd[[
  " Show syntax highlighting groups for word under cursor
  nmap <C-S-P> :TSHighlightCapturesUnderCursor<CR>
  " nmap <C-S-P> :call SynStack()<CR>
  " function! SynStack()
  "   if !exists("*synstack")
  "     return
  "   endif
  "   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  " endfunc
  " End of Miscellaneous }}}
]]

-- -----------------------------------------------------------------------------
-- ------------------------------- Split window --------------------------------
-- ------------------------------------------------------------------------- {{{
-- Move cursor to right window
map('n', '<C-l>', '<cmd>wincmd l<cr>')

-- Move cursor to left window
map('n', '<C-h>', '<cmd>wincmd h<cr>')

-- Move cursor to window below
map('n', '<C-j>', '<cmd>wincmd j<cr>')

-- Move cursor to window top
map('n', '<C-k>', '<cmd>wincmd k<cr>')

-- Scale-up/down horizontal/vertically split window by 3 rows/columns
if vim.fn.has("gui_macvim") == 1 then
  map('n', '<D-Up>', '<cmd>resize +3<cr>')
  map('n', '<D-Down>', '<cmd>resize -3<cr>')
  map('n', '<D-Right>', '<cmd>vertical resize +3<cr>')
  map('n', '<D-Left>', '<cmd>vertical resize -3<cr>')
else
  map('n', '<C-Up>', '<cmd>resize +3<cr>')
  map('n', '<C-Down>', '<cmd>resize -3<cr>')
  map('n', '<C-Right>', '<cmd>vertical resize +3<cr>')
  map('n', '<C-Left>', '<cmd>vertical resize -3<cr>')
end

-- -----------------------------------------------------------------------------
-- -------------------------- Navigating between tabs --------------------------
-- ------------------------------------------------------------------------- {{{
map('n', ']t', '<cmd>tabnext<cr>')
map('n', '[t', '<cmd>tabprevious<cr>')
map('n', '[T', '<cmd>tabfirst<cr>')
map('n', ']T', '<cmd>tablast<cr>')

-- -----------------------------------------------------------------------------
-- ----------------------- Navigating the quickfix list ------------------------
-- ------------------------------------------------------------------------- {{{
map('n', ']q', '<cmd>cnext<cr>zv')
map('n', '[q', '<cmd>cprevious<cr>zv')
map('n', '[Q', '<cmd>cfirst<cr>zv')
map('n', ']Q', '<cmd>clast<cr>zv')

-- -----------------------------------------------------------------------------
-- ---------------------------------- Buffer -----------------------------------
-- ------------------------------------------------------------------------- {{{
-- Delete all buffers but current (buffer only)
map('n', '<Leader>bo', '<cmd>%bd|e#|bd# <cr>')

-- Fix broken syntax highlighting (buffer refresh)
map('n', '<Leader>br', '<cmd>syntax sync fromstart<cr>')

map('n', ']b', '<cmd>bnext<cr>')
map('n', '[b', '<cmd>bprevious<cr>')
map('n', '[B', '<cmd>bfirst<cr>')
map('n', ']B', '<cmd>blast<cr>')
map('n', 'bw', '<cmd>bprevious|bwipeout#<cr>')

-- -----------------------------------------------------------------------------
-- ----------------------------------- Marks -----------------------------------
-- ------------------------------------------------------------------------- {{{
-- Delete all marks
map('n', '<Leader>md', '<cmd>delmarks A-Z0-9<cr>')

-- -----------------------------------------------------------------------------
-- ---------------------------------- NetRW ------------------------------------
-- ------------------------------------------------------------------------- {{{
-- Open parent directory
-- map('n', '-', '<cmd>Explore<CR>')

-- Open root directory
-- map('n', '_', '<cmd>Ntree<CR>')

-- -----------------------------------------------------------------------------
-- --- Move current line or selected block up and down with Alt+j and Alt+k ----
-- ------------------------------------------------------------------------- {{{
map('n', '<leader>j', '<cmd>move .+1<cr>==')
map('n', '<leader>k', '<cmd>move .-2<cr>==')
map('v', '<leader>j', '<cmd>move \'>+1<cr>gv=gv')
map('v', '<leader>k', '<cmd>move \'<-2<cr>gv=gv')


