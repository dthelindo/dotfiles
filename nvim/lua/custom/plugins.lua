---@type NvPluginSpec[]
local plugins = {

  -- TODO: create null-ls plugin spec
  -- require "custom.configs.null-ls",

  require "custom.plug.ui".spec,
  require "custom.plug.lsp".spec,
  require "custom.plug.dap".spec,
  require "custom.plug.git".spec,
  require "custom.plug.test".spec,
  require "custom.plug.navigation".spec,
  require "custom.plug.lazy".spec,
  require "custom.plug.tools".spec,
}

return plugins
