return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup {
        defaults = {
          path_display = { "smart" }
        },
        extensions = {
          fzf = {}
        }
      }
      require('telescope').load_extension('fzf')

      require("which-key").add({
        -- Keymaps
        { "<leader>s", group = "[S]earch" },
        { "<leader>sg", mode = "n", rhs = require('config.telescope.multigrep').live_multigrep, desc = "[G]rep" },
        { "<leader>s.", mode = "n", rhs = require('telescope.builtin').oldfiles, desc = "[.]Recents" },
        { "<leader>sr", mode = "n", rhs = require('telescope.builtin').resume, desc = "[R]esume" },
        { "<leader>sf", mode = "n", rhs = require('telescope.builtin').find_files, desc = "[F]iles" },
        { "<leader>sh", mode = "n", rhs = require('telescope.builtin').help_tags, desc = "[H]elp Tags" },
        {
          "<leader>sn",
          mode = "n",
          rhs = function()
            require('telescope.builtin').find_files {
              cwd = vim.fn.stdpath("config")
            }
          end,
          desc = "[N]eovim files"
        },
        {
          "<leader>sm",
          mode = "n",
          rhs = function()
            require('telescope.builtin').lsp_document_symbols({ symbols = { 'function', 'method' } })
          end,
          desc = "[M]ethods"
        }
      })
    end
  }
}
