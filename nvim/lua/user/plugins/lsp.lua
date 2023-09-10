return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason-lspconfig.nvim', -- Optional
  },
  config = function()
    require('mason').setup({
      ui = {
        icons = {
          package_installed = "",
          package_pending = "",
          package_uninstalled = ""
        }
      }
    })

    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    local lsp_defaults = lspconfig.util.default_config

    lsp_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lsp_defaults.capabilities,
      cmp_nvim_lsp.default_capabilities()
    )

    lsp_defaults.flags = {
      debounce_text_changes = 150,
    }

    lsp_defaults.on_attach = function(client, bufnr)
      vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
    end

    ---
    -- Diagnostic customization
    ---
    local sign = function(opts)
      vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
      })
    end

    sign({name = 'DiagnosticSignError', text = ''})
    sign({name = 'DiagnosticSignWarn', text = ''})
    sign({name = 'DiagnosticSignHint', text = '⚑'}) --
    sign({name = 'DiagnosticSignInfo', text = ''})

    vim.diagnostic.config({
      -- virtual_text = false,
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })

    ---
    -- LSP Keybindings
    ---
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function()
        local bufmap = function(mode, lhs, rhs)
          local opts = {buffer = true}
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
        bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
        bufmap('n', '<LocalLeader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>')
        bufmap('n', '<LocalLeader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>')
        bufmap('n', '<LocalLeader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>')
        bufmap('n', '<LocalLeader>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
        bufmap('n', '<LocalLeader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')
        bufmap('n', '<LocalLeader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')
        bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
        -- bufmap('n', '<LocalLeader>e', '<cmd>lua vim.diagnostic.open_float()<cr>')
        bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
        bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
        bufmap('n', '<LocalLeader>q', '<cmd>lua vim.diagnostic.setloclist()<cr>')
        bufmap('n', '<LocalLeader>f', '<cmd>lua vim.lsp.buf.formatting()<cr>')
      end
    })

    local have_mason, mason_lspconfig = pcall(require, "mason-lspconfig")

    ---
    -- Setup Mason LSP Config if available
    ---
    if have_mason then
      mason_lspconfig.setup({
        ensure_installed = {
          'lua_ls',
          'tsserver',
          'cssls',
          'html',
          'tailwindcss',
          'eslint',
          'jsonls',
          'cucumber_language_server',
        }
      })

      mason_lspconfig.setup_handlers {
        function (server_name)
          lspconfig[server_name].setup {}
        end,

        ['lua_ls'] = function()
          lspconfig.lua_ls.setup({
            settings = { Lua = { diagnostics = { globals = { 'vim', 'use' } } }
            }
          })
        end,

        ['tsserver'] = function()
          lspconfig.tsserver.setup({
            settings = { completions = { completeFunctionCalls = true } }
          })
        end
      }
    end
  end
}
