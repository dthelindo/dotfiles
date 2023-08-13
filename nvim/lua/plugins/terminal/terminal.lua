require("which-key").register({
  t = {
    name = "idk",
    t = { '<cmd>TermExec cmd="echo test"<cr>' },
  },
}, { prefix = "<leader>" })

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
  },
}
