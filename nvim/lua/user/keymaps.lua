local fn = vim.fn

function keymap(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.g.user_emmet_leader_key='<Tab>'
-- -----------------------------------------------------------------------------
-- ------------------------------- Miscellaneous -------------------------------
-- -----------------------------------------------------------------------------
-- Disabling arrow keys
keymap({'n', 'v'}, '<Up>', '<Nop>')
keymap({'n', 'v'}, '<Down>', '<Nop>')
keymap({'n', 'v'}, '<Left>', '<Nop>')
keymap({'n', 'v'}, '<Right>', '<Nop>')

keymap('n', '<Leader><Leader>', '<CMD>nohlsearch<CR>', { desc = 'Turn off search highlight'})
keymap('n', '<Leader>c*', '*``cgn', { desc = 'Change word under cursor in file with dot and skip with n' })
keymap('n', '<Leader>c#', '*``cgN', { desc = 'Change word under cursor in file in reverse with dot and skip with n' })
-- keymap('n', 'gf', '<CMD>edit <cfile><CR>', { desc = 'Allow gf to open non-existent files' })

-- Reselect visual selection after indenting
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')
keymap('v', '=', '=gv')

keymap('n', '<C-S-P>', '<cmd>TSHighlightCapturesUnderCursor<cr>')

-- -----------------------------------------------------------------------------
-- ------------------------------- Split windows --------------------------------
-- ------------------------------------------------------------------------- {{{
keymap('n', '<C-l>', '<CMD>wincmd l<CR>', { desc = 'Move cursor to right window' })
keymap('n', '<C-h>', '<CMD>wincmd h<CR>', { desc = 'Move cursor to left window' })
keymap('n', '<C-j>', '<CMD>wincmd j<CR>', { desc = 'Move cursor to window below' })
keymap('n', '<C-k>', '<CMD>wincmd k<CR>', { desc = 'Move cursor to window top' })

-- Scale-up/down horizontal/vertically split window by 3 rows/columns
if fn.has("gui_macvim") == 1 then
  keymap('n', '<D-Up>', '<CMD>resize +3<CR>', { desc = 'Scale-up vertically' })
  keymap('n', '<D-Down>', '<CMD>resize -3<CR>', { desc = 'Scale-down vertically' })
  keymap('n', '<D-Right>', '<CMD>vertical resize +3<CR>', { desc = 'Scale-up horizontally' })
  keymap('n', '<D-Left>', '<CMD>vertical resize -3<CR>', { desc = 'Scale-down horizontally' })
else
  keymap('n', '<C-Up>', '<CMD>resize +3<CR>', { desc = 'Scale-up vertically' })
  keymap('n', '<C-Down>', '<CMD>resize -3<CR>', { desc = 'Scale-down vertically' })
  keymap('n', '<C-Right>', '<CMD>vertical resize +3<CR>', { desc = 'Scale-up horizontally' })
  keymap('n', '<C-Left>', '<CMD>vertical resize -3<CR>', { desc = 'Scale-down horizontally' })
end

-- -----------------------------------------------------------------------------
-- -------------------------- Navigating between tabs --------------------------
-- -----------------------------------------------------------------------------
keymap('n', ']t', '<CMD>tabnext<CR>', { desc = 'Navigate to next tab' })
keymap('n', '[t', '<CMD>tabprevious<CR>', { desc = 'Navigate to previous tab' })
keymap('n', '[T', '<CMD>tabfirst<CR>', { desc = 'Navigate to first tab' })
keymap('n', ']T', '<CMD>tablast<CR>', { desc = 'Navigate to last tab' })

-- -----------------------------------------------------------------------------
-- ----------------------- Navigating the quickfix list ------------------------
-- -----------------------------------------------------------------------------
keymap('n', ']q', '<CMD>cnext<CR>zv', { desc = 'Navigate to next quickfix item' })
keymap('n', '[q', '<CMD>cprevious<CR>zv', { desc = 'Navigate to previous quickfix item' })
keymap('n', '[Q', '<CMD>cfirst<CR>zv', { desc = 'Navigate to first quickfix item' })
keymap('n', ']Q', '<CMD>clast<CR>zv', { desc = 'Navigate to last quickfix item' })

-- -----------------------------------------------------------------------------
-- ---------------------------------- Buffer -----------------------------------
-- -----------------------------------------------------------------------------
keymap('n', 'bw', '<CMD>bprevious|bwipeout#<CR>', { desc = 'Delete buffer' })
keymap('n', '<Leader>bo', '<CMD>%bd|e#|bd# <CR>', { desc = 'Delete other buffers' })
keymap('n', '<Leader>br', '<CMD>syntax sync fromstart<CR>', { desc = 'Refresh syntax highlighting' })

keymap('n', ']b', '<CMD>bnext<CR>', { desc = 'Visit next buffer' })
keymap('n', '[b', '<CMD>bprevious<CR>', { desc = 'Visit previous buffer' })
keymap('n', '[B', '<CMD>bfirst<CR>', { desc = 'Visit first buffer' })
keymap('n', ']B', '<CMD>blast<CR>', { desc = 'Visit last buffer' })

-- -----------------------------------------------------------------------------
-- ----------------------------------- Marks -----------------------------------
-- -----------------------------------------------------------------------------
keymap('n', '<Leader>md', '<CMD>delmarks A-Z0-9<CR>', { desc = 'Delete all marks' })

-- -----------------------------------------------------------------------------
-- --------------------------------- Terminal ----------------------------------
-- -----------------------------------------------------------------------------
keymap('n', '<Leader>to', '<CMD>terminal<CR>', { desc = 'Open terminal insert mode' })
keymap('n', '<Leader>ts', '<CMD>split<CR><CMD>terminal<CR>', { desc = 'Open terminal in split horizontal' })
keymap('n', '<Leader>tv', '<CMD>vsplit<CR><CMD>terminal<CR>', { desc = 'Open terminal in split vertical' })

-- -----------------------------------------------------------------------------
-- ---------------------------------- NetRW ------------------------------------
-- -----------------------------------------------------------------------------
-- keymap('n', '-', '<CMD>Explore<CR>', { desc = 'Open parent directory' })
-- keymap('n', '_', '<CMD>Ntree<CR>', { desc = 'Open root directory' })

-- -----------------------------------------------------------------------------
-- --- Move current line or selected block up and down with Alt+j and Alt+k ----
-- -----------------------------------------------------------------------------
keymap('n', '<Leader>j', '<CMD>move .+1<CR>==', { desc = 'Move line down' })
keymap('n', '<Leader>k', '<CMD>move .-2<CR>==', { desc = 'Move line up' })
keymap('v', '<Leader>j', '<CMD>move \'>+1<CR>gv=gv', { desc = 'Move selection down' })
keymap('v', '<Leader>k', '<CMD>move \'<-2<CR>gv=gv', { desc = 'Move selection up' })


keymap('n', '<LocalLeader>na', '<CMD>set norelativenumber<CR>', { desc = 'set line numbers to absolute' })
keymap('n', '<LocalLeader>nr', '<CMD>set relativenumber<CR>', { desc = 'set line number to relative' })
keymap('n', '<LocalLeader>cl', '<CMD>set conceallevel=0<CR>', { desc = 'Remove conceal' })
keymap('n', '<LocalLeader>cL', '<CMD>set conceallevel=3<CR>', { desc = 'Set conceal level to 3' })

