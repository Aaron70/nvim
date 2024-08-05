local M = {}
local mappings = require("mappings")
local gopher = require("gopher")


------------------------------------------------------------------------------------------
---                              |Functions for mappings|
------------------------------------------------------------------------------------------

local addTags = function (type)
  return function ()
    vim.cmd.GoTagAdd(type)
  end
end

------------------------------------------------------------------------------------------
---                                    |Mappings|
------------------------------------------------------------------------------------------

function M.load_mappings()
  vim.schedule(function ()

    -- Mappings
    mappings.map("n", "<leader>gsj", addTags("json"), { desc = "Add json tags to struct fields" })
    mappings.map("n", "<leader>gsy", addTags("yaml"), { desc = "Add yaml tags to struct fields" })
    mappings.map("n", "<leader>gie", vim.cmd.GoIfErr, { desc = "Add yaml tags to struct fields" })

  end)
end

return M
