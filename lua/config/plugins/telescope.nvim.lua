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

      local set = vim.keymap.set
      -- Keymaps
      set("n", "<space>sg", require('config.telescope.multigrep').live_multigrep, { desc = "[S]earch [G]rep" })
      set("n", "<space>s.", require('telescope.builtin').oldfiles, { desc = "[S]earch [.]Recents" })
      set("n", "<space>sr", require('telescope.builtin').resume, { desc = "[S]earch [R]esume" })
      set("n", "<space>sf", require('telescope.builtin').find_files, { desc = "[S]earch [F]iles" })
      set("n", "<space>sh", require('telescope.builtin').help_tags, { desc = "[S]earch [H]elp Tags" })
      set("n", "<space>sn", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end, { desc = "[S]earch [N]eovim" })
      set("n", "<space>sm", function()
        require('telescope.builtin').lsp_document_symbols({ symbols = { 'function', 'method' } })
      end, { desc = "[S]earch [M]ethods" })
    end
  }
}
