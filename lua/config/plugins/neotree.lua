return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = require('nixCatsUtils').enableForCategory("essentials"),
  lazy = false, -- neo-tree will lazily load itself
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
      },
      window = {
        position = 'right',
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function(_)
          require "neo-tree.command".execute({
            action = "close"
          })
        end,
      }
    }
  }
}
