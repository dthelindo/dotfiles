local M = {}

M.spec = {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      {
        "nvim-telescope/telescope-live-grep-args.nvim" ,
        version = "^1.0.0",
      },
    },
    opts = {
      extensions_list = {"themes", "terms", "live_grep_args"},
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    },
  },
}


M.mappings = {
  plugin = true,
  n = {
    ["<leader><leader>"] = { "<cmd> Telescope find_files <CR>", "Search files" },
    ["<leader>,"] = { "<cmd> Telescope buffers <CR>", "Search buffers" },
    ["<leader>fr"] = { "<cmd> Telescope resume <CR>", "Resume search" },
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "Search keymaps" },
    ["<leader>ff"] = { "<cmd> Telescope file_browser <CR>", "File browser" },
    ["<leader>fm"] = { "<cmd> Noice telescope <CR>", "Search messages" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep_args <cr>", "Search words" },
    ["<leader>fw"] = { "<cmd> Telescope grep_string <CR>", "Search current word" },
  }
}

return M
