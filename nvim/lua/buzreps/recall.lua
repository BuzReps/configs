local M = {}
local current_entry = {}
local ex_entries = {}
local window_commands = {}

M.refresh_recall_entry = function()
  local getters = {}
  getters[1] = function()
    local mappings = require("buzreps.remap").get_all_mappings()
    if #mappings == 0 then
      return 0
    end
    local mapping = mappings[math.random(1, #mappings)]
    local res = { text = mapping[2], descr = mapping.descr }
    if not res.descr and type(mapping[3]) == "string" then
      res.descr = mapping[3]
    end
    return res
  end
  getters[2] = function()
    return ex_entries[math.random(1, #ex_entries)]
  end
  getters[3] = function()
    return window_commands[math.random(1, #window_commands)]
  end
  current_entry = getters[math.random(1, #getters)]()
end

M.get_current_recall_entry = function()
  current_entry = current_entry or {}
  current_entry.text = current_entry.text or ""
  current_entry.descr = current_entry.descr or ""
  current_entry[vim.type_idx] = vim.types.dictionary
  return current_entry
end

-- See if the file exists
local file_exists = function(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- Get all lines from a file, returns an empty
-- list/table if the file does not exist
local read_lines = function(file)
  if not file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

local load_entries = function(filepath, out_table)
  local lines = read_lines(filepath)
  for line_num, line in pairs(lines) do
    for text, descr in string.gmatch(line, "(.*)\t+(.*)") do
      table.insert(out_table, { text = text, descr = descr })
    end
  end
  vim.print("Recaller: Read " .. #out_table .. " entries from " .. filepath)
end

local start_worker = function()
  local uv = require("luv")
  local update_timer = uv.new_timer()
  local refresh_time_sec = 60
  update_timer:start(0, refresh_time_sec * 1000, vim.schedule_wrap(function()
    M.refresh_recall_entry()
    vim.cmd("redrawstatus")
  end))
end

vim.api.nvim_create_user_command(
  'ShowRecallAnswer',
  function(opts)
    vim.print(current_entry.descr)
  end,
  { desc = "Prints the answer to current recall entry" }
)

local config_dir = vim.fn.stdpath("config")
load_entries(config_dir .. "/res/ex.txt", ex_entries)
load_entries(config_dir .. "/res/window.txt", window_commands)
start_worker()

return M
