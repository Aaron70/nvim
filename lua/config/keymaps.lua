require("which-key").add({
  { "jk", rhs = "<ESC>", mode = "i", hidden = true },


  -- Save file
  { cond = false, "<leader>w", rhs = ":w<CR>", mode = { "n", "v" }, desc = "[W]rite buffer" },


  -- Yank to clipboard
  { "<leader>y", rhs = '"+y', mode = { "v" }, desc = "[Y]ank to clipboard", hidden = true },
  { "<leader>yy", rhs = '"+yy', mode = { "n" }, desc = "[Y]ank line to clipboard", hidden = true },
  { "<leader>p", rhs = '"+p', mode = { "n", "v" }, desc = "[P]aste from clipboard", hidden = true },
  { "<leader>P", rhs = '"+P', mode = { "n", "v" }, desc = "[P]aste from clipboard (Before)", hidden = true },


  -- Clear highlights on search when pressing <Esc> in normal mode
  --  See `:help hlsearch`
  { "<Esc>", rhs = "<cmd>nohlsearch<CR>", hidden = true },


  -- Keybinds to make split navigation easier.
  --  Use CTRL+<hjkl> to switch between panes
  --  See `:help wincmd` for a list of all pane commands
  { "<C-h>", rhs = "<C-w><C-h>", mode = "n", desc = "Move focus to the left pane" },
  { "<C-l>", rhs = "<C-w><C-l>", mode = "n", desc = "Move focus to the right pane" },
  { "<C-j>", rhs = "<C-w><C-j>", mode = "n", desc = "Move focus to the down pane" },
  { "<C-k>", rhs = "<C-w><C-k>", mode = "n", desc = "Move focus to the up pane" },
  { "<C-h>", group = "Move focus to pane" },
})
