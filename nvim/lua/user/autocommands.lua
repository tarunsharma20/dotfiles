vim.cmd [[
  " will automatically open the quickfix window whenever you do :vimgrep or other
  " commands that populate the quickfix/location list
  augroup qf
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost l*    cwindow
  autocmd VimEnter        *     cwindow
  augroup END

  set number relativenumber " Show relative line numbers

  " Show absolute line number in insert mode, and hybrid(absolute + relative) in normal mode
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END

  " Showing current file name and current working directory on buffer change
  autocmd BufEnter * let &titlestring = ' ' . expand("%:f") . ' - ' . fnamemodify(getcwd(), ':t')

  " Highlight yanked text
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup = 'IncSearch', timeout = 200})
  augroup END
]]
