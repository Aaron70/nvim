vim.pack.add({
  { src = "https://github.com/kevinhwang91/nvim-ufo" },
  { src = "https://github.com/kevinhwang91/promise-async" },
})

local ufo = require('ufo')

vim.keymap.set('n', 'zR', ufo.openAllFolds)
vim.keymap.set('n', 'zM', ufo.closeAllFolds)

ufo.setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end
})

-- Disable and enable folding on the buffers (filetype) defined by the disabled table
local ufo_enabled = true
vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    local ft = vim.bo.filetype
    local disabled = { ["neo-tree"] = true, ["lazy"] = true, ["mason"] = true, ["help"] = true }
    if disabled[ft] and ufo_enabled then
      vim.wo.foldcolumn = "0"
      require("ufo").disable()
      ufo_enabled = false
    elseif not disabled[ft] and not ufo_enabled then
      vim.wo.foldcolumn = "1"
      require("ufo").enable()
      ufo_enabled = true
    end
  end,
})
