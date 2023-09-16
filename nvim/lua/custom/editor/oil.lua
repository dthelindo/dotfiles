local M = {}

M.spec = {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {"-", "<cmd> Oil <cr>", desc = "Open Oil"},
  },
  opts = {
    default_file_explorer = true,
  }
}

return M
