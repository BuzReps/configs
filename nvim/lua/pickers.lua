local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local config = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local builtin = require("telescope.builtin")

local P = {}

local excluded_patterns = {
  ".git/*", ".vs$", "vcpkg/*", "vcpkg_installed/*", "CMakeFiles/*",
  -- Images
  ".png$", ".jpg$", ".jpeg$", ".bmp$", ".ico$",
  -- Documents
  ".xls$", ".xlsx$",
  -- Archives
  ".zip$", ".rar$", ".tar$", ".gz$",
}

--[[
  Returns `true` if path points to an executable (or shared lib or any binary file), `false` otherwise.
  `path` should be safe for being placed in shell command
]]--
local function IsExecutable(path)

  --[[
    TODO Set size limit or use inodes instead of strings as key?
    TODO Save/load cache in "/tmp"? Hashed?
    TODO Possible bugs caused by relative paths against changed working directory.
    workaround 1: autocommand for dropping cache on "cd"?
    workaround 2: store full path
  ]]--
  _select_executable_cache = _select_executable_cache or setmetatable({}, {})

  if type(path) ~= "string" or #path == 0 then
    return false
  end

  if _select_executable_cache[path] ~= nil then
    print("Using cached " .. path .. ": " .. tostring(_select_executable_cache[path]))
    return _select_executable_cache[path] 
  end

  local output_file = io.popen(string.format("file --dereference --brief --mime-encoding %s", path))
  if not output_file then return false end
  local output = output_file:read("a")
  local ret = output_file:close()
  if not ret then return false end

  local is_executable = string.find(output, "^binary") ~= nil
  _select_executable_cache[path] = is_executable

  return is_executable
end

P.select_executable = function(opts)
  opts = opts or {}
  require('telescope.builtin').find_files({
    entry_maker = function(path)
      -- Telescope filters entries after entries creation, but mime checking on all files is TOO slow
      for _, v in ipairs(excluded_patterns) do
        if string.find(path, v) then
          return nil
        end
      end

      local default_entry_maker = require("telescope.make_entry").gen_from_file()
      local default_entry = default_entry_maker(path)
      return IsExecutable(path) and default_entry or nil
    end,
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        opts.on_apply(selection)
      end)
      return true
    end,
  })
end

return P

