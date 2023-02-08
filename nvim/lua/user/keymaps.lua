local utils = require('utils')

local keymap = utils.keymap

vim.g.mapleader = ' '

-- -----------------------------------------------------------------------------
-- ------------------------------- Miscellaneous -------------------------------
-- -----------------------------------------------------------------------------
-- Disabling arrow keys
keymap({'n', 'v'}, '<Up>', '<Nop>')
keymap({'n', 'v'}, '<Down>', '<Nop>')
keymap({'n', 'v'}, '<Left>', '<Nop>')
keymap({'n', 'v'}, '<Right>', '<Nop>')

-- turn off search highlight
keymap('n', '<leader><leader>', '<cmd>nohlsearch<cr>')

-- Change word under cursor in file with dot and skip with n
keymap('n', '<leader>c*', '*``cgn')

-- Same as above but in reverse order
keymap('n', '<leader>c#', '*``cgN')

-- Allow gf to open non-existent files
-- keymap('n', 'gf', '<cmd>edit <cfile><cr>')

-- Reselect visual selection after indenting
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')
keymap('v', '=', '=gv')

keymap('n', '<C-S-P>', '<cmd>TSHighlightCapturesUnderCursor<cr>')

-- -----------------------------------------------------------------------------
-- ------------------------------- Split window --------------------------------
-- ------------------------------------------------------------------------- {{{
-- Move cursor to right window
keymap('n', '<C-l>', '<cmd>wincmd l<cr>')

-- Move cursor to left window
keymap('n', '<C-h>', '<cmd>wincmd h<cr>')

-- Move cursor to window below
keymap('n', '<C-j>', '<cmd>wincmd j<cr>')

-- Move cursor to window top
keymap('n', '<C-k>', '<cmd>wincmd k<cr>')

-- Scale-up/down horizontal/vertically split window by 3 rows/columns
if vim.fn.has("gui_macvim") == 1 then
  keymap('n', '<D-Up>', '<cmd>resize +3<cr>')
  keymap('n', '<D-Down>', '<cmd>resize -3<cr>')
  keymap('n', '<D-Right>', '<cmd>vertical resize +3<cr>')
  keymap('n', '<D-Left>', '<cmd>vertical resize -3<cr>')
else
  keymap('n', '<C-Up>', '<cmd>resize +3<cr>')
  keymap('n', '<C-Down>', '<cmd>resize -3<cr>')
  keymap('n', '<C-Right>', '<cmd>vertical resize +3<cr>')
  keymap('n', '<C-Left>', '<cmd>vertical resize -3<cr>')
end

-- -----------------------------------------------------------------------------
-- -------------------------- Navigating between tabs --------------------------
-- -----------------------------------------------------------------------------
keymap('n', ']t', '<cmd>tabnext<cr>')
keymap('n', '[t', '<cmd>tabprevious<cr>')
keymap('n', '[T', '<cmd>tabfirst<cr>')
keymap('n', ']T', '<cmd>tablast<cr>')

-- -----------------------------------------------------------------------------
-- ----------------------- Navigating the quickfix list ------------------------
-- -----------------------------------------------------------------------------
keymap('n', ']q', '<cmd>cnext<cr>zv')
keymap('n', '[q', '<cmd>cprevious<cr>zv')
keymap('n', '[Q', '<cmd>cfirst<cr>zv')
keymap('n', ']Q', '<cmd>clast<cr>zv')

-- -----------------------------------------------------------------------------
-- ---------------------------------- Buffer -----------------------------------
-- -----------------------------------------------------------------------------
-- Delete all buffers but current (buffer only)
keymap('n', '<leader>bo', '<cmd>%bd|e#|bd# <cr>')

-- Fix broken syntax highlighting (buffer refresh)
keymap('n', '<leader>br', '<cmd>syntax sync fromstart<cr>')

keymap('n', ']b', '<cmd>bnext<cr>')
keymap('n', '[b', '<cmd>bprevious<cr>')
keymap('n', '[B', '<cmd>bfirst<cr>')
keymap('n', ']B', '<cmd>blast<cr>')
keymap('n', 'bw', '<cmd>bprevious|bwipeout#<cr>')

-- -----------------------------------------------------------------------------
-- ----------------------------------- Marks -----------------------------------
-- -----------------------------------------------------------------------------
-- Delete all marks
keymap('n', '<leader>md', '<cmd>delmarks A-Z0-9<cr>')

-- -----------------------------------------------------------------------------
-- --------------------------------- Terminal ----------------------------------
-- -----------------------------------------------------------------------------
-- Open terminal insert mode
keymap('n', '<leader>to', '<cmd>terminal<cr>')

-- Open terminal in split horizontal
keymap('n', '<leader>ts', '<cmd>split<cr><cmd>terminal<cr>')

-- Open terminal in split vertical
keymap('n', '<leader>tv', '<cmd>vsplit<cr><cmd>terminal<cr>')

-- -----------------------------------------------------------------------------
-- ---------------------------------- NetRW ------------------------------------
-- -----------------------------------------------------------------------------
-- Open parent directory
-- keymap('n', '-', '<cmd>Explore<cr>')

-- Open root directory
-- keymap('n', '_', '<cmd>Ntree<cr>')

-- -----------------------------------------------------------------------------
-- --- Move current line or selected block up and down with Alt+j and Alt+k ----
-- -----------------------------------------------------------------------------
keymap('n', '<leader>j', '<cmd>move .+1<cr>==')
keymap('n', '<leader>k', '<cmd>move .-2<cr>==')
keymap('v', '<leader>j', '<cmd>move \'>+1<cr>gv=gv')
keymap('v', '<leader>k', '<cmd>move \'<-2<cr>gv=gv')

