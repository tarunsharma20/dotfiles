return {
  'lewis6991/gitsigns.nvim',
  config = function ()
    require('gitsigns').setup({
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local keymap = require('utils').keymap

        -- Navigation
        keymap('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = 'Navigate to next hunk' })

        keymap('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = 'Navigate to previous hunk' })

        -- Actions
        keymap({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = 'Stage hunk'})
        keymap({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = 'Reset hunk'})
        keymap('n', '<leader>hS', gs.stage_buffer, { desc = 'Stage all hunks in buffer'})
        keymap('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo last staged buffer'})
        keymap('n', '<leader>hR', gs.reset_buffer, { desc = 'Reset all hunks in buffer'})
        keymap('n', '<leader>hp', gs.preview_hunk, { desc = 'Show difference in floating window'})
        keymap('n', '<leader>hP', gs.preview_hunk_inline, { desc = 'Show difference inline'})
        keymap('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = 'Run git blame on current line'})
        keymap('n', '<leader>htb', gs.toggle_current_line_blame, { desc = 'Toggle git blame in current line'})
        keymap('n', '<leader>hd', gs.diffthis, { desc = 'Show git diff in buffer'})
        keymap('n', '<leader>hD', function() gs.diffthis('~') end)
        keymap('n', '<leader>htd', gs.toggle_deleted)

        -- Text object
        keymap({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
    })
  end
}

