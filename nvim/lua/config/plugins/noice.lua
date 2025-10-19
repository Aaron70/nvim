return {
  "folke/noice.nvim",
  enabled = require('nixCatsUtils').enableForCategory("essentials.optionals"),
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {}
}
