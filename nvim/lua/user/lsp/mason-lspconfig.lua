local lspconfig = require('lspconfig')

require('mason-lspconfig').setup_handlers {
  function (server_name)
    lspconfig[server_name].setup {}
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

