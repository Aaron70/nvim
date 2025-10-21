return {
  "stevearc/conform.nvim",
  enabled = require('nixCatsUtils').enableForCategory("formatter"),
  keys = {
    { "<leader>FF", desc = "[F]ormat [F]ile" },
  },
  opts = {
    formatters_by_ft = {
      -- NOTE: download some formatters in lspsAndRuntimeDeps
      -- and configure them here
      -- lua = { "stylua" },
      -- go = { "gofmt", "golint" },
      -- templ = { "templ" },
      -- Conform will run multiple formatters sequentially
      -- python = { "isort", "black" },
      -- Use a sub-list to run only the first available formatter
      -- javascript = { { "prettierd", "prettier" } },
    },
  },
  config = function(_)
    local conform = require("conform")
    vim.keymap.set({ "n", "v" }, "<leader>FF", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "[F]ormat [F]ile" })
  end,
}
