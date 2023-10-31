return {

  -- Neovim session persistence
  {
    "folke/persistence.nvim",
    lazy = false,
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
    keys = {
      {
        "<leader>ql",
        function() require("persistence").load({ last = true }) end,
        desc = "Restore Last Session"
      },
    },
  },

  -- File marker
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>hh", "<cmd> Telescope harpoon marks <cr>",              desc = "Open harpoon marks" },
      { "<leader>ha", function() require("harpoon.mark").add_file() end, desc = "Harpoon: Add file" },
    }
  },

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>",      desc = "Decrement selection", mode = "x" },
    },
    opts = {
      highlight = {
        enable = true,
        use_languagetree = true,
      },

      indent = { enable = true },
      ensure_installed = {
        "bash",
        "regex",
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "markdown",
        "markdown_inline",
        "go",
        "gomod",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
        },
      },
    },
  },

  -- Regex, Treesitter navigation
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    ---@type Flash.Config
    keys = {
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
      { "s", mode = { "n" }, function() require("flash").jump() end, desc = "Flash" },
      {
        "S",
        mode = { "n" },
        function() require("flash").treesitter() end,
        desc =
        "Flash treesitter"
      },
      {
        "R",
        mode = { "n" },
        function() require("flash").treesitter_search() end,
        desc =
        "Flash treesitter search"
      },
    },
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    event = "BufEnter",
    version = "*",
    opts = {
      open_mapping = [[<c-\>]],
    },
    keys = {
      { "<leader>ts", "<cmd>TermSelect<cr>",        desc = "Select Terminal" },
      { "<leader>tr", "<cmd>ToggleTermSetName<cr>", desc = "Rename Terminal" },
    }
  },

  -- Mini helpers
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.surround",
    keys = function(_, keys)
      -- Populate the keys based on the user's options
      local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      local mappings = {
        {
          opts.mappings.add,
          desc = "Add surrounding",
          mode = {
            "n", "v" }
        },
        { opts.mappings.delete,         desc = "Delete surrounding" },
        { opts.mappings.find,           desc = "Find right surrounding" },
        { opts.mappings.find_left,      desc = "Find left surrounding" },
        { opts.mappings.highlight,      desc = "Highlight surrounding" },
        { opts.mappings.replace,        desc = "Replace surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        add = "gza",        -- Add surrounding in Normal and Visual modes
        delete = "gzd",     -- Delete surrounding
        find = "gzf",       -- Find surrounding (to the right)
        find_left = "gzF",  -- Find surrounding (to the left)
        highlight = "gzh",  -- Highlight surrounding
        replace = "gzr",    -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
  },
}
