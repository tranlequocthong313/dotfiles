---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "gruvbox",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

return vim.tbl_deep_extend("force", M, require "custom.chadrc")
