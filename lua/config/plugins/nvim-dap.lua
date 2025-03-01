return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- { "igorlfs/nvim-dap-view", opts = {} }
    }
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
    opts = {}
  },
  {
    "LiadOz/nvim-dap-repl-highlights",
    opts = {}
  },

  -- GO
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {}
  },

}
