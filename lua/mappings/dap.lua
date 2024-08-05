local M = {}
local mappings = require("mappings")
local widgets = require("dap.ui.widgets")
local dap = require("dap")

local toggle_breakpoint = dap.toggle_breakpoint
local sidebar = widgets.sidebar(widgets.scopes)

DEBUG_MODE = "debug"

------------------------------------------------------------------------------------------
---                              |Functions for mappings|
------------------------------------------------------------------------------------------

local function open_sidebar()
  sidebar.open()
end

local function toggle_debug_mode()
  if Custom_mode() == NORMAL_MODE then
    if dap.session() ~= nil then
      Change_custome_mode(DEBUG_MODE)
    else
      dap.continue()
    end
  else
    Change_custome_mode(nil)
  end
end

local function close_debug_session()
  dap.close()
  sidebar.close()
  Change_custome_mode(nil)
end

local function open_debug_session()
  open_sidebar()
  Change_custome_mode(DEBUG_MODE)
end

dap.listeners.before['event_terminated']['remove_custome_mode'] = function (_,_)
  close_debug_session()
end

dap.listeners.after['event_initialized']['set_custome_mode'] = function (_,_)
  open_debug_session()
end

------------------------------------------------------------------------------------------
---                                    |Mappings|
------------------------------------------------------------------------------------------

function M.load_mappings()
  vim.schedule(function ()

    -- Mappings
    mappings.map("n", "<leader>db", toggle_breakpoint, { desc = "Toggle a breakpoint on current line."})
    mappings.map("n", "<leader>dd", dap.continue, { desc = "Change to debug mode."})

    -- Conditional Mappings
    mappings.ccmap("n", "b", toggle_breakpoint, DEBUG_MODE, { desc = "Toogle a breakpoint in debug mode." })
    mappings.ccmap("n", "<leader>us", open_sidebar, DEBUG_MODE, { desc = "Open debugging sidebar."})
    mappings.ccmap("n", "<leader>s", dap.continue, DEBUG_MODE, { desc = "Start/Continue debugging."})
    mappings.ccmap("n", "<leader>c", close_debug_session, DEBUG_MODE, { desc = "Close debugging session."})
    mappings.ccmap("n", "<C-j>", dap.step_over, DEBUG_MODE, { desc = "Step over"})
    mappings.ccmap("n", "<C-k>", dap.step_into, DEBUG_MODE, { desc = "Step into"})
    mappings.ccmap("n", "<C-l>", dap.step_out, DEBUG_MODE, { desc = "Step out"})
    mappings.ccmap("n", "<C-;>", dap.run_to_cursor, DEBUG_MODE, { desc = "Run to cursor"})

  end)
end

return M
