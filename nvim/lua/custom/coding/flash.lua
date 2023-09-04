local M = {}

M.spec = {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    ---@type Flash.Config
    keys = {
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      { "s", mode = { "n" }, function() require("flash").jump() end, desc = "Flash"},
      { "S", mode = { "n" }, function() require("flash").treesitter() end, desc = "Flash treesitter"},
      { "R", mode = { "n" }, function() require("flash").treesitter_search() end, desc = "Flash treesitter search"},
    },
  },
}

M.mappings = {
  plugin = true,
  n = {
    ["s"] = {function () require("flash").jump() end, "Flash"},
    ["S"] = {function () require("flash").treesitter() end, "Flash treesitter"},
    ["R"] = {function () require("flash").treesitter_search() end, "Flash treesitter_search"},
  }
}

return M
