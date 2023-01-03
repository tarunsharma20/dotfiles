local utils = require('utils')

local keymap = utils.keymap
local api = utils.api


vim.cmd[[
  let g:dirvish_mode = ':sort | sort ,^.*[^/]$, r'
]]

local dirvishNoSpell = api.nvim_create_augroup("DirvishNoSpell", { clear = true })

api.nvim_create_autocmd("FileType",
  { pattern = "dirvish", command = "setlocal nospell", group = dirvishNoSpell }
)

keymap('n', '_', '<cmd>Dirvish .<cr>')
