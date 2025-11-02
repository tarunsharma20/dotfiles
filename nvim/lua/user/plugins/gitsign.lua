vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

require('gitsigns').setup({
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    -- Navigation
    vim.keymap.set('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true, desc = 'Navigate to next hunk' })

    vim.keymap.set('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true, desc = 'Navigate to previous hunk' })

    -- Actions
    vim.keymap.set({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = 'Stage hunk' })
    vim.keymap.set({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = 'Reset hunk' })
    vim.keymap.set('n', '<leader>hS', gs.stage_buffer, { desc = 'Stage all hunks in buffer' })
    vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo last staged buffer' })
    vim.keymap.set('n', '<leader>hR', gs.reset_buffer, { desc = 'Reset all hunks in buffer' })
    vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { desc = 'Show difference in floating window' })
    vim.keymap.set('n', '<leader>hP', gs.preview_hunk_inline, { desc = 'Show difference inline' })
    vim.keymap.set('n', '<leader>hb', function() gs.blame_line { full = true } end,
      { desc = 'Run git blame on current line' })
    vim.keymap.set('n', '<leader>htb', gs.toggle_current_line_blame, { desc = 'Toggle git blame in current line' })
    vim.keymap.set('n', '<leader>hd', gs.diffthis, { desc = 'Show git diff in buffer' })
    vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end)
    vim.keymap.set('n', '<leader>htd', gs.toggle_deleted)

    -- Text object
    vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
})
