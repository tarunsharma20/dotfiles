return {
  'stevearc/oil.nvim',
  opts = {},
  keys = {
    { '-', '<CMD>lua require("oil").open(nil)<CR>', desc = 'Open parent directory' },
    { '_', '<CMD>lua require("oil").open(vim.fn.getcwd())<CR>', desc = 'Open cwd' },
  },
  config = function ()
    require('oil').setup({
      view_options = {
        show_hidden = true,
      },
      -- Deleted files will be removed with the trash_command (below).
      delete_to_trash = true,
      -- Change this to customize the command used when deleting to trash
      -- Using trash-cli https://github.com/sindresorhus/trash-cli
      trash_command = "trash",
    })
  end,
}
