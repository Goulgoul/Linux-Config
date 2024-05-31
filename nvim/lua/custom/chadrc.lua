---@type ChadrcConfig
local M = {}

M.ui = { 
  theme = 'one_light',
  theme_toggle = { "one_light", "one_light" },
  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    overriden_modules = nil,
  },

  transparency = false,
}

M.plugins = "custom.plugins"


return M
