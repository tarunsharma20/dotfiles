require('tabline').setup {
  enable = false,
  options = {
    component_separators = {'', ''},
    section_separators = {'', ''},
    max_bufferline_percent = 95, -- set to nil by default, and it uses vim.o.columns * 2/3
    always_show_tabs = false,
    show_filename_only = true, 
  },
}


