return {
  'nvim-lualine/lualine.nvim',
  config = function ()
    local lualine = require('lualine')

    -- Tint of colors used in witching hour theme
    local colors = {
      base_bg         = '#1b2934',
      base_fg         = '#bbbbbb',
      light_bg        = '#35414a',

      color_1         = '#ababff',
      color_2         = '#abe38f',
      color_3         = '#66cfcf',
      color_4         = '#ffe766',
      color_5         = '#ff80ff',
      color_6         = '#e7b766',
    }

    local witching_hour = {
      normal = {
        a = {bg = colors.color_1, fg = colors.base_bg, gui = 'bold'},
        b = {bg = colors.light_bg, fg = colors.base_fg},
        c = {bg = colors.base_bg, fg = colors.base_fg},
      },
      insert = {
        a = {bg = colors.color_2, fg = colors.base_bg, gui = 'bold'},
        b = {bg = colors.light_bg, fg = colors.base_fg},
        c = {bg = colors.base_bg, fg = colors.base_fg},
      },
      visual = {
        a = {bg = colors.color_3, fg = colors.base_bg, gui = 'bold'},
        b = {bg = colors.light_bg, fg = colors.base_fg},
        c = {bg = colors.base_bg, fg = colors.base_fg},
      },
      replace = {
        a = {bg = colors.color_6, fg = colors.base_bg, gui = 'bold'},
        b = {bg = colors.light_bg, fg = colors.base_fg},
        c = {bg = colors.base_bg, fg = colors.base_fg},
      },
      command = {
        a = {bg = colors.color_5, fg = colors.base_bg, gui = 'bold'},
        b = {bg = colors.light_bg, fg = colors.base_fg},
        c = {bg = colors.base_bg, fg = colors.base_fg},
      },
      inactive = {
        a = {bg = colors.light_bg, fg = colors.base_fg, gui = 'bold'},
        b = {bg = colors.light_bg, fg = colors.base_fg},
        c = {bg = colors.light_bg, fg = colors.base_fg},
      },
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end

    local filename = {
      'filename',
      file_status = true, 
      path = 1, 
      shorting_target = 40,
      -- symbols = {
      --   modified = '[+]',      -- Text to show when the file is modified.
      --   readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
      --   unnamed = '[No Name]', -- Text to show for unnamed buffers.
      -- }
    }

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " " },
      colored = false,
      update_in_insert = false,
      always_visible = true,
    }

    local diff = {
      "diff",
      colored = false,
      symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
      cond = hide_in_width
    }

    local branch = {
      "branch",
      icons_enabled = true,
      icon = "",
    }

    -- cool function for progress
    local progress = function()
      local current_line = vim.fn.line(".")
      local total_lines = vim.fn.line("$")
      local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return chars[index]
    end

    local spaces = function()
      return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = witching_hour,
        component_separators = {left = '', right = ''},
        section_separators = {left = '', right = ''},
        disabled_filetypes = { "NvimTree" },
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        -- lualine_a = { 'mode' },
        lualine_b = {},
        lualine_c = {filename, diff},
        -- lualine_x = { diff, spaces, 'filetype', 'encoding', 'fileformat', progress },
        lualine_x = { diagnostics, 'filetype', 'encoding', 'fileformat' },
        lualine_y = { 'location' },
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
  end
}

