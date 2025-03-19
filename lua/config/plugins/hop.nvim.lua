return {
  {
    'smoka7/hop.nvim',
    version = '2.5.1',
    opts = {
      keys = 'etovxqpdygfblzhckisuran',
      multi_windows = true,
    },
    init = function()
      local prefix = '<leader>'
      local hop = require 'hop'
      local directions = require('hop.hint').HintDirection
      vim.keymap.set('', 'f', function()
        hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
      end, { remap = true })
      vim.keymap.set('', 'F', function()
        hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
      end, { remap = true })
      vim.keymap.set('', 't', function()
        hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
      end, { remap = true })
      vim.keymap.set('', 'T', function()
        hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
      end, { remap = true })

      vim.keymap.set('', prefix .. '/', function()
        hop.hint_patterns {}
      end, { desc = 'Hop to pattern, after cursor' })

      vim.keymap.set('', prefix .. 'w', function()
        hop.hint_words {}
      end, { desc = 'Hop to word' })

      vim.keymap.set('', prefix .. 'c', function()
        hop.hint_char1 {}
      end, { desc = 'Hop to word' })
    end,
  }
}
