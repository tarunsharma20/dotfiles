local utils = require('utils')

local map = utils.map

-- Open parent directory
map('n', '-', '<cmd>Explore<CR>')

-- Open root directory
map('n', '_', '<cmd>Ntree<CR>')

-- vim.cmd [[
--   let g:netrw_banner=0
-- ]]
-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
-- https://stackoverflow.com/questions/28569510/vim-nerdtree-vs-e-explorer
