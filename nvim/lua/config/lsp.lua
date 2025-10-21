local catUtils = require('nixCatsUtils')
local lsputils = require('config.lsputils')


-- LSP configuration are located in the lsp folder
-- if there is no file for the respective lsp, then
-- the configuration provided by nvim-lspconfig will be used
lsputils.enableLspConfigurations({
  "lua_ls",
  { "nixd", enabled = catUtils.isNixCats and nixCats('nix') },
  { "nil_ls", enabled = not catUtils.isNixCats and nixCats('nix') },
  { "gopls", enabled = nixCats('go') },
  { "tsgo", enabled = nixCats('typescript') },
  { "tailwindcss", enabled = nixCats('typescript') },
  { "eslint", enabled = nixCats('typescript') },
  { "jsonls", enabled = nixCats('typescript') },
  { "gdscript", enabled = nixCats('gdscript') },
  { "harper_ls", enabled = nixCats('harper_ls')}
})

vim.lsp.config('*', {
  on_attach = lsputils.onAttach
})

