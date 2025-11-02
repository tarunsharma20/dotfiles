vim.pack.add({ "https://github.com/dyng/ctrlsf.vim" })

vim.keymap.set('n', '<Leader>s/', '<Plug>CtrlSFPrompt', { desc = 'Ask for find/replace string' })

vim.keymap.set('n', '<Leader>sF', '<Plug>CtrlSFCwordPath', { desc = 'Input Find/Replace string under cursor' })
vim.keymap.set('n', '<Leader>sf', '<Plug>CtrlSFCCwordExec', { desc = 'Find/Replace word under cursor' })
vim.keymap.set('n', '<Leader>s*', '<Plug>CtrlSFCwordExec', { desc = 'Find/Replace string under cursor' })

vim.keymap.set('v', '<Leader>sF', '<Plug>CtrlSFVwordPath', { desc = 'Input Find/Replace selected string' })
vim.keymap.set('v', '<Leader>sf', '<Plug>CtrlSFCCwordExec', { desc = 'Find/Replace selected world' })
vim.keymap.set('v', '<Leader>s*', '<Plug>CtrlSFVwordExec', { desc = 'Find/Replace selected string' })

vim.keymap.set('n', '<Leader>sP', '<Plug>CtrlSFPwordPath', { desc = 'Input last searched in command line' })
vim.keymap.set('n', '<Leader>sp', '<Plug>CtrlSFPwordExec', { desc = 'Repeat last searched in command line' })

vim.keymap.set('n', '<Leader>st', '<CMD>CtrlSFToggle<CR>', { desc = 'Toggle find/replace buffer' })

vim.g.ctrlsf_auto_preview = 1
vim.g.ctrlsf_auto_focus = { at = "start" }
