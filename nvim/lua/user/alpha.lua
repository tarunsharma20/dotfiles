local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.buttons.val = {
  dashboard.button('SPC f c' , '  Open dotfiles'),
  dashboard.button(': e' , '  New file', ':e '),
  dashboard.button('SPC f f' , '  Find file'),
  dashboard.button('SPC f g' , '  Find world'),
  dashboard.button('SPC f C' , '  Color scheme', ':FzfLua colorschemes'),
}

alpha.setup(dashboard.config)
