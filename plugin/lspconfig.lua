vim.pack.add({
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
})

local builtin = require('telescope.builtin')
local function smart_jump()
  local params = vim.lsp.util.make_position_params()

  vim.lsp.buf_request(0, 'textDocument/definition', params, function(err, result, ctx, config)
    if result and not vim.tbl_isempty(result) then
      builtin.lsp_definitions()
    else
      builtin.lsp_implementations()
    end
  end)
end


vim.keymap.set('n', 'gd', smart_jump, { desc = 'Go to Definition or Implementation' })

vim.keymap.set('n', 'grr', builtin.lsp_references, { desc = "Usage references" })
vim.keymap.set('n', 'gri', builtin.lsp_implementations, { desc = "Go to Implementations" })
vim.keymap.set('n', 'grs', builtin.lsp_document_symbols, { desc = "Go to Document Symbols" })

vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, { desc = "Open Code Actions" })
vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { desc = "Rename" })

