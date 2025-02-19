require("config.opts")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")

-- TODO: Termporal keybindings
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ".lua<CR>")
vim.keymap.set("v", "<space>x", "lua<CR>")
