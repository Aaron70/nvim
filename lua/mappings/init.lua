require "nvchad.mappings"

local M = require("mappings.utils")
local eval = vim.fn.eval
local feedkeys = vim.fn.feedkeys


------------------------------------------------------------------------------------------
---                              |Functions for mappings|
------------------------------------------------------------------------------------------

local function goto_normal_mode()
  Change_custome_mode(NORMAL_MODE)
  feedkeys(eval('"\\<ESC>"'), "n")
end

local function toggle_terminal(pos, id)
  return function ()
    require("nvchad.term").toggle { pos = pos, id = id }
  end
end


------------------------------------------------------------------------------------------
---                                    |Mappings|
------------------------------------------------------------------------------------------

M.map("i", "jk", goto_normal_mode, { desc = "Enter into normal mode"})
M.map("n", ";", ":", { desc = "CMD enter command mode" })
M.map({"n", "i", "v"}, "<C-s>", "<cmd> w <cr>", { desc = "Save current buffer." })
M.map("n", "<leader>sm", Show_custom_mode, { desc = "Show current custom mode." })

-- Terminal
M.map({"n"}, "<leader>h", toggle_terminal("sp", "htoggleterm"), { desc = "Toggle horizontal terminal" })
M.map({"n"}, "<leader>v", toggle_terminal("vsp", "vtoggleterm"), { desc = "Toggle vertical terminal" })

-- NvimTree
M.map("n", "<leader>e", vim.cmd.NvimTreeToggle, { desc = "nvimtree toggle window" })
M.map("n", "<C-n>", vim.cmd.NvimTreeFocus, { desc = "nvimtree focus window" })


------------------------------------------------------------------------------------------
---                               |Conditional Mappings|
--- You need to register here (for comodity) all the conditional mappings for first time,
--- to define the default behavior of the mapping with NORMAL_MODE
------------------------------------------------------------------------------------------

M.cmap("n", "b", "b", "b", NORMAL_MODE, {})
M.cmap("n", "<leader>us", "<leader>us", "<leader>us", NORMAL_MODE, {})
M.cmap("n", "<leader>s", "<leader>s", "<leader>s", NORMAL_MODE, {})
M.cmap("n", "<leader>s", "<leader>s", "<leader>s", NORMAL_MODE, {})
M.cmap("n", "<leader>c", "<leader>c", "<leader>c", NORMAL_MODE, {})
M.cmap("n", "<C-h>", eval('"\\<C-w>h"'), vim.cmd.TmuxNavigateLeft, NORMAL_MODE, { desc = "Move left the focus window"})
M.cmap("n", "<C-j>", eval('"\\<C-w>j"'), vim.cmd.TmuxNavigateDown, NORMAL_MODE, { desc = "Move down the focus window"})
M.cmap("n", "<C-k>", eval('"\\<C-w>k"'), vim.cmd.TmuxNavigateUp, NORMAL_MODE, { desc = "Move up the focus window"})
M.cmap("n", "<C-l>", eval('"\\<C-w>l"'), vim.cmd.TmuxNavigateRight, NORMAL_MODE, { desc = "Move left the focus window"})
M.cmap("n", "<C-;>", eval('"\\<C-w>;"'), eval('"\\<C-w>;"'), NORMAL_MODE, { desc = ""})



Change_custome_mode(nil)

return M
