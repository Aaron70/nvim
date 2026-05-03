vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Use `:h <option>` to read about the option doc
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
-- Set completeopt to have a better completion experience
-- vim.o.completeopt = 'menu,preview,noselect'
vim.opt.completeopt = { 'menu', 'preview', 'fuzzy', 'menuone', 'noselect' }
vim.opt.mouse = 'a' -- allow the mouse to be used in nvim

-- Tab
local tabspaces = 2
vim.opt.tabstop = tabspaces     -- number of visual spaces per TAB
vim.opt.softtabstop = tabspaces -- number of spaces in tab when editing
vim.opt.shiftwidth = tabspaces  -- insert n spaces on a tab
vim.opt.expandtab = true        -- tabs are spaces, mainly because of Python
vim.o.smarttab = true
vim.opt.cpoptions:append('I')
vim.o.smartindent = true
vim.o.autoindent = true


-- UI config
vim.opt.number = true         -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true     -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true     -- open new vertical split bottom
vim.opt.splitright = true     -- open new horizontal splits right
vim.opt.termguicolors = true  -- enable 24-bit RGB color in the TUI
vim.opt.showmode = false      -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = true   -- highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Make line numbers default
vim.wo.number = true

-- stops line wrapping from being confusing
vim.o.breakindent = true
vim.o.linebreak = true
vim.o.textwidth = 0
vim.o.wrapmargin = 0
vim.o.wrap = true

-- Save undo history
vim.o.undofile = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'
vim.wo.relativenumber = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300


-- [[ Disable auto comment on enter ]]
-- See :help formatoptions
vim.api.nvim_create_autocmd("FileType", {
  desc = "remove formatoptions",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.g.netrw_liststyle = 0
vim.g.netrw_banner = 0

-- Fold
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.opt.fillchars = {
  -- fold = " ",
  foldopen = "", -- arrow for open fold
  foldclose = "", -- arrow for closed fold
  -- foldsep = " ",
  foldinner = " "
}
