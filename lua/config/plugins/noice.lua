return {
  "folke/noice.nvim",
  enabled = require('nixCatsUtils').enableForCategory("optionals"),
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    messages = {
      enabled = false;
    };
    notify = {
      enabled = false;
    };
  }
}
