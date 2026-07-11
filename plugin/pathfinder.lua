vim.pack.add({
  {
    src = "https://github.com/Aaron70/pathfinder.nvim", -- FIX: Change this to the original repository once the issue is solved
    version = "feat/support-go-doc-link"
  },
})

require("pathfinder").setup({
  open_mode = function(filepath, linenr, colnr)
    local win = vim.api.nvim_get_current_win()
    local cfg = vim.api.nvim_win_get_config(win)

    -- if we're inside a floating window (e.g. hover doc), escape it first
    if cfg.relative ~= "" then
      local parent = vim.fn.win_getid(vim.fn.winnr("#"))
      vim.api.nvim_win_close(win, true)
      if vim.api.nvim_win_is_valid(parent) then
        vim.api.nvim_set_current_win(parent)
      end
    end

    -- replicate default "edit" behavior: :edit [+linenr] filepath
    if linenr then
      vim.cmd(("edit +%d %s"):format(linenr, vim.fn.fnameescape(filepath)))
    else
      vim.cmd.edit(vim.fn.fnameescape(filepath))
    end

    if colnr then
      vim.api.nvim_win_set_cursor(0, { linenr or 1, colnr })
    end
  end,
})
