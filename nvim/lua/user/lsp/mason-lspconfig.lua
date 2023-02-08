local lspconfig = require('lspconfig')

require('mason-lspconfig').setup_handlers {
  function (server_name)
    lspconfig[server_name].setup {}
  end,

  ['sumneko_lua'] = function()
    lspconfig.sumneko_lua.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'use' }
          }
        }
      }
    })
  end,

  ['tsserver'] = function()
    lspconfig.tsserver.setup({
      settings = {
        completions = {
          completeFunctionCalls = true
        }
      }
    })
  end
}

