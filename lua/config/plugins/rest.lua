return {
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>Rr", "<cmd>Rest run<CR>" , mode = { "n" }, desc = '[R]est [r]un', },
    { "<leader>Ro", "<cmd>Rest open<CR>" , mode = { "n" }, desc = '[R]est [o]pen', },
    { "<leader>Re", "<cmd>Rest env select<CR>" , mode = { "n" }, desc = '[R]est [e]nv select', },
  }
}
