vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

local conform = require("conform")
vim.keymap.set({ "n", "v" }, "<leader>FF", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "[F]ormat [F]ile" })
