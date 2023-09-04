local M = {}

-- Disable default keymaps
M.disabled = {
  n = {
    ["<leader>ff"] = "",
    ["<leader>fb"] = "",
    ["<leader>ls"] = "", -- LSP signature help
  }
}

M.general = {
  n = {
    ["<leader>qq"] = {"<cmd> qa <cr>", "Quit Neovim"}
  }
}


M.lazy = {
  plugin = true,
  n = {
    ["<leader>l"] = { "<cmd> Lazy <cr>", "Open Lazy" },
  }
}

M.telescope = require "custom.navigation.telescope".mappings
M.lazygit = require "custom.tools.lazygit".mappings
M.todo = require "custom.coding.todo-comments".mappings
M.flash = require "custom.coding.flash".mappings
M.trouble = require "custom.coding.trouble".mappings
M.session = require "custom.tools.persistence".mappings

return M
