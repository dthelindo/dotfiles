---@type NvPluginSpec[]
local plugins = {

  require "custom.plug.ui".spec,
  require "custom.plug.lsp".spec,
  require "custom.plug.dap".spec,
  require "custom.plug.git".spec,
  require "custom.plug.test".spec,
  require "custom.plug.navigation".spec,
  require "custom.plug.lazy".spec,
  require "custom.plug.tools".spec,
  require "custom.go".spec
}

return plugins
