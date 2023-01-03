local utils = require('utils')
local api = utils.api

vim.g.neoformat_try_node_exe = 1

local formatJS = api.nvim_create_augroup("FormatJS", { clear = true })

api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.{js,jsx}",
  command = "Neoformat",
  group = formatJS,
})

