return {
  'MeanderingProgrammer/render-markdown.nvim',
  enabled = require('nixCatsUtils').enableForCategory("optionals.default"),
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  opts = {
    completions = { lsp = { enabled = true } },
  },
  config = function(_)
    vim.g.markdown_recommended_style = 0
  end
}
