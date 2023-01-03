local utils = require('utils')

local keymap = utils.keymap


keymap('n', '<leader>ff', '<cmd>lua require("fzf-lua").files()<cr>')

keymap('n', '<leader>fg', '<cmd>lua require("fzf-lua").grep({filter = [[rg --invert-match "node_modules|dist|lib|.git|.nyc_output|package-lock.json|LICENSES.txt|LICENSES.json"]]})<cr>')
keymap('n', '<leader>fG', '<cmd>lua require("fzf-lua").grep_last()<cr>')
keymap('n', '<leader>fl', '<cmd>lua require("fzf-lua").live_grep_glob({filter = [[rg --invert-match "node_modules|dist|lib|.git|.nyc_output|package-lock.json|LICENSES.txt|LICENSES.json"]]})<cr>')

keymap('n', '<leader>fb', '<cmd>lua require("fzf-lua").buffers()<cr>')
keymap('n', '<leader>fC', '<cmd>lua require("fzf-lua").colorschemes()<cr>')
keymap('n', '<leader>fa', '<cmd>lua require("fzf-lua").lsp_code_actions()<cr>')
keymap('n', '<leader>fm', '<cmd>lua require("fzf-lua").marks()<cr>')

keymap('n', '<leader>f*', '<cmd>lua require("fzf-lua").grep_cWORD()<cr>')
keymap('v', '<leader>f*', '<cmd>lua require("fzf-lua").grep_visual()<cr>')

keymap('n', '<leader>fc', '<cmd>lua require("fzf-lua").files({ cwd = "~/.config/nvim" })<cr>')

keymap('n', '<leader>fr', '<cmd>lua require("fzf-lua").resume()<cr>')

keymap('n', '<leader>fp', '<cmd>lua require("user.fzf.fzf-projects").projects({"~/workshop/devil"})<CR>')
