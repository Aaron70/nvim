return {
  "kdheepak/lazygit.nvim",
  enabled = require('nixCatsUtils').enableForCategory("optionals.default"),
  lazy = true,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "[l]azy[g]it" }
  }
}
