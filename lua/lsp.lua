local function enable_lsp_servers(servers)
  for _, server in ipairs(servers) do
    vim.lsp.enable(server)
  end
end

enable_lsp_servers({
  "lua_ls",
  "nixd",
  "gopls",
  "jsonls",
  "tsgo",
  "tailwindcss",
  "eslint",
  "gdscript",
  "harper_ls",
  "jdtls"
})

