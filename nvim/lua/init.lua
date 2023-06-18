buzConfigBasePath = vim.g.config_root

-- Does not works with ~/... path on windows
dofile(buzConfigBasePath .. '/lua/telescope_init.lua')
dofile(buzConfigBasePath .. '/lua/lsp_init.lua')
dofile(buzConfigBasePath .. '/lua/autocomplete_init.lua')
dofile(buzConfigBasePath .. '/lua/debugging.lua')

-- Grep only in filtered files
local GrepWithFileFilter = function()
  local pattern = ""
  vim.ui.input(
    { prompt = 'Enter path pattern (e.g. "*.{h,cpp}" or empty): ' },
    function(input) pattern = input end
  )
  if pattern == '' then
    pattern = '*'
  end
  require('telescope.builtin').live_grep({
    glob_pattern = pattern,
    disable_coordinates = true
  })
end
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Leader>fg', GrepWithFileFilter, opts)

-- Execute selected text as lua code
local GetLastSelection = function()
  local beg_char_pos = vim.fn.getpos("'<")
  local end_char_pos = vim.fn.getpos("'>")
  local n_lines = math.abs(end_char_pos[2] - beg_char_pos[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, beg_char_pos[2] - 1, end_char_pos[2], false)

  local res = ""
  for _, line in ipairs(lines) do
    res = res .. line .. "\n"
  end

  return res
end

vim.api.nvim_create_user_command(
  'ExecuteSelectionAsLua',
  function(opts)
    local code = GetLastSelection()
    local compiled, message = loadstring(code)
    if compiled then compiled() end
  end, {
    desc = "Executes currently/last selected code as lua"
  }
)

