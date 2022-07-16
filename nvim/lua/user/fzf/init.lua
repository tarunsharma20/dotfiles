local fzf_status_ok, fzf_lua = pcall(require, "fzf-lua")
if not fzf_status_ok then
  return
end

local scan_status_ok, scan = pcall(require, "plenary.scandir")
if not scan_status_ok then
  return
end

require 'user.fzf.main'
require 'user.fzf.keymap'
