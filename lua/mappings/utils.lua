local M = {
  conditional_mappings = {}
}

local cm = M.conditional_mappings
local feedkeys = vim.fn.feedkeys

NORMAL_MODE = "Normal"

M.conditional_mappings = {}
M.map = vim.keymap.set


function Show_custom_mode()
  print(string.format("Custom mode: %s", Custom_mode() or "No custom mode"))
end

function Custom_mode()
  return vim.g.custom_mode or NORMAL_MODE
end

function Change_custome_mode(mode)
  if mode == nil then
    mode = NORMAL_MODE
  end
  vim.g.custom_mode = mode
  --Show_custom_mode()
end

local function call_or_feed(value)
  if type(value) == "function" then
    return value()
  end
  return feedkeys(value, "n")
end

local function evaluate_conditional_mapping(default, actions)
  return function ()
    local action = actions[Custom_mode()]
    if action == nil then
      return call_or_feed(default)
    end
    return call_or_feed(action)
  end
end

function M.cmap(mode, lhs, rhs, action, custom_mode, opts)
  if cm[mode] == nil then
    cm[mode] = {}
  end

  if cm[mode][lhs] == nil then
    cm[mode][lhs] = { rhs = rhs, actions = {}, opts = { desc = "" } }
  end

  local actions_dict = cm[mode][lhs]["actions"]
  actions_dict[custom_mode] = action
  cm[mode][lhs]["actions"] = actions_dict

  if opts["desc"] ~= nil then
    local sep = ", "
    if cm[mode][lhs]["opts"]["desc"] == "" then
      sep = ""
    end
    local desc = string.format("%s%s: %s", sep, string.upper, opts["desc"])
    cm[mode][lhs]["opts"]["desc"] = cm[mode][lhs]["opts"]["desc"] .. desc
  end

  M.map(mode, lhs, evaluate_conditional_mapping(rhs,actions_dict), cm[mode][lhs]["opts"])
end


function M.ccmap(mode, lhs, action, c_mode, opts)
  if cm[mode] == nil then
    print(
      string.format(
        "The given conditional mappint doesn't exits, " ..
        "consider using M.cmap if this is the first action " ..
        "for the given conditional mapping. { %s = { %s = {...}}} for custom mode %s.",
        mode, lhs, c_mode
      )
    )
    return
  end

  if cm[mode][lhs] == nil then
    print(
      string.format(
        "The given conditional mappint doesn't exits, " ..
        "consider using M.cmap if this is the first action " ..
        "for the given conditional mapping. { %s = { %s = {...}}} for custom mode %s.",
        mode, lhs, c_mode
      )
    )
    return
  end

  if cm[mode][lhs]["rhs"] == nil then
    print(
      string.format(
        "The given conditional mappint doesn't have a default mapping, " ..
        "consider using M.cmap if this is the first action " ..
        "for the given conditional mapping. { %s = { %s = {...}}} for custom mode %s.",
        mode, lhs, c_mode
      )
    )
    return
  end

  local rhs = cm[mode][lhs]["rhs"]
  local actions_dict = cm[mode][lhs]["actions"]
  actions_dict[c_mode] = action
  cm[mode][lhs]["actions"] = actions_dict

  if opts["desc"] ~= nil then
    local sep = ", "
    if cm[mode][lhs]["opts"]["desc"] == "" then
      sep = ""
    end
    local desc = string.format("%s%s: %s", sep, string.upper, opts["desc"])
    cm[mode][lhs]["opts"]["desc"] = cm[mode][lhs]["opts"]["desc"] .. desc
  end

  M.map(mode, lhs, evaluate_conditional_mapping(rhs,actions_dict), cm[mode][lhs]["opts"])
end


return M

