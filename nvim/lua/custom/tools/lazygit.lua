local M = {}

M.spec = {
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
      {"<leader>gg", "<cmd> LazyGit <cr>", desc = "Open LazyGit"},
    }
  },
}

M.mappings = {
  plugin = true,
  n = {
    ["<leader>gg"] = {"<cmd> LazyGitToggle <cr>", "Open LazyGit"}
  }
}

return M
