-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	callback = function()
-- 		vim.cmd("Nvdash")
-- 	end,
-- })

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("Dashboard")
	end,
})
