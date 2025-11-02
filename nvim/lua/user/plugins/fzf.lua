vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

require("fzf-lua").setup({
  fzf_opts = { ["--layout"] = "default" },
})

vim.keymap.set('n', "<Leader>oo", "<CMD>FzfLua<CR>", { desc = "Open fuzzy find" })
vim.keymap.set('n', "<Leader>of", '<CMD>lua require("fzf-lua").files()<CR>', { desc = "Open files" })
vim.keymap.set('n', "<Leader>oc", '<CMD>lua require("fzf-lua").files{ prompt="LS> ", cwd="~/.config/nvim" }<CR>',
  { desc = "Open configuration" })
vim.keymap.set('n', "<Leader>oG",
  '<CMD>lua require("fzf-lua").grep({filter = [[rg --invert-match "node_modules|dist|lib|.git|.nyc_output|package-lock.json|LICENSES.txt|LICENSES.json"]]})<CR>',
  { desc = "Grep text" })
vim.keymap.set('n', "<Leader>og",
  '<CMD>lua require("fzf-lua").live_grep_glob({filter = [[rg --invert-match "node_modules|dist|lib|.git|.nyc_output|package-lock.json|LICENSES.txt|LICENSES.json"]]})<CR>',
  { desc = "Live grep" })
vim.keymap.set('n', "<Leader>or", '<CMD>lua require("fzf-lua").resume()<CR>', { desc = "Resume last find" })
vim.keymap.set('n', "<Leader>om", '<CMD>lua require("fzf-lua").marks()<CR>', { desc = "Open marks" })
vim.keymap.set('n', "<Leader>oC", '<CMD>lua require("fzf-lua").colorschemes()<CR>', { desc = "Open colorscheme" })
vim.keymap.set('v', "<Leader>o*", '<CMD>lua require("fzf-lua").grep_visual()<CR>', { desc = "Open selection" })
vim.keymap.set('n', "<Leader>o*", '<CMD>lua require("fzf-lua").grep_cWORD()<CR>', { desc = "Open text under cursor" })
vim.keymap.set('n', "<Leader>ob", '<CMD>lua require("fzf-lua").buffers()<CR>', { desc = "Open buffer" })
vim.keymap.set('n', "z=", '<CMD>lua require("fzf-lua").spell_suggest()<CR>', { desc = "Open spelling" })
