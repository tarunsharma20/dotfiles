return {
  'dyng/ctrlsf.vim',
  keys = {
    { '<Leader>s/', '<Plug>CtrlSFPrompt', desc = 'Ask for find/replace string' },

    { '<Leader>sF', '<Plug>CtrlSFCwordPath', desc = 'Input Find/Replace string under cursor' },
    { '<Leader>sf', '<Plug>CtrlSFCCwordExec', desc = 'Find/Replace word under cursor' },
    { '<Leader>s*', '<Plug>CtrlSFCwordExec', desc = 'Find/Replace string under cursor' },

    { '<Leader>sF', '<Plug>CtrlSFVwordPath', mode='v', desc = 'Input Find/Replace selected string' },
    { '<Leader>sf', '<Plug>CtrlSFCCwordExec', mode='v', desc = 'Find/Replace selected world' },
    { '<Leader>s*', '<Plug>CtrlSFVwordExec', mode='v', desc = 'Find/Replace selected string' },

    { '<Leader>sP', '<Plug>CtrlSFPwordPath', desc = 'Input last searched in command line' },
    { '<Leader>sp', '<Plug>CtrlSFPwordExec', desc = 'Repeat last searched in command line' },

    { '<Leader>st', '<CMD>CtrlSFToggle<CR>', desc = 'Toggle find/replace buffer' },
  },
  config = function ()
    vim.cmd[[
    let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }
    ]]
  end
}

