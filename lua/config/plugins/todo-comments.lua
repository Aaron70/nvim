return {
  "folke/todo-comments.nvim",
  enabled = require('nixCatsUtils').enableForCategory("optionals.extra"),
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {}
}
