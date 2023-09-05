local M = {}

M.spec = {
  {
    "folke/lazy.nvim",
    keys = {
      {"<leader>l", "<cmd> Lazy <cr>", desc = "Open Lazy"}
    }
  }
}

M.mappings = {
  n = {
    ["<leader>l"] = {"<cmd> Lazy <cr>", "Open Lazy"}
  }
}

return M
