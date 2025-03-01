return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "rcarriga/nvim-notify" }
    },
    config = function()
      require('telescope').setup {
        defaults = {
          path_display = { "smart" }
        },
        extensions = {
          fzf = {},
          notify = {},
          ui_select = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }
          }
        }
      }
      require('telescope').load_extension('fzf')
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("notify")


      local builtin = require("telescope.builtin")

      require("which-key").add({
        -- Notifications
        { "<leader>n", group = "[N]otifications" },
        { "<leader>nh", rhs = function() require("telescope").extensions.notify.notify() end, mode = "n", desc = "Show [H]istory" },
        -- { "<leader>nd", rhs = function() notifier.hide() end, mode = "n", desc = "[D]ismiss" },

        -- Keymaps
        { "<leader>s", group = "[S]earch" },
        { "<leader>sg", mode = "n", rhs = require('config.telescope.pickers').live_multigrep, desc = "[G]rep" },
        { "<leader>s.", mode = "n", rhs = builtin.oldfiles, desc = "[.]Recents" },
        { "<leader>sr", mode = "n", rhs = builtin.resume, desc = "[R]esume" },
        { "<leader>sf", mode = "n", rhs = builtin.find_files, desc = "[F]iles" },
        { "<leader>sh", mode = "n", rhs = builtin.help_tags, desc = "[H]elp Tags" },
        { "<leader>sd", mode = "n", rhs = builtin.diagnostics, desc = "[D]iagnostics" },
        { "<leader><leader>", mode = "n", rhs = builtin.buffers, desc = "[ ]Existing buffers" },
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
