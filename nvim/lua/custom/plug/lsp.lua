local M = {}

M.spec = {

  -- INFO: LSP, DAP, Formatter, Linter package manager
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "prettier",
        "gopls",
        "delve",
        "gofumpt",
        "goimports",
        "golangci-lint",
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
      return {
        sources = {
          nls.builtins.code_actions.eslint_d,
          nls.builtins.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes
          nls.builtins.code_actions.gitsigns,
          nls.builtins.code_actions.gomodifytags,
          nls.builtins.code_actions.impl,
          nls.builtins.code_actions.refactoring,
          nls.builtins.diagnostics.golangci_lint,
          nls.builtins.formatting.gofmt,
        },
        debug = true,
      }
    end
  }
}

return M
