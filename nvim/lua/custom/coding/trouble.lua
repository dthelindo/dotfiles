local M = {}

M.spec = {
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
    keys = {
      {"<leader>tt", "<cmd> TroubleToggle <cr>", desc = "Open trouble"},
      {"gR", "<cmd> TroubleToggle lsp_references <cr>", desc = "Open Lsp references"},
    }
  },
}

M.mappings = {
  plugin = true,
  n = {
    ["<leader>tt"] = {"<cmd> TroubleToggle <cr>", "Open trouble"},
    ["gR"] = {"<cmd> TroubleToggle lsp_references <cr>", "Open Lsp references"},
  }
}

return M
