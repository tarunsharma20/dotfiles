return {
  'kyazdani42/nvim-tree.lua',
  config = function ()
    local nvim_tree = require('nvim-tree')
    nvim_tree.setup()
  end,
  keys = {
    { '<Leader>e', '<CMD>NvimTreeToggle<CR>', desc = 'Toggle nvim-tree' },
    { '<Leader>o', '<CMD>NvimTreeFocus<CR>', desc = 'Focus on nvim-tree' },
  },
}

