vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/ThePrimeagen/harpoon",         version = "harpoon2" }
})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>ka", function() harpoon:list():add() end, { desc = "Add file to Harpoon" })
vim.keymap.set("n", "<leader>kl", function() toggle_telescope(harpoon:list()) end, { desc = "Show Harpooned files" })
vim.keymap.set("n", "<leader>kc", function() harpoon:list():clear() end, { desc = "Clear the Harpoon list" })

vim.keymap.set("n", "<leader>ku", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>ki", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>ko", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>kp", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<leader>kU", function() harpoon:list():replace_at(1) end)
vim.keymap.set("n", "<leader>kI", function() harpoon:list():replace_at(2) end)
vim.keymap.set("n", "<leader>kO", function() harpoon:list():replace_at(3) end)
vim.keymap.set("n", "<leader>kP", function() harpoon:list():replace_at(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>kn", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>kN", function() harpoon:list():next() end)
