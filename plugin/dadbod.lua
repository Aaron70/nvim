vim.pack.add({
  { src = "https://github.com/tpope/vim-dadbod" },
  { src = "https://github.com/kristijanhusak/vim-dadbod-completion" },
  { src = "https://github.com/kristijanhusak/vim-dadbod-ui" }
})


local function db_connection_picker()
  local pickers = require('telescope.pickers')
  local finders = require('telescope.finders')
  local conf = require('telescope.config').values
  local actions = require('telescope.actions')
  local action_state = require('telescope.actions.state')

  -- dadbod-ui lazy-loads its autoload functions; force it to init if needed
  pcall(vim.fn['db_ui#init'])

  local ok, connections = pcall(vim.fn['db_ui#connections_list'])
  if not ok or vim.tbl_isempty(connections or {}) then
    vim.notify('No dadbod-ui connections available', vim.log.levels.WARN)
    return
  end

  pickers.new({}, {
    prompt_title = 'DB Connections',
    finder = finders.new_table({
      results = connections,
      entry_maker = function(conn)
        return {
          value = conn,
          display = string.format('%s  (%s)', conn.name, conn.source or 'unknown'),
          ordinal = conn.name,
        }
      end,
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if selection then
          vim.b.db = selection.value.url
          vim.notify('DB Connection set to ->' .. selection.value.name)
        end
      end)
      return true
    end,
  }):find()
end

vim.api.nvim_create_user_command('DBConnectionPicker', db_connection_picker, {})
vim.keymap.set('n', '<leader>dc', db_connection_picker, { desc = 'Pick DB connection' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sql',
  callback = function(args)
    vim.keymap.set({ 'n', 'v' }, '<leader>dx', function()
      -- only needed if this buffer wasn't opened via dbui
      if not vim.b.db then
        vim.schedule(function()
          vim.notify('No DB connection selected for this buffer', vim.log.levels.ERROR)
        end)
        return ''
      end
      return vim.fn['db#op_exec']()
    end, { expr = true, buffer = args.buf, desc = 'Execute a query' })
  end,
})
