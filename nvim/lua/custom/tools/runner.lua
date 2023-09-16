local M = {}

local notify = vim.notify
local loop = vim.loop

M.run = function()
  notify("Running check...")

  handle = loop.spawn(
    "echo",
    {},
    function (code, signal)
      notify(code)
      notify(signal)
      handle:close()
    end
  )
end

return M
