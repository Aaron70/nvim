vim.pack.add({
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

local gitsigns = require("gitsigns")

gitsigns.setup({
  current_line_blame = true,
})

-- Navigation
vim.keymap.set('n', ']c', function()
  if vim.wo.diff then
    vim.cmd.normal({ ']c', bang = true })
  else
    gitsigns.nav_hunk('next')
  end
end, { desc = "Next Hunk" })

vim.keymap.set('n', '[c', function()
  if vim.wo.diff then
    vim.cmd.normal({ '[c', bang = true })
  else
    gitsigns.nav_hunk('prev')
  end
end, { desc = "Prev Hunk" })

-- Actions
vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk, { desc = "[h]unk [s]tage" })
vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, { desc = "[h]unk [r]eset" })

vim.keymap.set('v', '<leader>hs', function()
  gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end, { desc = "[h]unk [s]tage" } )

vim.keymap.set('v', '<leader>hr', function()
  gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end, { desc = "[h]unk [r]eset" })

vim.keymap.set('n', '<leader>hS', gitsigns.stage_buffer, { desc = "Stage Buffer" })
vim.keymap.set('n', '<leader>hR', gitsigns.reset_buffer, { desc = "Reset buffer" })
vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, { desc = "[h]unk [p]review" })
vim.keymap.set('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = "[h]unk [i]nline preview" })

vim.keymap.set('n', '<leader>hb', function()
  gitsigns.blame_line({ full = true })
end, { desc = "[h]unk [b]lame" })

vim.keymap.set('n', '<leader>hd', gitsigns.diffthis, { desc = "[h]unk [d]iff" })

vim.keymap.set('n', '<leader>hD', function()
  gitsigns.diffthis('~')
end, { desc = "[h]unk [D]iff ~" })

vim.keymap.set('n', '<leader>hQ', function() gitsigns.setqflist('all') end, { desc = "[h]unk [Q]uickfix all" })
vim.keymap.set('n', '<leader>hq', gitsigns.setqflist, { desc = "[h]unk [q]uickfix" })

-- Toggles
vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "[t]oggle [b]lame" })
vim.keymap.set('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = "[t]oggle [w]ord diff" })

-- Text object
vim.keymap.set({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = "[i]n [h]unk" })
