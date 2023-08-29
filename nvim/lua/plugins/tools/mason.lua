return {
  -- LSP, DAP, Lint, Formatter Paackage Manager
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
        "gomodifytags",
        "impl",
        "gofumpt",
        "goimports-reviser",
        "delve",
      },
    },
  },
}
