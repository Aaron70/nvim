return {
  "folke/lazydev.nvim",
  enabled = require('nixCatsUtils').enableForCategory("lua"),
  cmd = { "LazyDev" },
  ft = "lua",
  opts = {
    library = {
      "nvim-dap-ui",
      { words = { "nixCats" }, path = (nixCats.nixCatsPath or "") .. '/lua' },
    },
  },
}
