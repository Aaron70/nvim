return {
  'nvim-lualine/lualine.nvim',
  enabled = require('nixCatsUtils').enableForCategory("essentials.optionals"),
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = "UIEnter",
  opts = {
    options = {
      icons_enabled = true,
      theme = vim.g.colors_name,
      component_separators = '|',
      section_separators = '',
    },
    sections = {
      lualine_c = {
        {
          'filename', path = 1, status = true,
        },
      },
    },
    inactive_sections = {
      lualine_b = {
        {
          'filename', path = 3, status = true,
        },
      },
      lualine_x = { 'filetype' },
    },
    -- tabline = {
    --   lualine_a = { 'buffers' },
    --   -- if you use lualine-lsp-progress
    --   -- lualine_b = { 'lsp_progress', },
    --   lualine_z = { 'tabs' }
    -- },
  },
}
