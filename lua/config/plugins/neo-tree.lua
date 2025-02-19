return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
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
        handler = function(arg)
          require "neo-tree.command".execute({
            action = "close"
          })
        end,
      }
    }
  },
}
