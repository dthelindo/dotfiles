local M = {}

M.spec = {
  -- LSP, DAP, Formatter, Linter package manager
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

  -- Bridges gap between mason and builtin nvim lsp client
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
}

return M
