local utils = {}

function utils.map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function utils.unmap(mode, lhs)
  vim.api.nvim_del_keymap(mode, lhs)
end

return utils

