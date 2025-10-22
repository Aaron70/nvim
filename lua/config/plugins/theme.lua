return {
  {
    "folke/tokyonight.nvim",
    enabled = require('nixCatsUtils').enableForCategory("themer") and Colorscheme == "tokyonight",
    lazy = false,
    priority = 1000,
    opts = {},
  }
}
