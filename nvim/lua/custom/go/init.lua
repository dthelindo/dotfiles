local M = {}

require("custom.go.alternatefile")

vim.api.nvim_create_user_command("GoAlt", function()
  require("custom.go.alternatefile").go_to_alternate()
end, {})

M.spec = {}

M.mappings = {
  n = {
    ["<leader>T"] = {"<cmd> GoAlt <cr>", "Go: Toggle alt file"}
  }
}
return M
