vim.cmd[[
  " Use fontawesome icons as signs
  let g:gitgutter_sign_added = '▎'
  let g:gitgutter_sign_modified = '▎'
  let g:gitgutter_sign_removed = '▎'
  let g:gitgutter_sign_removed_first_line = '▎'
  let g:gitgutter_sign_modified_removed = '▎'
]]

local utils = require('utils')
local map = utils.map

-- map('n', ']h', '<cmd>GitGutterNextHunk<CR>')
-- map('n', '[h', '<cmd>GitGutterPrevHunk<CR>')

-- open 3 way git conflict
map('n', '<leader>gd', '<cmd>Gvdiffsplit!<CR>')

-- fetches the hunk from the target parent
map('n', '<leader>gt', '<cmd>diffget //2<CR><cmd>diffupdate<CR>')
map('n', '<leader>gh', '<cmd>diffget //2<CR><cmd>diffupdate<CR>')
-- map('n', '<leader>gk', '<cmd>diffget //2<CR><cmd>diffupdate<CR>')

-- fetches the hunk from the merge parent (on the right)
map('n', '<leader>gm', '<cmd>diffget //3<CR><cmd>diffupdate<CR>')
map('n', '<leader>gl', '<cmd>diffget //3<CR><cmd>diffupdate<CR>')
-- map('n', '<leader>gj', '<cmd>diffget //3<CR><cmd>diffupdate<CR>')
