---@type ChadrcConfig
local M = {}

M.ui = {
  telescope = { style = "bordered" },
  term = {
    float = {
      width = 1,
      height = 1,
      border = "double",
    },
  },
}

M.mappings = require "custom.mappings"

return M
