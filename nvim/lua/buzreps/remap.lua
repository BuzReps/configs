local registry = {}

local M = {
  ignore_registry_ = false
}

M.ignore_registry = function(self, ignore)
  self.ignore_registry_ = ignore
end

-- All mappings should be called through this wrapper
-- in order to register custom mappings
-- args:
--   [1] - [4]        - Args to vim.keymap.set
--   descr (optional) - Mapping description
M.add_mapping = function(self, args)
  vim.keymap.set(unpack(args))
  if not self.ignore_registry_ then
    table.insert(registry, args)
  end
end

M.normal = function(args)
  table.insert(args, 1, "n")
  M:add_mapping(args)
end

M.visual = function(args)
  table.insert(args, 1, "v")
  M:add_mapping(args)
end

M.insert = function(args)
  table.insert(args, 1, "i")
  M:add_mapping(args)
end

M.terminal = function(args)
  table.insert(args, 1, "t")
  M:add_mapping(args)
end

M.get_all_mappings = function()
  return { unpack(registry) }
end

return M
