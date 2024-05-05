local plugins = {}

return vim.tbl_deep_extend("force", plugins, require "custom.plugins")
