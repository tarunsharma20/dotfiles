local which_key = require('which-key')

-- Buffers
which_key.register({
  ['<leader>'] = {
    ['0'] =  'Show last buffer',
    ['1'] =  'Show first buffer',
    ['2'] =  'Show second buffer',
    ['3'] =  'Show third buffer',
    ['4'] =  'Show forth buffer',
    ['5'] =  'Show fifth buffer',
    ['6'] =  'Show sixth buffer',
    ['7'] =  'Show seventh buffer',
    ['8'] =  'Show eighth buffer',
    ['9'] =  'Show ninth buffer',
    b = {
      name = '+Buffer',
      o = 'Delete other buffers',
      r = 'Refresh syntax highlight',
      w = 'Wipeout buffer',
    }
  },
})

-- Navigations
which_key.register({
  ['['] = {
    b =  'Show previous buffer',
    B =  'Show first buffer',
    t =  'Show previous tab',
    T =  'Show first tab',
    q =  'Open previous quickfix',
    Q =  'Open first quickfix',
    c =  'Jump to previous change',
    d =  'Jump previous diagnostic',
  },
  [']'] = {
    b =  'Show next buffer',
    B =  'Show last buffer',
    t =  'Show next tab',
    T =  'Show last tab',
    q =  'Open next quickfix',
    Q =  'Open last quickfix',
    c =  'Jump to next change',
    d =  'Jump to next diagnostic',
  },
})

-- Fuzzy find
which_key.register({
  ['<leader>f'] = {
    name = '+Fuzzy',
    a = 'Find LSP actions',
    b = 'Find buffer',
    c = 'Find config',
    C = 'Find color schemes',
    f = 'Find file',
    g = 'Fuzzy search',
    G = 'Last search',
    l = 'Fuzzy Live search',
    m = 'Find marks',
    p = 'Find project',
    r = 'Resume last search',
    ['*'] = 'Grep world under cursor',
  },
})

-- Git
which_key.register({
  ['<leader>'] = {
    g = {
      name  = '+Git',
      d = 'Open 3 way git conflict',
      h = 'Pick LHS/Target)',
      t = 'Pick LHS/Target)',
      l = 'Pick RHS/Merge parent',
      m = 'Pick RHS/Merge parent',
    },
    h = {
      name  = '+Git hunk',
      p = 'Preview git hunk',
      s = 'Stage git hunk',
      u = 'Undo git hunk',
    },
  },
})

-- miscellaneous
which_key.register({
  ['<leader>'] = {
    j = 'Move down current line',
    k = 'Move up current line',
    md = 'Delete all marks',
    rn = 'LSP rename',
    ['<leader>'] = 'Turnoff search highlight',
    c = {
      name  = '+Find and update world',
      ['*'] = 'Change downwards',
      ['#'] = 'Change upwards',
    },
  },
  g = {
    d = 'Go to definition',
    D = 'Go to Declaration',
    f = 'Go to file under cursor',
  }
})
