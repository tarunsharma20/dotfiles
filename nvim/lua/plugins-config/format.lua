vim.cmd [[
  augroup fmt
    autocmd!
    autocmd BufWritePre * silent! undojoin | Neoformat
  augroup END
]]

