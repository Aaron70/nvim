local config = {
  trigger_snippets = ';',
  border = 'rounded'
}
return {
  {
    'saghen/blink.cmp',
    enabled = true,
    dependencies = 'rafamadriz/friendly-snippets',

    version = '*',
    opts = {
      keymap = {
        preset = 'default',
        ['<CR>'] = { "accept", "fallback" },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      cmdline = {
        enabled = true,
        keymap = {
          ['enter'] = { "accept_and_enter", "fallback" },
          ['esc'] = { "cancel", "fallback" }
        }
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          -- Thanks to: https://github.com/linkarzu/dotfiles-latest/blob/main/neovim/neobean/lua/plugins/blink-cmp.lua
          snippets = {
            name = "snippets",
            enabled = true,
            max_items = 15,
            min_keyword_length = 2,
            module = "blink.cmp.sources.snippets",
            score_offset = 85, -- the higher the number, the higher the priority
            -- Only show snippets if I type the trigger_text characters, so
            -- to expand the "bash" snippet, if the trigger_text is ";" I have to
            should_show_items = function()
              local col = vim.api.nvim_win_get_cursor(0)[2]
              local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
              return before_cursor:match(config.trigger_snippets .. "%w*$") ~= nil
            end,
            -- After accepting the completion, delete the trigger_text characters
            -- from the final inserted text
            transform_items = function(_, items)
              local col = vim.api.nvim_win_get_cursor(0)[2]
              local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
              local trigger_pos = before_cursor:find(config.trigger_snippets .. "[^" .. config.trigger_snippets .. "]*$")
              if trigger_pos then
                for _, item in ipairs(items) do
                  item.textEdit = {
                    newText = item.insertText or item.label,
                    range = {
                      start = { line = vim.fn.line(".") - 1, character = trigger_pos - 1 },
                      ["end"] = { line = vim.fn.line(".") - 1, character = col },
                    },
                  }
                end
              end
              -- NOTE: After the transformation, I have to reload the luasnip source
              -- Otherwise really crazy shit happens and I spent way too much time
              -- figurig this out
              vim.schedule(function()
                require("blink.cmp").reload("snippets")
              end)
              return items
            end,
          }
        }
      },
      completion = {
        list = {
          selection = { preselect = false, auto_insert = false },
        },
        menu = {
          border = config.border,
          draw = {
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" }, { "source_name" } },
            treesitter = { 'lsp' },
          }
        },
        documentation = {
          window = { border = config.border },
          auto_show = true,
        },
        ghost_text = {
          enabled = true
        }
      },
      signature = { enabled = true, window = { border = config.border } }
    },
    opts_extend = { "sources.default" }
  }
}
