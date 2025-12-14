-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap.set

keymap("i", "jj", "<Esc>", { desc = "Escape insert mode" })
keymap({ "n", "v", "o" }, "B", "^", { desc = "Go to start of line" })
keymap({ "n", "v", "o" }, "E", "$", { desc = "Go to end of line" })
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })
keymap("x", "p", [["_dP]], { desc = "Paste without overwriting register" })
keymap("n", "<C-d>", "<C-d>zz", { desc = "Keep cursor centered when scrolling down" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Keep cursor centered when scrolling up" })
keymap("n", "<leader>cs", "1z=e", { desc = "Correct Spelling (first suggestion)" })
