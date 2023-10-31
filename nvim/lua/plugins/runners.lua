return {

  -- Async command execution
  {
    "google/executor.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>cr", "<cmd> ExecutorRun <cr>",          desc = "Executor run" },
      { "<leader>cR", "<cmd> ExecutorToggleDetail <cr>", desc = "Executor toggle" },
      { "<leader>cx", "<cmd> ExecutorReset <cr>",        desc = "Executor reset" },
    },
    config = function()
      require("executor")
    end
  },
  -- Job runner
  {
    'stevearc/overseer.nvim',
    opts = {
      templates = { "builtin", "example" },
    },
    keys = {
      { "<leader>ot", "<cmd> OverseerToggle <cr>", desc = "Overseer toggle" },
      { "<leader>or", "<cmd> OverseerRun <cr>",    desc = "Overseer run" },
    }
  },
}
