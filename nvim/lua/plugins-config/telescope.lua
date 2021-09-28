require('telescope').setup {
  defaults = {
    file_ignore_patterns = { 'node_modules/.*' , '%.je?pg', '%.gif', '%.png', '%.zip'},
  },
  extensions = {
    fzf_writer = {
      -- minimum_grep_characters = 2,
      -- minimum_files_characters = 2,

      -- Disabled by default.
      -- Will probably slow down some aspects of the sorter, but can make color highlights.
      -- I will work on this more later.
      use_highlighter = true,
    },
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}

-- require('telescope').load_extension('fzf')

vim.cmd [[
  nnoremap <leader>ff <cmd>lua require('telescope').extensions.fzf_writer.files()<cr>
  nnoremap <leader>fg <cmd>lua require('telescope').extensions.fzf_writer.staged_grep()<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
]]


