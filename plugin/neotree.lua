vim.pack.add({
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim' },
  -- Dependencies
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
})

vim.keymap.set("n", "\\", ":Neotree reveal<CR>", { desc = 'NeoTree reveal', silent = true })
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
      handler = function(_)
        require "neo-tree.command".execute({
          action = "close"
        })
      end,
    }
  }
})
