local ensure_installed = {
  "stylua", -- Used to format Lua code
  "lua-language-server",
  -- Go
  "delve",
  "gopls",
  "gofumpt",
  "golines",
  "goimports-reviser",
  -- Java
  "jdtls",
  -- "java-debug-adapter",
  -- "java-test",
  -- "cucumber_language_server",
}

function SetupFormatOnSave()
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)

      if not client then
        return
      end

      ---@diagnostic disable-next-line: param-type-mismatch
      if client.supports_method("textDocument/formatting", {}) then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = args.buf,
          callback = function()
            vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
          end,
        })
      end
    end,
  })
end

return {
  {
    "neovim/nvim-lsp",
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { "williamboman/mason.nvim",                  config = true },
      -- "williamboman/mason-lspconfig.nvim",
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
      -- { "j-hui/fidget.nvim", opts = {} },
      -- "hrsh7th/cmp-nvim-lsp",
      --
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      { 'saghen/blink.cmp' }
    },
    opts = {
      servers = {
        lua_ls = {},
        gopls = {},
        jsonls = {},
        yamlls = {}
      }
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config or {})
      end
      require("mason").setup()
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      SetupFormatOnSave()
    end,
  },
}
