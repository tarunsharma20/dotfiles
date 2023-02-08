local telescope = require('telescope')
local actions = require('telescope.actions')
local lga_actions = require("telescope-live-grep-args.actions")
local utils = require('utils')

local keymap = utils.keymap

telescope.setup {
  defaults = {
    sorting_strategy = 'descending', -- options: "descending", "ascending"
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { 'node_modules/.*' , '.git/.*', '%.je?pg', '%.gif', '%.png', '%.zip', 'lib/*', 'dist/*', '.storybook/*'},
    layout_config = {
      horizontal = {
        height = 0.9,
        preview_cutoff = 120,
        preview_width = 0.5,
        prompt_position = "bottom",
        width = 0.9
      },
     vertical = {
        height = 0.9,
        preview_cutoff = 40,
        prompt_position = "bottom",
        width = 0.9
      }
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden'
    },
    mappings = {
      i = {
        ["<C-q>"] = actions.add_selected_to_qflist + actions.open_qflist
      },
      n = {
        ["<C-q>"] = actions.add_selected_to_qflist + actions.open_qflist
      }
    }
  },
  extensions = {
    project = {
      base_dirs = {
        {path= '~/workshop/devil'}
      },
      hidden_files = true -- default: false
    },
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        }
      }
    }
  }
}

telescope.load_extension('fzf')
telescope.load_extension('project')
telescope.load_extension('file_browser')
telescope.load_extension("live_grep_args")

keymap('n', '<leader>ff', '<cmd>Telescope find_files hidden=true no_ignore=true<cr>')
keymap('n', '<leader>fc', '<cmd>lua require("telescope.builtin").find_files{cwd = "~/.config/nvim"}<cr>')

-- keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap('n', '<leader>fg', '<cmd>:lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>')
keymap('n', '<leader>fG', '<cmd>lua require("telescope").extensions.live_grep_raw.live_grep_raw()<cr>')
keymap('n', '<leader>fr', '<cmd>lua require("telescope.builtin").resume()<cr>')
keymap('n', '<leader>fm', '<cmd>lua require("telescope.builtin").marks()<cr>')
keymap('n', '<leader>fC', '<cmd>lua require("telescope.builtin").colorscheme()<cr>')
keymap('n', '<leader>f*', '<cmd>Telescope grep_string<cr>')
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
keymap('n', '<leader>fp', '<cmd>Telescope project<cr>')
keymap('n', '<leader>fe', '<cmd>Telescope file_browser<cr>')

keymap('n', 'z=', '<cmd>lua require("telescope.builtin").spell_suggest()<cr>')
