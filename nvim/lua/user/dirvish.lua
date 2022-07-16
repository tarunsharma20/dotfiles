local utils = require('utils')

local map = utils.map

vim.cmd[[
  let g:dirvish_mode = ':sort | sort ,^.*[^/]$, r'
  autocmd FileType dirvish setlocal nospell
]]

map('n', '_', '<cmd>Dirvish<cr>')
