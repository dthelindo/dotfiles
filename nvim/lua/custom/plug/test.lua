
local M = {}

M.spec = {
  -- INFO: Test interaction framework
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      -- INFO: Golang test adapter
      "nvim-neotest/neotest-go",
    },
    event = "VeryLazy",
    opts = {
      adapters = {
        ["neotest-go"] = {
          -- Here we can set options for neotest-go, e.g.
          -- args = { "-tags=integration" }
          experimental = {
            test_table = true,
          },
        },
      },
      status = { virtual_text = true },
      output = { open_on_run = true },
    },
    config = function(_, opts)
      local neotest_ns = vim.api.nvim_create_namespace("neotest")
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            -- Replace newline and tab characters with space for more compact diagnostics
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)

      if opts.adapters then
        local adapters = {}
        for name, config in pairs(opts.adapters or {}) do
          if type(name) == "number" then
            if type(config) == "string" then
              config = require(config)
            end
            adapters[#adapters + 1] = config
          elseif config ~= false then
            local adapter = require(name)
            if type(config) == "table" and not vim.tbl_isempty(config) then
              local meta = getmetatable(adapter)
              if adapter.setup then
                adapter.setup(config)
              elseif meta and meta.__call then
                adapter(config)
              else
                error("Adapter " .. name .. " does not support setup")
              end
            end
            adapters[#adapters + 1] = adapter
          end
        end
        opts.adapters = adapters
      end

      require("neotest").setup(opts)
    end,
  },
}

M.mappings = {
  n = {
    ["<leader>tt"] = {function() require("neotest").run.run(vim.fn.expand("%")) end, "Test file"},
    ["<leader>tT"] = {function() require("neotest").run.run(vim.fn.getcwd()) end, "Test all"},
    ["<leader>tc"] = {function() require("neotest").run.run() end, "Test closest"},
    ["<leader>to"] = {function() require("neotest").output_panel.toggle() end, "Toggle output"},
    ["<leader>ts"] = {function() require("neotest").summary.toggle() end, "Toggle summary"},
  }
}

return M
