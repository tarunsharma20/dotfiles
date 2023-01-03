local utils = require('utils')

local api = utils.api

local iffe = api.nvim_create_augroup("Iffe", { clear = true })
api.nvim_create_autocmd("FileType", {
  pattern ={'javascript','javascriptreact', 'typescript'},
  command = [[iabbrev <buffer> iife@ (function() {})();<C-o>4h<CR><CR><Up>]],
  group = iffe
})

local forLoop = api.nvim_create_augroup("ForLoop", { clear = true })
api.nvim_create_autocmd("FileType", {
  pattern ={'javascript', 'javascriptreact', 'typescript'},
  command = [[iabbrev <buffer> forii@ for(let i = 0; i <z; i++) {<CR><CR>}<Esc>?z<CR>xi]],
  group = forLoop
})

local reactCmp = api.nvim_create_augroup("ReactCmp", { clear = true })
api.nvim_create_autocmd("FileType", {
  pattern ={'javascript', 'javascriptreact', 'typescript'},
  command = [[iabbrev <buffer> rcmp@ import React from 'react'<c-j><c-j>const Component = () => {<C-j>return (<C-j><C-j>  )<C-j>}<C-j><C-j>export default Component<Esc>:%sComponent/]],
  group = reactCmp
})


