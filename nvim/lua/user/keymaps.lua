vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- -----------------------------------------------------------------------------
-- ------------------------------- Miscellaneous -------------------------------
-- -----------------------------------------------------------------------------
-- Disabling arrow keys
vim.keymap.set({ "n", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "v" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "v" }, "<Right>", "<Nop>")

vim.keymap.set("n", "<Leader><Leader>", "<CMD>nohlsearch<CR>", { desc = "Turn off search highlight" })
vim.keymap.set("n", "<Leader>c*", "*``cgn", { desc = "Change word under cursor in file with dot and skip with n" })
vim.keymap.set("n", "<Leader>c#", "*``cgN",
  { desc = "Change word under cursor in file in reverse with dot and skip with n" })

-- Reselect visual selection after indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "=", "=gv")

-- -----------------------------------------------------------------------------
-- -------------------------- Navigating between tabs --------------------------
-- -----------------------------------------------------------------------------
vim.keymap.set("n", "]t", "<CMD>tabnext<CR>", { desc = "Navigate to next tab" })
vim.keymap.set("n", "[t", "<CMD>tabprevious<CR>", { desc = "Navigate to previous tab" })
vim.keymap.set("n", "[T", "<CMD>tabfirst<CR>", { desc = "Navigate to first tab" })
vim.keymap.set("n", "]T", "<CMD>tablast<CR>", { desc = "Navigate to last tab" })

-- -----------------------------------------------------------------------------
-- ----------------------- Navigating the quickfix list ------------------------
-- -----------------------------------------------------------------------------
vim.keymap.set("n", "]q", "<CMD>cnext<CR>zv", { desc = "Navigate to next quickfix item" })
vim.keymap.set("n", "[q", "<CMD>cprevious<CR>zv", { desc = "Navigate to previous quickfix item" })
vim.keymap.set("n", "[Q", "<CMD>cfirst<CR>zv", { desc = "Navigate to first quickfix item" })
vim.keymap.set("n", "]Q", "<CMD>clast<CR>zv", { desc = "Navigate to last quickfix item" })

-- -----------------------------------------------------------------------------
-- ---------------------------------- Buffer -----------------------------------
-- -----------------------------------------------------------------------------
vim.keymap.set("n", "bw", "<CMD>bprevious|bwipeout#<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<Leader>bo", "<CMD>%bd|e#|bd# <CR>", { desc = "Delete other buffers" })
vim.keymap.set("n", "<Leader>br", "<CMD>syntax sync fromstart<CR>", { desc = "Refresh syntax highlighting" })

vim.keymap.set('n', ']b', '<CMD>bnext<CR>', { desc = 'Visit next buffer' })
vim.keymap.set('n', '[b', '<CMD>bprevious<CR>', { desc = 'Visit previous buffer' })
vim.keymap.set('n', '[B', '<CMD>bfirst<CR>', { desc = 'Visit first buffer' })
vim.keymap.set('n', ']B', '<CMD>blast<CR>', { desc = 'Visit last buffer' })

vim.keymap.set("n", "<Leader>1", ":BufferGoto 1<CR>", { desc = "Visit 1st buffer" })
vim.keymap.set("n", "<Leader>2", ":BufferGoto 2<CR>", { desc = "Visit 2nd buffer" })
vim.keymap.set("n", "<Leader>3", ":BufferGoto 3<CR>", { desc = "Visit 3rd buffer" })
vim.keymap.set("n", "<Leader>4", ":BufferGoto 4<CR>", { desc = "Visit 4th buffer" })
vim.keymap.set("n", "<Leader>5", ":BufferGoto 5<CR>", { desc = "Visit 5th buffer" })
vim.keymap.set("n", "<Leader>6", ":BufferGoto 6<CR>", { desc = "Visit 6th buffer" })
vim.keymap.set("n", "<Leader>7", ":BufferGoto 7<CR>", { desc = "Visit 7th buffer" })
vim.keymap.set("n", "<Leader>8", ":BufferGoto 8<CR>", { desc = "Visit 8th buffer" })
vim.keymap.set("n", "<Leader>9", ":BufferGoto 9<CR>", { desc = "Visit 9th buffer" })
vim.keymap.set("n", "<Leader>0", ":BufferLast<CR>", { desc = "Visit last buffer" })


-- vim.g.user_emmet_leader_key = "<Tab>"
-- -- keymap('n', 'n', 'nzz', { desc = 'keep next search in middle of screen'})
-- -- keymap('n', 'N', 'Nzz', { desc = 'keep previous search in middle of screen'})
-- -- keymap('n', 'gf', '<CMD>edit <cfile><CR>', { desc = 'Allow gf to open non-existent files' })
--
-- keymap("n", "<C-S-P>", "<cmd>TSHighlightCapturesUnderCursor<cr>")
--
-- -- -----------------------------------------------------------------------------
-- -- ------------------------------- Split windows --------------------------------
-- -- ------------------------------------------------------------------------- {{{
-- keymap("n", "<C-l>", "<CMD>wincmd l<CR>", { desc = "Move cursor to right window" })
-- keymap("n", "<C-h>", "<CMD>wincmd h<CR>", { desc = "Move cursor to left window" })
-- keymap("n", "<C-j>", "<CMD>wincmd j<CR>", { desc = "Move cursor to window below" })
-- keymap("n", "<C-k>", "<CMD>wincmd k<CR>", { desc = "Move cursor to window top" })
--
-- -- Scale-up/down horizontal/vertically split window by 3 rows/columns
-- if fn.has("gui_macvim") == 1 then
-- keymap("n", "<D-Up>", "<CMD>resize +3<CR>", { desc = "Scale-up vertically" })
-- keymap("n", "<D-Down>", "<CMD>resize -3<CR>", { desc = "Scale-down vertically" })
-- keymap("n", "<D-Right>", "<CMD>vertical resize +3<CR>", { desc = "Scale-up horizontally" })
-- keymap("n", "<D-Left>", "<CMD>vertical resize -3<CR>", { desc = "Scale-down horizontally" })
-- else
-- keymap("n", "<C-Up>", "<CMD>resize +3<CR>", { desc = "Scale-up vertically" })
-- keymap("n", "<C-Down>", "<CMD>resize -3<CR>", { desc = "Scale-down vertically" })
-- keymap("n", "<C-Right>", "<CMD>vertical resize +3<CR>", { desc = "Scale-up horizontally" })
-- keymap("n", "<C-Left>", "<CMD>vertical resize -3<CR>", { desc = "Scale-down horizontally" })
-- end
--
-- -- keymap('n', '<Leader>md', '<CMD>delmarks A-Z0-9<CR>', { desc = 'Delete all marks' })
--
-- -- -----------------------------------------------------------------------------
-- -- --------------------------------- Terminal ----------------------------------
-- -- -----------------------------------------------------------------------------
-- -- keymap('n', '<Leader>to', '<CMD>terminal<CR>', { desc = 'Open terminal insert mode' })
-- -- keymap('n', '<Leader>ts', '<CMD>split<CR><CMD>terminal<CR>', { desc = 'Open terminal in split horizontal' })
-- -- keymap('n', '<Leader>tv', '<CMD>vsplit<CR><CMD>terminal<CR>', { desc = 'Open terminal in split vertical' })
--
-- -- -----------------------------------------------------------------------------
-- -- ---------------------------------- NetRW ------------------------------------
-- -- -----------------------------------------------------------------------------
-- -- keymap('n', '-', '<CMD>Explore<CR>', { desc = 'Open parent directory' })
-- -- keymap('n', '_', '<CMD>Ntree<CR>', { desc = 'Open root directory' })
--
-- -- -----------------------------------------------------------------------------
-- -- --- Move current line or selected block up and down with Alt+j and Alt+k ----
-- -- -----------------------------------------------------------------------------
-- keymap("n", "<Leader>j", "<CMD>move .+1<CR>==", { desc = "Move line down" })
-- keymap("n", "<Leader>k", "<CMD>move .-2<CR>==", { desc = "Move line up" })
-- keymap("v", "<Leader>j", "<CMD>move '>+1<CR>gv=gv", { desc = "Move selection down" })
-- keymap("v", "<Leader>k", "<CMD>move '<-2<CR>gv=gv", { desc = "Move selection up" })
--
-- -- keymap('n', '<LocalLeader>na', '<CMD>set norelativenumber<CR>', { desc = 'set line numbers to absolute' })
-- -- keymap('n', '<LocalLeader>nr', '<CMD>set relativenumber<CR>', { desc = 'set line number to relative' })
-- -- keymap('n', '<LocalLeader>cl', '<CMD>set conceallevel=0<CR>', { desc = 'Remove conceal' })
-- -- keymap('n', '<LocalLeader>cL', '<CMD>set conceallevel=3<CR>', { desc = 'Set conceal level to 3' })
