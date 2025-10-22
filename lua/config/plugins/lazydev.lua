return {
  "folke/lazydev.nvim",
  enabled = require('nixCatsUtils').enableForCategory("lua"),
  cmd = { "LazyDev" },
  ft = "lua",
  opts = {
    library = {
      { words = { "nixCats" }, path = (nixCats.nixCatsPath or "") .. '/lua' },
    },
  },
}
