---@type NvPluginSpec[]
local plugins = {
  require "custom.coding.symbolsoutline".spec,
  require "custom.coding.trouble".spec,
  require "custom.coding.flash".spec,
  require "custom.coding.todo-comments".spec,

  -- require "custom.configs.lspconfig",
  -- TODO: create null-ls plugin spec
  -- require "custom.configs.null-ls",

  require "custom.navigation.telescope".spec,

  require "custom.tools.lspconfig".spec,
  require "custom.tools.mason".spec,
  require "custom.tools.treesitter".spec,
  require "custom.tools.lazygit".spec,
  require "custom.tools.vim-illuminate".spec,
  require "custom.tools.persistence".spec,
  require "custom.tools.lazy".spec,
  require "custom.tools.executor".spec,

  require "custom.ui.noice".spec,
  require "custom.ui.nvim-tree".spec,
  require "custom.ui.gitsigns".spec,
  require "custom.ui.mini-indentscope".spec,
  require "custom.ui.notify".spec,

  require "custom.editor.mini".spec,
  require "custom.editor.oil".spec,

  require "custom.lang.go".spec,

  require "custom.testing.dap".spec,
  require "custom.testing.neotest".spec,
}

-- TODO: automatically pull plugins
-- local folder_path = "$HOME/.config/nvim/lua/custom/"
-- local plugin_files = io.open('ls "' .. folder_path .. '"'):lines()
-- for file in plugin_files do
--   if file ~= "chadrc.lua" and file ~= "plugins.lua" then
--     local success, data = pcall(dofile, folder_path .. "/" .. file)
--     if success and type(data) == "table" then
--       plugins = vim.tbl_deep_extend("force", plugins, data)
--     end
--   end
-- end

return plugins
