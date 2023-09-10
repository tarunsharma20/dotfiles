return {
  'vimwiki/vimwiki',
  init = function ()
    vim.cmd[[
      let g:vimwiki_list = [{ 'path': '~/Documents/Notes/', 'syntax': 'markdown', 'ext': '.md' }]
      let g:vimwiki_global_ext = 0
    ]]
  end
}

