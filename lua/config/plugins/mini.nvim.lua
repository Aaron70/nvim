return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
      require("mini.comment").setup({
        mappings = {
          comment = 'gc',
          comment_line = 'gcc',
          comment_visual = 'gc',
          textobject = 'gc',
        }
      })

      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
}
