local registry = {}

local M = {}
-- All mappings should be called through this wrapper
-- in order to register custom mappings
-- args:
--   [1] - [4]        - Args to vim.keymap.set
--   descr (optional) - Mapping description
M.add_mapping = function(args)
  vim.keymap.set(unpack(args))
  table.insert(registry, args)
end

M.normal = function(args)
  table.insert(args, 1, "n")
  M.add_mapping(args)
end

M.visual = function(args)
  table.insert(args, 1, "v")
  M.add_mapping(args)
end

M.insert = function(args)
  table.insert(args, 1, "i")
  M.add_mapping(args)
end

M.get_all_mappings = function()
  return { unpack(registry) }
end

return M
