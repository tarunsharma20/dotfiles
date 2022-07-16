local utils = require('utils')
local map = utils.map

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
map('n', '[b', ':BufferPrevious<CR>')
map('n', ']b', ':BufferNext<CR>')
-- Re-order to previous/next
map('n', '[B', ':BufferMovePrevious<CR>')
map('n', ']B', ':BufferMoveNext<CR>')
-- Goto buffer in position...
map('n', '<leader>1', ':BufferGoto 1<CR>')
map('n', '<leader>2', ':BufferGoto 2<CR>')
map('n', '<leader>3', ':BufferGoto 3<CR>')
map('n', '<leader>4', ':BufferGoto 4<CR>')
map('n', '<leader>5', ':BufferGoto 5<CR>')
map('n', '<leader>6', ':BufferGoto 6<CR>')
map('n', '<leader>7', ':BufferGoto 7<CR>')
map('n', '<leader>8', ':BufferGoto 8<CR>')
map('n', '<leader>9', ':BufferGoto 9<CR>')
map('n', '<leader>0', ':BufferLast<CR>')
-- Close buffer
-- map('n', '<leader>bc', ':BufferClose<CR>')
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map('n', '<leader>bp', ':BufferPick<CR>')
-- Sort automatically by...
-- map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>')
-- map('n', '<Space>bd', ':BufferOrderByDirectory<CR>')
-- map('n', '<Space>bl', ':BufferOrderByLanguage<CR>')

