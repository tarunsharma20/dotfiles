local utils = require('utils')

local map = utils.map


map('n', '<leader>ff', '<cmd>lua require("fzf-lua").files()<cr>')

map('n', '<leader>fg', '<cmd>lua require("fzf-lua").grep({filter = [[rg --invert-match "node_modules|dist|lib|.git|.nyc_output|package-lock.json|LICENSES.txt|LICENSES.json"]]})<cr>')
map('n', '<leader>fG', '<cmd>lua require("fzf-lua").grep_last()<cr>')
map('n', '<leader>fl', '<cmd>lua require("fzf-lua").live_grep_glob({filter = [[rg --invert-match "node_modules|dist|lib|.git|.nyc_output|package-lock.json|LICENSES.txt|LICENSES.json"]]})<cr>')

map('n', '<leader>fb', '<cmd>lua require("fzf-lua").buffers()<cr>')
map('n', '<leader>fC', '<cmd>lua require("fzf-lua").colorschemes()<cr>')
map('n', '<leader>fa', '<cmd>lua require("fzf-lua").lsp_code_actions()<cr>')
map('n', '<leader>fm', '<cmd>lua require("fzf-lua").marks()<cr>')

map('n', '<leader>f*', '<cmd>lua require("fzf-lua").grep_cWORD()<cr>')
map('v', '<leader>f*', '<cmd>lua require("fzf-lua").grep_visual()<cr>')

map('n', '<leader>fc', '<cmd>lua require("fzf-lua").files({ cwd = "~/.config/nvim" })<cr>')

map('n', '<leader>fr', '<cmd>lua require("fzf-lua").resume()<cr>')

map('n', '<leader>fp', '<cmd>lua require("user.fzf.fzf-projects").projects({"~/workshop/devil"})<CR>')
