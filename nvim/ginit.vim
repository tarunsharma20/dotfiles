set nospell
" set guifont=FiraCode\ Nerd\ Font\ Mono:h15
set linespace=0

" Enable Mouse
set mouse=a

" Set Editor Font
if exists(':GuiFont')
  " Use GuiFont! to ignore font errors
  " GuiFont {font_name}:h{size}
  GuiFont FiraCode\ Nerd\ Font\ Mono:h15
endif

" Disable GUI Tabline
if exists(':GuiTabline')
  GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
  GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
  GuiScrollBar 1
endif

" Toggle treeview
if exists(':GuiTreeviewToggle')
  " nnoremap <silent> <leader>e :GuiTreeviewToggle<CR>
endif


" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

if exists('g:neovide')
  noremap <C-6> <C-^>
  " noremap p o<Esc>vpyy
  " noremap P O<Esc>vpyy

  set guifont=FiraCode\ Nerd\ Font\ Mono:h16

  let g:neovide_cursor_vfx_mode=ripple
  " let g:neovide_cursor_animation_length=0.05
  let g:neovide_cursor_trail_length=0
  let g:neovide_cursor_animate_command_line=false
  let g:neovide_fullscreen=v:true
  " let g:neovide_remember_window_size=v:true
endif
