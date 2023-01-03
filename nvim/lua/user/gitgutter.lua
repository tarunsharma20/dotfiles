vim.cmd[[
  " Use fontawesome icons as signs
  let g:gitgutter_sign_added = '▎'
  let g:gitgutter_sign_modified = '▎'
  let g:gitgutter_sign_removed = '▎'
  let g:gitgutter_sign_removed_first_line = '▎'
  let g:gitgutter_sign_modified_removed = '▎'
]]

local utils = require('utils')
local keymap = utils.keymap

-- keymap('n', ']h', '<cmd>GitGutterNextHunk<cr>')
-- keymap('n', '[h', '<cmd>GitGutterPrevHunk<cr>')

-- open 3 way git conflict
keymap('n', '<leader>gd', '<cmd>Gvdiffsplit!<cr>')

-- fetches the hunk from the target parent
keymap('n', '<leader>gt', '<cmd>diffget //2<cr><cmd>diffupdate<cr>')
keymap('n', '<leader>gh', '<cmd>diffget //2<cr><cmd>diffupdate<cr>')
-- keymap('n', '<leader>gk', '<cmd>diffget //2<cr><cmd>diffupdate<cr>')

-- fetches the hunk from the merge parent (on the right)
keymap('n', '<leader>gm', '<cmd>diffget //3<cr><cmd>diffupdate<cr>')
keymap('n', '<leader>gl', '<cmd>diffget //3<cr><cmd>diffupdate<cr>')
-- keymap('n', '<leader>gj', '<cmd>diffget //3<cr><cmd>diffupdate<cr>')
