require("silicon").setup {
  font = "JetbrainsMono Nerd Font=34;",
  theme = "OneHalfDark",
  background = nil,
  window_title = function()
    return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
  end,
  -- a string or function that defines the path to the output image
  output = function()
    return "~/Pictures/codes/" .. os.date "!%Y-%m-%dT%H-%M-%S" .. "_code.png"
  end,
}
