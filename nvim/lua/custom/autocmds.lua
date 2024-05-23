local autocmd = vim.api.nvim_create_autocmd

local function set_colorcolumn()
    local ft = vim.bo.filetype
    if ft == "python" then
        vim.opt.colorcolumn = "88"
    elseif ft == "javascript" or ft == "javascriptreact" or ft == "typescript" or ft == "typescriptreact" then
        vim.opt.colorcolumn = "120"
    else
        vim.opt.colorcolumn = "0"
    end
end

autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = "*",
    callback = set_colorcolumn,
})

autocmd("VimEnter", {
    callback = function()
        -- vim.cmd "Dashboard"

        for i = 1, 9, 1 do
            vim.keymap.set("n", string.format("<A-%s>", i), function()
                vim.api.nvim_set_current_buf(vim.t.bufs[i])
            end)
        end
    end,
})

-- autocmd("BufReadPost", {
--   pattern = "*",
--   callback = function()
--     local line = vim.fn.line "'\""
--     if
--       line > 1
--       and line <= vim.fn.line "$"
--       and vim.bo.filetype ~= "commit"
--       and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
--     then
--       vim.cmd 'normal! g`"'
--     end
--   end,
-- })
