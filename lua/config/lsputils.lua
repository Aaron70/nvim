local M = {}

function M.enableLspConfigurations(configs)
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

function M.onAttach(_, bufnr)
  -- we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.

  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  -- nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gd', function () require('telescope.builtin').lsp_definitions() end, '[G]oto [D]efinition')
  nmap('gr', function() require('telescope.builtin').lsp_references() end, '[G]oto [R]eferences')
  nmap('gI', function() require('telescope.builtin').lsp_implementations() end, '[G]oto [I]mplementation')
  nmap('<leader>ds', function() require('telescope.builtin').lsp_document_symbols() end, '[D]ocument [S]ymbols')
  nmap('<leader>ws', function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end, '[W]orkspace [S]ymbols')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')


  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

end

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

return M
