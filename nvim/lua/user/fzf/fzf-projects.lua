local fzf_status_ok, fzf_lua = pcall(require, "fzf-lua")
if not fzf_status_ok then
  return
end

local scan_status_ok, scan = pcall(require, "plenary.scandir")
if not scan_status_ok then
  return
end

local M = {}

M.projects = function(projects, opts)
  local repos = {}

  projects = projects or {}
  opts = opts or {}
  opts.prompt = "Projects> "
  opts.actions = {
    ['default'] = function(selected)
      vim.cmd("cd " .. repos[selected[1]])
    end
  }

  local max_depth = opts.max_depth or 5

  for _, project in ipairs(projects) do
    local key = string.match(project, ".*/(.*)")
    local absolute_path = vim.fn.expand(project)

    repos[key] = absolute_path

    local git_dirs = scan.scan_dir(absolute_path, {
      depth = max_depth,
      add_dirs = true,
      hidden = true,
      search_pattern = "%.git$"
    })

    for _, val in ipairs(git_dirs) do
      local git_dir = string.gsub(val, "/.git$", '')
      key = string.match(git_dir, ".*/(.*)")
      repos[key] = git_dir
    end
  end

  local dirs = {}
  for key in pairs(repos) do
    dirs[#dirs+1] = key
  end

  table.sort(dirs, function(a, b) return a:lower() < b:lower() end)

  fzf_lua.fzf_exec(dirs or {}, opts)
end


return M
