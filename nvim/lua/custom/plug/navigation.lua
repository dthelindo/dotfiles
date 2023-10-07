local M = {}

M.spec = {

  -- INFO: File marker
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {"<leader>hh", "<cmd> Telescope harpoon marks <cr>", desc = "Open harpoon marks" },
      {"<leader>ha", function() require("harpoon.mark").add_file() end, desc = "Harpoon: Add file" },
    }
  },

  -- INFO: Fuzzy finder, picker
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
      {
        "nvim-telescope/telescope-file-browser.nvim",
      }
    },
    opts = {
      extensions_list = {"themes", "terms", "live_grep_args", "harpoon", "fzf", "file_browser"},
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        harpoon = {
          mappings = {
            n = {
              ["1"] = function() require("harpoon.ui").nav_file(1) end,
            }
          }
        },
        file_browser = {
          hijack_netrw = true,
        }
      },
      pickers = {
        buffers = {
          mappings = {
            n = {
              ["d"] = "delete_buffer",
            }
          }
        }
      }
    },
    keys = {
      {"<leader><leader>", "<cmd> Telescope find_files <cr>", desc = "Find Files"},
      {"<leader>,", "<cmd> Telescope buffers <cr>", desc = "Find buffers"},
      {"<leader>fr", "<cmd> Telescope resume <cr>", desc = "Resume Telescope"},
      {"<leader>fk", "<cmd> Telescope keymaps <cr>", desc = "Find keymaps"},
      {"<leader>ff", "<cmd> Telescope file_browser <cr>", desc = "File browser"},
      {"<leader>fm", "<cmd> Noice telescope <cr>", desc = "Find messages"},
      {"<leader>fg", "<cmd> Telescope live_grep_args <cr>", desc = "Find grep"},
      {"<leader>fw", "<cmd> Telescope grep_string <cr>", desc = "Find current word"},
    }
  },

  -- INFO: Regex, Treesitter navigation
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
    ["<leader><leader>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>,"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fr"] = { "<cmd> Telescope resume <CR>", "Resume search" },
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "Find keymaps" },
    ["<leader>ff"] = { "<cmd> Telescope file_browser <CR>", "File browser" },
    ["<leader>fm"] = { "<cmd> Noice telescope <CR>", "Find messages" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep_args <cr>", "Find words" },
    ["<leader>fw"] = { "<cmd> Telescope grep_string <CR>", "Find current word" },
  }
}

return M
