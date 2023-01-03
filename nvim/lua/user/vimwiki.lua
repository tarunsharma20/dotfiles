local utils = require('utils')
local api = utils.api

vim.cmd[[
  " let g:vimwiki_listsyms = '✗○◐●✓'
  let g:vimwiki_global_ext=0

  " augroup vimwikiConceal
  "   autocmd!
  "   autocmd FileType vimwiki set concealcursor=n conceallevel=3
  "   " autocmd FileType vimwiki call matchadd('Conceal', '\[\ \]', 10, -1, {'conceal': ''}) " 0%
  "   " autocmd FileType vimwiki call matchadd('Conceal', '\[\.\]', 10, -1, {'conceal': 'ﯰ'}) " 1-33%
  "   " autocmd FileType vimwiki call matchadd('Conceal', '\[o\]', 10, -1, {'conceal': 'ﯰ'}) " 34-66%
  "   " autocmd FileType vimwiki call matchadd('Conceal', '\[O\]', 10, -1, {'conceal': 'ﯰ'}) " 67-99%
  "   " autocmd FileType vimwiki call matchadd('Conceal', '\[X\]', 10, -1, {'conceal': ''}) " 100%
  " augroup END

  " highlight Conceal guifg=#8787ff guibg=NONE

  " syntax match VimwikiListTodo "\[\ \]" conceal cchar=
  " syntax match VimwikiListTodo "\[x\]" conceal cchar=
  " syntax match VimwikiListTodo '\v(\s+)?(-|\*)\s\[\s\]'hs=e-4 conceal cchar=
  " syntax match VimwikiListTodo '\v(\s+)?(-|\*)\s\[-\]'hs=e-4 conceal cchar=
  " syntax match VimwikiListTodo '\v(\s+)?(-|\*)\s\[\.\]'hs=e-4 conceal cchar=
  " syntax match VimwikiListTodo '\v(\s+)?(-|\*)\s\[o\]'hs=e-4 conceal cchar=
  " syntax match VimwikiListTodo '\v(\s+)?(-|\*)\s\[X\]'hs=e-4 conceal cchar=
  " syntax match VimwikiListTodo '\v(\s+)?(-|\*)'hs=e-4 conceal cchar=
]]
  -- 﫟﫠綠雷祿
-- 
-- '✗○◐●✓'
--   

-- show cursor line only in active window
local vimwikiConceal = api.nvim_create_augroup("VimwikiConceal", { clear = true })

api.nvim_create_autocmd("FileType",
  {pattern = "vimwiki", command = "set concealcursor=n conceallevel=3", group = vimwikiConceal }
)

