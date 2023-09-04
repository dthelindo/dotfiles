local M = {}

M.spec = {
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    keys = {
      {"]t", function() require("todo-comments").jump_next() end, desc = "Jump to next todo"},
      {"[t", function() require("todo-comments").jump_prev() end, desc = "Jump to prev todo"},
      {"<leader>st", "<cmd> TodoTelescope <cr>", desc = "Search todos"},
    }
  },
}


M.mappings = {
  plugin = true,
  n = {
    ["]t"] = {function () require("todo-comments").jump_next() end, "Jump to next todo"},
    ["[t"] = {function () require("todo-comments").jump_prev() end, "Jump to prev todo"},
    ["<leader>st"] = {"<cmd> TodoTelescope <cr>", "Search todo"},
  }
}

return M
