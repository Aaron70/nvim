require('options')
require('keymaps')
require('lsp')

require("vim._core.ui2").enable {
  enable = true,
  msg = { -- Options related to the message module.
    ---@type 'cmd'|'msg' Default message target, either in the
    ---cmdline or in a separate ephemeral message window.
    ---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
    ---or table mapping |ui-messages| kinds and triggers to a target.
    targets = "cmd",
    cmd = { -- Options related to messages in the cmdline window.
      height = 0.5, -- Maximum height while expanded for messages beyond 'cmdheight'.
    },
    dialog = { -- Options related to dialog window.
      height = 0.5, -- Maximum height.
    },
    msg = { -- Options related to msg window.
      height = 0.5, -- Maximum height.
      timeout = 4000, -- Time a message is visible in the message window.
    },
    pager = { -- Options related to message window.
      height = 0.5, -- Maximum height.
    },
  },
}

vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", { desc = "Show LSP Info", })
vim.api.nvim_create_user_command("LspRestart", "lsp restart", { desc = "Restart LSP", })
vim.api.nvim_create_user_command("LspLog", function(_)
  local state_path = vim.fn.stdpath("state")
  local log_path = vim.fs.joinpath(state_path, "lsp.log")
  vim.cmd(string.format("edit %s", log_path))
end, { desc = "Show LSP log", })
