local builtin = require("telescope.builtin")
-- require("telescope").load_extension("neoclip")

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      {
        "<leader>ff",
        function()
          builtin.resume()
        end,
        desc = "Resume Telescope",
      },
      {
        "<space><space>",
        function()
          builtin.find_files()
        end,
        desc = "Find files",
      },
      {
        "<leader>fg",
        function()
          builtin.live_grep()
        end,
        desc = "Find",
      },
      {
        "<leader>fc",
        function()
          builtin.live_grep({ glob_pattern = "!{spec, test}" })
        end,
        desc = "Find (Excl. Test Files)",
      },
      {
        "<leader>fo",
        function()
          builtin.oldfiles()
        end,
        desc = "Find previosly open files",
      },
      {
        "<leader>fw",
        function()
          builtin.grep_string()
        end,
        desc = "Find word",
      },
      {
        "<leader>fm",
        "<cmd>Noice telescope<cr>",
        desc = "Find Messages",
      },
      -- {
      --   "<leader>o",
      --   "<cmd>Telescope neoclip<cr>",
      --   desc = "Find clipboard",
      -- },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
