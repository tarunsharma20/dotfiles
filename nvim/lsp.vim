function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

  nmap <buffer> <C-]> <plug>(lsp-definition)
  nmap <buffer> <leader>gd <plug>(lsp-definition)
  nmap <buffer> <leader>gr <plug>(lsp-references)
  nmap <buffer> <leader>gi <plug>(lsp-implementation)
  nmap <buffer> <leader>gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [d <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]d <Plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)

endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_signs_enabled = 1           " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
"
" Highlight references to the symbol under the cursor
let g:lsp_highlight_references_enabled = 1

" icons require GUI
let g:lsp_signs_error = {'text': ''}
let g:lsp_signs_warning = {'text': ''}
let g:lsp_signs_hint = {'text': 'ﯧ'}
let g:lsp_signs_information = {'text': ''}

