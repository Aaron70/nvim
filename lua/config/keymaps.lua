local notifier = require("snacks.notifier")
local set = vim.keymap.set
local leader = vim.g.mapleader

set("i", "jk", "<ESC>l")

-- Save file
set({ "n", "v" }, "<C-s>", ":w<CR>")
set({ "i" }, "<C-s>", "<ESC>:w<CR>")

-- Yank to clipboard
set({ "n", "v" }, leader .. "y", '"+y')
set({ "n", "v" }, leader .. "p", '"+p')

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Notifications
set("n", leader .. "nh", function() notifier.show_history({}) end, { desc = "Show the notification history" })
