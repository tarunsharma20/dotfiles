vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

local icons = require("user.icons")

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local filename = {
  "filename",
  file_status = true,
  path = 1,
  shorting_target = 40,
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = icons.diagnostics.ERROR .. " ", warn = icons.diagnostics.WARN .. " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = {
    added = icons.git.added .. " ",
    modified = icons.git.modified .. " ",
    removed = icons.git.removed .. " ",
  },
  cond = hide_in_width,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = icons.git.branch,
}

require("lualine").setup({
  options = {
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = icons.misc.left_separator, right = icons.misc.right_separator },
    disabled_filetypes = { "NvimTree" },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    -- lualine_a = { 'mode' },
    lualine_b = {},
    lualine_c = { filename, diff },
    lualine_x = { diagnostics, "filetype", "encoding", "fileformat" },
    lualine_y = { "location" },
    lualine_z = { branch },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {},
})
