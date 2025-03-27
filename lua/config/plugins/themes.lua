return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 9999,
    opts = {},
    config = function()
      vim.cmd.colorscheme("tokyonight-moon")
    end,
  },
}
