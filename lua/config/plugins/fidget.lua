local function show_fidget_history_buf(fidget)
    local history_items = fidget.notification.get_history()

    if not history_items or #history_items == 0 then
        vim.notify("No fidget history available", vim.log.levels.WARN)
        return
    end

    -- Create buffer
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_set_option_value("buftype", "nofile", { buf = buf })
    vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })
    vim.api.nvim_set_option_value("modifiable", false, { buf = buf })

    local lines = { "=== Fidget Notification History ===", "" }

    for _, item in ipairs(history_items) do
        local timestamp = vim.fn.strftime("%c", item.last_updated)
        local group_part = item.group_name and (" " .. item.group_name) or ""
        local annote_part = item.annote and (" [" .. item.annote .. "]") or ""

        table.insert(lines, timestamp .. group_part .. " |" .. annote_part)

        -- Handle multiline messages
        for msg_line in vim.gsplit(item.message, "\n", { plain = true, trimempty = false }) do
            table.insert(lines, "  " .. msg_line)
        end
        table.insert(lines, "")
    end

    vim.api.nvim_set_option_value("modifiable", true, { buf = buf })
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.api.nvim_set_option_value("modifiable", false, { buf = buf })

    vim.cmd("split")
    vim.api.nvim_win_set_buf(0, buf)
    vim.api.nvim_buf_set_name(buf, "fidget://history")

    local opts = { buffer = buf, noremap = true, silent = true }
    vim.keymap.set("n", "q", "<cmd>close<cr>", opts)
    vim.keymap.set("n", "<esc>", "<cmd>close<cr>", opts)
end


return {
  "j-hui/fidget.nvim",
  enabled = require('nixCatsUtils').enableForCategory("essentials.optionals"),
  event = "UIEnter",
  keys = {
      { "<leader>sm", function() require("telescope").extensions.fidget.fidget() end , mode = { "n" }, desc = '[S]earch [M]essage', },
      { "<leader>sM", function() show_fidget_history_buf(require("fidget")) end , mode = { "n" }, desc = '[S]earch [M]essage on a new buffer', },
  },
  opts = {
    notification = {
      override_vim_notify = true;
    };
  }
}
