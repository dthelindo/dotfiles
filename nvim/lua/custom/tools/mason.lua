local M = {}

M.spec = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettier",

        -- c/cpp stuff
        "clangd",
        "clang-format",

        -- go stuff
        "gopls",
        "delve",
        "gofumpt",
        "goimports",
        "golangci-lint",
      },
    },
  },
}

return M
