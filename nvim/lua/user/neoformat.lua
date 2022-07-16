vim.g.neoformat_try_node_exe = 1

vim.cmd [[
  augroup formatJS
    autocmd!
    autocmd BufWritePre *.{js,jsx} Neoformat
  augroup END
]]
