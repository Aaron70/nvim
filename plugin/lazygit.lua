vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/kdheepak/lazygit.nvim" },
})

vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "[l]azy[g]it" })
