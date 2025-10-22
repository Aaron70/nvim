return {
  'MeanderingProgrammer/render-markdown.nvim',
  enabled = require('nixCatsUtils').enableForCategory("optionals.default"),
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  opts = {
    completions = { lsp = { enabled = true } },
  },
}
