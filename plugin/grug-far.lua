vim.pack.add({
  { src = "https://github.com/MagicDuck/grug-far.nvim" },
})

local grug = require('grug-far')
grug.setup({
})

vim.keymap.set("n", "<leader>r", function() grug.open() end, { desc = 'Open Search and Replace' })
vim.keymap.set("v", "<leader>r", function() grug.with_visual_selection() end, { desc = 'Open Search and Replace' })
