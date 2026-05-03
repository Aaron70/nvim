vim.pack.add({
  { src = "https://github.com/rcarriga/nvim-notify" }
})

local notify = require("notify")

notify.setup({
  top_down = false,
  on_open = function(win)
    vim.api.nvim_win_set_config(win, { focusable = false })
  end,
})

vim.notify = notify

vim.keymap.set("n", "<Esc>", function()
  notify.dismiss({ silent = true })
  vim.cmd("noh")
end, { desc = "dismiss notify popup and clear hlsearch" })
