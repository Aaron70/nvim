local M = {}
local mappings = require("mappings")
local dap_go = require("dap-go")


------------------------------------------------------------------------------------------
---                              |Functions for mappings|
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
---                                    |Mappings|
------------------------------------------------------------------------------------------

function M.load_mappings()
  vim.schedule(function ()

    -- Mappings
    mappings.map("n", "<leader>dgt", dap_go.debug_test, { desc = "Debug nearest test." })
    mappings.map("n", "<leader>dgl", dap_go.debug_last_test, { desc = "Debug last test." })

  end)
end

return M


