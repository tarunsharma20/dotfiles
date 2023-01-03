local utils = require('utils')

local keymap = utils.keymap

-- Open parent directory
keymap('n', '-', '<cmd>Explore<cr>')

-- Open root directory
keymap('n', '_', '<cmd>Ntree<cr>')

-- vim.cmd [[
--   let g:netrw_banner=0
-- ]]
-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
-- https://stackoverflow.com/questions/28569510/vim-nerdtree-vs-e-explorer
