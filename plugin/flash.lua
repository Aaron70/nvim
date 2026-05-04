vim.pack.add({
  { src = "https://github.com/folke/flash.nvim" },
})

local flash = require("flash")

vim.keymap.set({ "n", "x", "o" }, "<leader>f", function() flash.jump() end, { desc = "[F]lash" })
vim.keymap.set({ "n", "x", "o" }, "<leader>Ft", function() flash.treesitter() end, { desc = "[F]lash [T]reesitter" })
vim.keymap.set("n", "<leader>Fr", function() flash.remote() end, { desc = "[F]lash [R]emote" })
vim.keymap.set("o", "r", function() flash.remote() end, { desc = "[F]lash [R]emote" })
vim.keymap.set({ "o", "x" }, "R", function() flash.treesitter_search() end, { desc = "Treesitter Search" })
vim.keymap.set("c", "<c-s>", function() flash.toggle() end, { desc = "Toggle Flash Search" })
