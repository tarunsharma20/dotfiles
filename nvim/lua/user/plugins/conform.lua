vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    -- python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    -- rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
    typescript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
    json = { "biome-check", "prettierd", "prettier", stop_after_first = true },
    css = { "biome-check", "prettierd", "prettier", stop_after_first = true },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})

vim.keymap.set('n', '<Leader>bf', '<CMD>lua vim.lsp.buf.format()', { desc = 'format buffer' })
