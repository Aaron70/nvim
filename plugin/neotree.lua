vim.pack.add({
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim' },
  -- Dependencies
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
})

local function open_grug_far(prefills)
  local grug_far = require("grug-far")

  if not grug_far.has_instance("explorer") then
    grug_far.open({ instanceName = "explorer" })
  else
    grug_far.get_instance('explorer'):open()
  end
  -- doing it seperately because multiple paths doesn't open work when passed with open
  -- updating the prefills without clearing the search and other fields
  vim.schedule(function()
    grug_far.get_instance('explorer'):update_input_values(prefills, true)
  end)
end

vim.keymap.set("n", "\\", ":Neotree reveal<CR>", { desc = 'NeoTree reveal', silent = true })
require("neo-tree").setup({
  commands = {
    -- create a new neo-tree command
    grug_far_replace = function(state)
      local node = state.tree:get_node()
      local prefills = {
        -- also escape the paths if space is there
        -- if you want files to be selected, use ':p' only, see filename-modifiers
        paths = vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":p"))
        -- paths = node.type == "directory" and vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":p"))
        --     or vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":h")),
      }
      open_grug_far(prefills)
      local cmds = require("neo-tree.sources.filesystem.commands")
      cmds.close_window(state)
    end,
    -- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/fbb631e818f48591d0c3a590817003d36d0de691/doc/neo-tree.txt#L535
    grug_far_replace_visual = function(state, selected_nodes, callback)
      local paths = {}
      for _, node in pairs(selected_nodes) do
        -- also escape the paths if space is there
        -- if you want files to be selected, use ':p' only, see filename-modifiers
        -- local path = node.type == "directory" and vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":p"))
        --     or vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":h"))
        local path = vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":p"))
        table.insert(paths, path)
      end
      local prefills = { paths = table.concat(paths, "\n") }
      open_grug_far(prefills)
      local cmds = require("neo-tree.sources.filesystem.commands")
      cmds.close_window(state)
    end,
  },
  window = {
    mappings = {
      -- map our new command to z
      z = "grug_far_replace",
    },
  },
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
