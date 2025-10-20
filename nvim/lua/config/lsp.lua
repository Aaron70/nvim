local catUtils = require('nixCatsUtils')
local function enableLspConfigurations(configs)
  for _, config in ipairs(configs) do
    if type(config) == "table" then
      local enabled = true
      if type(config.enabled) == "boolean" then
        enabled = config.enabled
      end
      vim.lsp.enable(config.name or config[1], enabled)
    else
      vim.lsp.enable(config)
    end
  end
end

enableLspConfigurations({
  "lua_ls",
  { "nixd", enabled = catUtils.isNixCats and nixCats('nix.lsp') }
})

-- local config_path = nixCats.configDir or vim.fn.stdpath("config")
-- local lsp_path = config_path .. "/lsp"
-- local lsp_files = vim.fn.readdir(lsp_path)
-- function EnableLspConfigurationsFromLspPath()
--   -- Probably there is a better way to do this, But this will be my approach for now
--   for _, lsp_file in ipairs(lsp_files) do
--     local lsp_name = vim.fn.fnamemodify(lsp_file, ":r")
--     -- This should be called just once so no need to cache file, I believe.
--     local lsp_config = dofile(lsp_path .. "/" .. lsp_file)
--     local lsp_enabled = true
--     if type(lsp_config.enabled) == "boolean" then
--       lsp_enabled = lsp_config.enabled
--     end
--     vim.lsp.enable(lsp_name, lsp_enabled)
--   end
-- end
