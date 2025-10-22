return {
  "mbbill/undotree",
  enabled = require('nixCatsUtils').enableForCategory("optionals"),
  cmd = { "UndotreeToggle", "UndotreeHide", "UndotreeShow", "UndotreeFocus", "UndotreePersistUndo", },
  keys = { { "<leader>U", "<cmd>UndotreeToggle<CR>", mode = { "n" }, desc = "Undo Tree" }, },
  init = function(_)
    vim.g.undotree_WindowLayout = 1
    vim.g.undotree_SplitWidth = 40
  end,
}
