return {
  'neo-tree.nvim',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  after = function (_)
    require("neo-tree").setup({
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
    })
  end,
}
