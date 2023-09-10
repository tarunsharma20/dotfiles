return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-project.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
  },
  keys = {
    { '<Leader>fo', '<CMD>Telescope<CR>', desc = 'Open fuzzy find' },
    { '<Leader>ff', '<CMD>Telescope find_files hidden=true no_ignore=true<CR>', desc = 'Find files' },
    { '<Leader>fc', '<CMD>lua require("telescope.builtin").find_files{cwd = "~/.config/nvim"}<CR>', desc = 'Find configuration' },
    { '<Leader>fg', '<CMD>:lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>', desc = 'Find text' },
    { '<Leader>fG', '<CMD>lua require("telescope").extensions.live_grep_raw.live_grep_raw()<CR>', desc = 'Find' },
    { '<Leader>fr', '<CMD>lua require("telescope.builtin").resume()<CR>', desc = 'Resume last find' },
    { '<Leader>fm', '<CMD>lua require("telescope.builtin").marks()<CR>', desc = 'Find marks' },
    { '<Leader>fC', '<CMD>lua require("telescope.builtin").colorscheme()<CR>', desc = 'Find colorscheme' },
    { '<Leader>f*', '<CMD>Telescope grep_string<CR>', desc = 'Find text under cursor' },
    { '<Leader>fb', '<CMD>Telescope buffers<CR>', desc = 'Find buffer' },
    { '<Leader>fp', '<CMD>Telescope project<CR>', desc = 'Find project' },
    { 'z=', '<CMD>lua require("telescope.builtin").spell_suggest()<CR>', desc = 'Find spelling' },
  },
  config = function ()
    local telescope = require('telescope')

    telescope.setup {
      extensions = {
        project = {
          base_dirs = {
            { path= '~/workshop/devil', max_depth = 4 }
          },
          hidden_files = true -- default: false
        },
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
        }
      }
    }

    telescope.load_extension('fzf')
    telescope.load_extension('project')
    telescope.load_extension("live_grep_args")
  end
}
