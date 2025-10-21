local blinkEnabled = require('nixCatsUtils').enableForCategory("essentials.blink")
return {
  {
    "hrsh7th/cmp-cmdline",
    enabled = blinkEnabled,
    lazy = true,
  },
  {
    "saghen/blink.compat",
    enabled = blinkEnabled,
    dependencies = { "hrsh7th/cmp-cmdline" },
    lazy = true
  },
  {
    "L3MON4D3/LuaSnip",
    enabled = blinkEnabled,
    dependencies = { "saghen/blink.cmp" },
    event = "UIEnter",
    config = function(_)
      require("luasnip").setup({})
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
    keys = {
      {  "<M-n>", function()
        local ls = require('luasnip')
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, mode = {"i", "s" } }
    }
  },
  {
    "xzbdmw/colorful-menu.nvim",
    enabled = blinkEnabled,
    dependencies = { "saghen/blink.cmp" },
    event = "UIEnter",
  },
  {
    "saghen/blink.cmp",
    enabled = blinkEnabled,
    event = "UIEnter",
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- See :h blink-cmp-config-keymap for configuring keymaps
      keymap = {
        preset = 'default',
        ['<CR>'] = { 'accept', 'fallback' },
      },
      cmdline = {
        enabled = true,
        completion = {
          menu = {
            auto_show = true,
          },
        },
        sources = function()
          local type = vim.fn.getcmdtype()
          -- Search forward and backward
          if type == '/' or type == '?' then return { 'buffer' } end
          -- Commands
          if type == ':' or type == '@' then return { 'cmdline', 'cmp_cmdline' } end
          return {}
        end,
      },
      fuzzy = {
        sorts = {
          'exact',
          -- defaults
          'score',
          'sort_text',
        },
      },
      signature = {
        enabled = true,
        window = {
          show_documentation = true,
        },
      },
      completion = {
        menu = {
          draw = {
            treesitter = { 'lsp' },
            components = {
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
        documentation = {
          auto_show = true,
        },
      },
      snippets = {
        preset = 'luasnip',
        active = function(filter)
          local snippet = require "luasnip"
          local blink = require "blink.cmp"
          if snippet.in_snippet() and not blink.is_visible() then
            return true
          else
            if not snippet.in_snippet() and vim.fn.mode() == "n" then snippet.unlink_current() end
            return false
          end
        end,
      },
      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', 'omni' },
        providers = {
          path = {
            score_offset = 50,
          },
          lsp = {
            score_offset = 40,
          },
          snippets = {
            score_offset = 40,
          },
          cmp_cmdline = {
            name = 'cmp_cmdline',
            module = 'blink.compat.source',
            score_offset = -100,
            opts = {
              cmp_name = 'cmdline',
            },
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
    },
  }
}
