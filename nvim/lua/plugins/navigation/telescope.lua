local builtin = require("telescope.builtin")

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      -- "nvim-telescope/telescope-file-browser.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      { "<leader>fo", "<cmd>Telescope resume<cr>", desc = "Resume Telescope" },
      { "<space><space>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find" },
      { "<leader>fc", "<cmd>Telescope live_grep glob_pattern=!{spec, test}<cr>", desc = "Find (Excl. Test Files)" },
      -- { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Find previously open files" },
      { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Find current word" },
      { "<leader>fm", "<cmd>Noice telescope<cr>", desc = "Find Messages" },
      -- { "<leader>ff", "<cmd>Telescope file_browser<cr>", desc = "Open file browser" },
    },
    opts = {
      defaults = {
        theme = "center",
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
      -- extensions = {
      --   file_browser = {
      --     hijack_netrw = true,
      --   },
      -- },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      -- require("telescope").load_extension("file_browser")
    end,
  },
}
