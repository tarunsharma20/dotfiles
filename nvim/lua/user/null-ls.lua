local utils = require('utils')
local null_ls = require('null-ls')

local api = utils.api
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- using only null-ls formatting
      return client.name == 'null-ls'
    end,
    bufnr = bufnr,
  })
end

local sources = {
  formatting.prettier,
  -- diagnostics.eslint_d,
  -- code_actions.eslint_d,
}


null_ls.setup {
  debug = false,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      local formatBuffer = api.nvim_create_augroup("FormatBuffer", { clear = true })

      api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
        group = formatBuffer,
      })

    end
  end,
}


-- local formatJS = api.nvim_create_augroup("FormatJS", { clear = true })

-- api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.{js,jsx}",
--   command = "lua vim.lsp.buf.formatting_sync()",
--   group = formatJS,
-- })


