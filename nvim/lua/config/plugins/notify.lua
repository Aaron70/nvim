local notify = require("notify")
return {
  "rcarriga/nvim-notify",
  enabled = require('nixCatsUtils').enableForCategory("essentials"),
  opts = {
    top_dow = false,
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { focusable = false })
    end,
  },
  keys = {
    { "<Esc>", function()
      notify.dismiss({ silent = true, })
      vim.cmd("noh")
    end, desc = "dismiss notify popup and clear hlsearch" }
  }
}
