local colors = {
  base_bg         = '#02111d',
  base_fg         = '#c0c0c0',

  base_bg_shade_1 = '#112630',
  base_bg_shade_2 = '#0d2a41',

  hidden          = '#444444',
  comment         = '#585858',
  faint           = '#767676',

  success         = '#00af00',
  warning         = '#ffaf00',
  danger          = '#ff5f5f',

  color_1         = '#8787ff',
  color_2         = '#87d75f',
  color_3         = '#00afaf',
  color_4         = '#ffd700',
  color_5         = '#ff00ff',
  color_6         = '#d78700',
}

local witching_hour = {
  normal = {
    a = {bg = colors.color_3, fg = colors.base_bg, gui = 'bold'},
    b = {bg = colors.comment, fg = colors.base_fg},
    c = {bg = colors.base_fg, fg = colors.base_bg},
  },
  insert = {
    a = {bg = colors.success, fg = colors.base_bg, gui = 'bold'},
    b = {bg = colors.comment, fg = colors.base_fg},
    c = {bg = colors.base_fg, fg = colors.base_bg},
  },
  visual = {
    a = {bg = colors.color_1, fg = colors.base_bg, gui = 'bold'},
    b = {bg = colors.comment, fg = colors.base_fg},
    c = {bg = colors.base_fg, fg = colors.base_bg},
  },
  replace = {
    a = {bg = colors.color_6, fg = colors.base_bg, gui = 'bold'},
    b = {bg = colors.comment, fg = colors.base_fg},
    c = {bg = colors.base_fg, fg = colors.base_bg},
  },
  command = {
    a = {bg = colors.danger, fg = colors.base_bg, gui = 'bold'},
    b = {bg = colors.comment, fg = colors.base_fg},
    c = {bg = colors.base_fg, fg = colors.base_bg},
  },
  inactive = {
    a = {bg = colors.hidden, fg = colors.base_fg, gui = 'bold'},
    b = {bg = colors.comment, fg = colors.base_fg},
    c = {bg = colors.faint, fg = colors.base_bg},
  },
}

require('lualine').setup {
   options = {
    theme = witching_hour,
    component_separators = {'', ''},
    section_separators = {'', ''},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'filetype', 'encoding', 'fileformat'},
    lualine_y = {'location'},
    lualine_z = {'branch'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {require'tabline'.tabline_buffers},
    lualine_x = {require'tabline'.tabline_tabs},
    lualine_y = {},
    lualine_z = {},
  },
}

