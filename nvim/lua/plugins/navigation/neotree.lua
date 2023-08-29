return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- enabled = false,
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = {
      -- close_if_last_window = false,
      -- window = {
      --   position = "float",
      -- },
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
      default_component_configs = {
        file_size = { enabled = false },
        type = { enabled = false },
        last_modified = { enabled = false },
      },
    },
  },
}
