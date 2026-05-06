vim.pack.add({
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = vim.g.colors_name,
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { },
    lualine_c = { { 'filename', path = 1, status = true, }, },
  },
  inactive_sections = {
    lualine_a = { 'mode' },
    lualine_b = { },
    lualine_c = { { 'filename', path = 1, status = true, }, },
  },
})
