local M = {}

M.spec = {

  -- INFO: LSP, DAP, Formatter, Linter package manager
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- golang
        "gopls",
        "delve",
        "golangci-lint",
        "gofmt",
        "goimports",
        "goimports_reviser",
        "golines",
        "gomodifytags",
        "impl",

        -- typescript, javascript
        "typescript-language-server",
        "prettier",
        "eslint_d",

        -- lua
        "lua-language-server",
        "stylua",

        -- misc
        "buf",
        "cfn-lint",
      },
    },
    keys = {
      {"<leader>cm", "<cmd> Mason <cr>", desc = "Open Mason"}
    }
  },

  -- INFO: Bridges gap between mason and builtin nvim lsp client
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "jose-elias-alvarez/null-ls.nvim" },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  --INFO: Allow non-LSP services to hook into builtin nvim LSP client
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mason.nvim",
    },
    opts = function ()
      local nls = require "null-ls"
      local diagnostics = nls.builtins.diagnostics
      local formatting = nls.builtins.formatting
      local code_actions = nls.builtins.code_actions
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      return {
        sources = {
          -- golang
          diagnostics.golangci_lint.with({
            args = {
              "run",
              "--fix=true",
              "--out-format=json",
            },
          }),
          formatting.gofmt,
          formatting.goimports,
          formatting.goimports_reviser,
          formatting.golines,
          code_actions.gomodifytags,
          code_actions.impl,
          -- typescript, javascript
          formatting.prettier,
          code_actions.eslint_d,
          -- lua
          -- misc
          diagnostics.buf,
          diagnostics.cfn_lint,
          code_actions.gitsigns,
          code_actions.refactoring,
        },
        on_attach = function(client, bufnr)
          -- Autoformat on save
          if client.supports_method("textDocument/formatting") then
              vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
              vim.api.nvim_create_autocmd("BufWritePre", {
                  group = augroup,
                  buffer = bufnr,
                  callback = function()
                      -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                      -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                      vim.lsp.buf.format({
                        async = false ,
                        filter = function ()
                          return client.name == "null-ls"
                        end
                      })
                  end,
              })
          end
        end,
        debug = true,
      }
    end
  }
}

return M
