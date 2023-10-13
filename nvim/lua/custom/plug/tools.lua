
local M = {}

M.spec = {

  -- INFO: Async command execution
  {
    "google/executor.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {"<leader>cr", "<cmd> ExecutorRun <cr>", desc = "Executor run"},
      {"<leader>cR", "<cmd> ExecutorToggleDetail <cr>", desc = "Executor toggle"},
      {"<leader>cx", "<cmd> ExecutorReset <cr>", desc = "Executor reset"},
    },
    config = function ()
      require("executor")
    end
  },

  -- INFO: Neovim session persistence
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },

  -- INFO: Code parser
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
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
        "c",
        "markdown",
        "markdown_inline",
        "go",
        "gomod",
        "gowork",
        "gosum",
      },
    },
  },

  -- INFO: Terminal
  {
    "akinsho/toggleterm.nvim",
    event = "BufEnter",
    version = "*",
    opts = {
      open_mapping = [[<c-\>]],
    },
    keys = {
      { "<leader>ts", "<cmd>TermSelect<cr>", desc = "Select Terminal" },
      { "<leader>tr", "<cmd>ToggleTermSetName<cr>", desc = "Rename Terminal" },
    }
  },

  -- INFO: Mini
  { 'echasnovski/mini.nvim', version = false },
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
        { opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
        { opts.mappings.delete, desc = "Delete surrounding" },
        { opts.mappings.find, desc = "Find right surrounding" },
        { opts.mappings.find_left, desc = "Find left surrounding" },
        { opts.mappings.highlight, desc = "Highlight surrounding" },
        { opts.mappings.replace, desc = "Replace surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        add = "gza", -- Add surrounding in Normal and Visual modes
        delete = "gzd", -- Delete surrounding
        find = "gzf", -- Find surrounding (to the right)
        find_left = "gzF", -- Find surrounding (to the left)
        highlight = "gzh", -- Highlight surrounding
        replace = "gzr", -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
  },
}

M.mappings = {
  n = {
    ["<leader>cr"] = {"<cmd> ExecutorRun <cr>", "Run Executor"},
    ["<leader>cR"] = {"<cmd> ExecutorToggleDetail <cr>", "Show Executor"},
    ["<leader>cx"] = {"<cmd> ExecutorReset <cr>", "Reset Executor"},
  }
}

return M
