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
    statusline = {
        theme = "minimal",
        separator_style = "round",
        overriden_modules = nil,
    },
    transparency = true,
}

M.mappings = require "custom.mappings"

return M
