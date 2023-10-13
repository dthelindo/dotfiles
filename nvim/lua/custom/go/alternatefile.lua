local M = {}

function is_test_file()
  local cur_file = vim.fn.expand("%")
  if #cur_file <= 1 then
    vim.notify("No file found", vim.log.levels.ERROR)
    return
  end
  local is_test_file = string.find(cur_file, "_test%.go$")
  return cur_file, is_test_file
end

function M.go_to_alternate()
  local cur_file, is_test_file = is_test_file()
  local alt_file = cur_file

  if is_test_file then
    alt_file = string.gsub(cur_file, "_test.go", ".go")
  elseif string.find(cur_file, "%.go$") then
    alt_file = string.gsub(cur_file, ".go", "_test.go")
  else 
    vim.notify("Current file is not a Go file", vim.log.levels.ERROR)
    return
  end

  local file_exists = vim.fn.filereadable(alt_file) or vim.fn.bufexists(alt_file) 
  if not file_exists then
    vim.notify("Alternate file does not exist", vim.log.levels.ERROR)
    return
  else
    vim.cmd("e " .. alt_file)
  end
end

return M
