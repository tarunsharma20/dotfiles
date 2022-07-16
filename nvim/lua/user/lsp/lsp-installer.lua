local lsp_installer = require('nvim-lsp-installer')

-- Register a handler that will be called for all installed servers.
-- You can also also register handlers on specific server instances
lsp_installer.on_server_ready(function(server)
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  local opts = {
    on_attach = require('user.lsp.handlers').on_attach,
		capabilities = require('user.lsp.handlers').capabilities,
  }

  if server.name == "sumneko_lua" then
    local lua_opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'use' }
          }
        }
      }
    }

    opts = vim.tbl_deep_extend("force", lua_opts, opts)
  end

  server:setup(opts)
end)

