vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" }
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*' },
  callback = function() pcall(vim.treesitter.start) end,
})

require('nvim-treesitter').setup()
