return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function ()
    local null_ls = require('null-ls')

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    local sources = {
      formatting.prettier,
      diagnostics.eslint.with({
        -- prefer_local = "node_modules/.bin" -- use project specific executable if available
        only_local = "node_modules/.bin" -- only run if project specific executable available
      }),
      code_actions.eslint.with({
        -- prefer_local = "node_modules/.bin" -- use project specific executable if available
        only_local = "node_modules/.bin" -- only run if project specific executable available
      }),
    }

    local lsp_formatting = function(bufnr)
      vim.lsp.buf.format({
        filter = function(client)
          return client.name == "null-ls"
        end,
        bufnr = bufnr,
      })
    end

    local format_lsp = vim.api.nvim_create_augroup("LspFormatting", {})

    local on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = format_lsp, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = format_lsp,
          buffer = bufnr,
          callback = function()
            lsp_formatting(bufnr)
          end,
        })
      end
    end

    null_ls.setup {
      debug = true,
      sources = sources,
      on_attach = on_attach,
    }
  end
}
