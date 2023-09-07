local M = {}

M.spec = {
  {
    "google/executor.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {"<leader>cr", "<cmd> ExecutorRun <cr>", desc = "Executor run"},
      {"<leader>cR", "<cmd> ExecutorToggleDetail <cr>", desc = "Executor toggle"},
      {"<leader>cx", "<cmd> ExecutorReset <cr>", desc = "Executor reset"},
    },
    config = function ()
      require("executor")
    end
  }
}

M.mappings = {
  n = {
    ["<leader>cr"] = {"<cmd> ExecutorRun <cr>", "Run Executor"},
    ["<leader>cR"] = {"<cmd> ExecutorToggleDetail <cr>", "Show Executor"},
    ["<leader>cx"] = {"<cmd> ExecutorReset <cr>", "Reset Executor"},
  }
}

return M
