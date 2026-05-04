vim.pack.add({
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})

require("render-markdown").setup({
  completions = { lsp = { enabled = true } },
  render_modes = true,
  code = { language_border = ' ', language_left = '', language_right = '', sign = false },
  pipe_table = { preset = 'round' },
  indent = { enabled = true, skip_heading = false, icon = ' ', sign = false },
  heading = { position = 'inline', left_pad = 1, sign = false },
})
