local utils = require('utils')
local keymap = utils.keymap

vim.g.bufferline = {
  -- Enable/disable animations
  animation = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable close button
  closable = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Excludes buffers from the tabline
  exclude_ft = {},
  exclude_name = {},

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = 'both',

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
}

-- Mappings
-- Move to previous/next
keymap('n', '[b', ':BufferPrevious<cr>')
keymap('n', ']b', ':BufferNext<cr>')
-- Re-order to previous/next
keymap('n', '[B', ':BufferFirst<cr>')
keymap('n', ']B', ':BufferLast<cr>')
-- keymap('n', '[B', ':BufferMovePrevious<cr>')
-- keymap('n', ']B', ':BufferMoveNext<cr>')

-- Goto buffer in position...
keymap('n', '<leader>1', ':BufferGoto 1<cr>')
keymap('n', '<leader>2', ':BufferGoto 2<cr>')
keymap('n', '<leader>3', ':BufferGoto 3<cr>')
keymap('n', '<leader>4', ':BufferGoto 4<cr>')
keymap('n', '<leader>5', ':BufferGoto 5<cr>')
keymap('n', '<leader>6', ':BufferGoto 6<cr>')
keymap('n', '<leader>7', ':BufferGoto 7<cr>')
keymap('n', '<leader>8', ':BufferGoto 8<cr>')
keymap('n', '<leader>9', ':BufferGoto 9<cr>')
keymap('n', '<leader>0', ':BufferLast<cr>')
-- Close buffer
-- keymap('n', '<leader>bc', ':BufferClose<cr>')
-- Wipeout buffer
--                 :BufferWipeout<cr>
-- Close commands
--                 :BufferCloseAllButCurrent<cr>
--                 :BufferCloseBuffersLeft<cr>
--                 :BufferCloseBuffersRight<cr>
-- Magic buffer-picking mode
keymap('n', '<leader>bp', ':BufferPick<cr>')
-- Sort automatically by...
-- keymap('n', '<Space>bb', ':BufferOrderByBufferNumber<cr>')
-- keymap('n', '<Space>bd', ':BufferOrderByDirectory<cr>')
-- keymap('n', '<Space>bl', ':BufferOrderByLanguage<cr>')

