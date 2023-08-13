return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    keys = {
      {
        "<leader>dt",
        function()
          require("dap").toggle_breakpoint()
        end,
        "Toggle Breakpoint",
      },
    },
  },
}
