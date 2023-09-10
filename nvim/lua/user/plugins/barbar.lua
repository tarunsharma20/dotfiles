return {
  'romgrk/barbar.nvim',
  config = function ()
    require('barbar').setup {
      icons = {
        buffer_index = true,
      }
    }
    local keymap = require('utils').keymap

    -- Mappings
    keymap('n', ']b', ':BufferNext<CR>', { desc = 'Visit next buffer' })
    keymap('n', '[b', ':BufferPrevious<CR>', { desc = 'Visit previous buffer' })
    keymap('n', '[B', ':BufferFirst<CR>', { desc = 'Visit first buffer' })
    keymap('n', ']B', ':BufferLast<CR>', { desc = 'Visit last buffer' })

    -- Goto buffer in position...
    keymap('n', '<Leader>1', ':BufferGoto 1<CR>', { desc = 'Visit 1st buffer' })
    keymap('n', '<Leader>2', ':BufferGoto 2<CR>', { desc = 'Visit 2nd buffer' })
    keymap('n', '<Leader>3', ':BufferGoto 3<CR>', { desc = 'Visit 3rd buffer' })
    keymap('n', '<Leader>4', ':BufferGoto 4<CR>', { desc = 'Visit 4th buffer' })
    keymap('n', '<Leader>5', ':BufferGoto 5<CR>', { desc = 'Visit 5th buffer' })
    keymap('n', '<Leader>6', ':BufferGoto 6<CR>', { desc = 'Visit 6th buffer' })
    keymap('n', '<Leader>7', ':BufferGoto 7<CR>', { desc = 'Visit 7th buffer' })
    keymap('n', '<Leader>8', ':BufferGoto 8<CR>', { desc = 'Visit 8th buffer' })
    keymap('n', '<Leader>9', ':BufferGoto 9<CR>', { desc = 'Visit 9th buffer' })
    keymap('n', '<Leader>0', ':BufferLast<CR>', { desc = 'Visit last buffer' })
  end
}

