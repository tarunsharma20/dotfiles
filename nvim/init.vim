let $DATA_PATH = stdpath('data')
let $CONFIG_PATH = stdpath('config')

source $CONFIG_PATH/plugins.vim
lua require('plugins-config')
lua require('mappings')
lua require('options')
source $CONFIG_PATH/autocmd.vim
source $CONFIG_PATH/lsp.vim
