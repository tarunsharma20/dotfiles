local utils = {}

function utils.keymap(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.keymap.set(mode, lhs, rhs, options)
end


function utils.unmap(mode, lhs)
  vim.api.nvim_del_keymap(mode, lhs)
end

utils.go = vim.opt -- vim.go
utils.bo = vim.opt -- vim.bo
utils.wo = vim.opt -- vim.wo
utils.opt = vim.opt
utils.fn = vim.fn
utils.cmd = vim.cmd
utils.api = vim.api



return utils

