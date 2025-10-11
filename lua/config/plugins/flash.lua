return {
  "flash.nvim",
  keys = {
    { "<leader>f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "[F]lash" },
    { "<leader>Ft", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "[F]lash [T]reesitter" },
    { "<leader>Fr", mode = "n", function() require("flash").remote() end, desc = "[F]lash [R]emote" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "[F]lash [R]emote" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  }
}
