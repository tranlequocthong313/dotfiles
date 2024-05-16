require "nvchad.mappings"

local map = vim.keymap.set

-- Lazy & Mason --
map("n", "<leader>ls", "<CMD>Lazy show<CR>", { desc = "Lazy show" })
map("n", "<leader>ms", "<CMD>Mason<CR>", { desc = "Mason" })

-- TMUX NAVIGATOR --
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })

-- REFACTORING --
map("x", "<leader>re", ":Refactor extract ", { desc = "Extract function" })
map("x", "<leader>rf", ":Refactor extract_to_file ", { desc = "Extract function to new file" })
map("x", "<leader>rv", ":Refactor extract_var ", { desc = "Extract variable" })
map({ "n", "x" }, "<leader>ri", ":Refactor inline_var", { desc = "Extract inline variable" })
map("n", "<leader>rI", ":Refactor inline_func", { desc = "Extract inline function" })
map("n", "<leader>rb", ":Refactor extract_block", { desc = "Extract block" })
map("n", "<leader>rbf", ":Refactor extract_block_to_file", { desc = "Extract block to new file" })

-- TELESCOPE --
map("n", "<C-p>", require("telescope.builtin").git_files, { desc = "Find all files in git repository" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted blocks go down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted blocks go up" })

-- TODO-COMMENT --
map("n", "<leader>ft", "<CMD>TodoTelescope<CR>", { desc = "Todo Telescope" })

-- SILICON --
map("v", "<leader>cs", ":Silicon<CR>", { desc = "Code Snap" })

-- CMDLINE --
-- map("n", ":", "<cmd>FineCmdline<CR>", { desc = "CmdLine" })

-- TABUFLINE --
-- local function moveLeft()
--     require("nvchad.tabufline").move_buf(-1)
-- end
-- local function moveRight()
--     require("nvchad.tabufline").move_buf(1)
-- end
-- map("n", "<M-j>", moveLeft, { desc = "Move buffer to left" })
-- map("n", "<M-l>", moveRight, { desc = "Move buffer to right" })
map("n", "<leader>xz", require("nvchad.tabufline").closeAllBufs, { desc = "Close all buffers" })

-- NON PLUGIN --
map("n", "<C-d>", "<C-d>zz", { desc = "Jump down half of the file and vertical center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Jump up half of the file and vertical center" })
map("n", "n", "nzzzv", { desc = "Jump to next searched text " })
map("n", "N", "Nzzzv", { desc = "Jump to next searched text " })

map("x", "<leader>p", [["_dP]], { desc = "Paste without replace current text" })

map("i", "jj", "<ESC>", { desc = "Back to normal mode" })

map(
    "n",
    "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Change all similiar texts same as current text" }
)

-- for i = 1, 9, 1 do
--   vim.keymap.set("n", string.format("<A-%s>", i), function()
--     vim.api.nvim_set_current_buf(vim.t.bufs[i])
--   end)
-- end
