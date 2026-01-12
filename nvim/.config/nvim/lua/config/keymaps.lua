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
keymap("n", "<leader>mb", "ciw****<esc>hP", { desc = "Bold word" })
keymap("n", "<leader>mB", function()
  local line = vim.api.nvim_get_current_line()
  local col = vim.fn.col(".")

  -- Find ** before cursor
  local start_pos = line:sub(1, col):find(".*%*%*")
  if not start_pos then
    return
  end

  -- Replace first ** before and first ** after cursor position
  local new_line = line:gsub("%*%*(.-)%*%*", "%1", 1)
  vim.api.nvim_set_current_line(new_line)
end, { desc = "Unbold word" })
-- below only works with Keychron remaps
keymap("n", "<F13>", "<C-w>h", { silent = true, desc = "Window: focus left" })
keymap("n", "<leader>ba", function()
  vim.cmd("%bd")
  Snacks.explorer.open()
end, { desc = "Delete All Buffers & Focus Tree" })
