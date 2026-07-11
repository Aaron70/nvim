vim.pack.add({
  {
    src = "https://github.com/Aaron70/pathfinder.nvim", -- FIX: Change this to the original repository once the issue is solved 
    version = "feat/support-go-doc-link"
  },
})

require("pathfinder").setup({})
