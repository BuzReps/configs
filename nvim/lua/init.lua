buzConfigBasePath = vim.g.config_root

-- Does not works with ~/... path on windows
dofile(buzConfigBasePath .. '/lua/telescope_init.lua')
dofile(buzConfigBasePath .. '/lua/lsp_init.lua')
dofile(buzConfigBasePath .. '/lua/autocomplete_init.lua')
dofile(buzConfigBasePath .. '/lua/debugging.lua')

require("symbols-outline").setup({
  highlight_hovered_item = false,
  relative_width = false,
  width = 55,
  show_symbol_details = false,
  symbol_blacklist = {
    "Constructor",
  },
  symbols = {
    File = { icon = "file", hl = "@text.uri" },
    Module = { icon = "module", hl = "@namespace" },
    Namespace = { icon = "namespace", hl = "@namespace" },
    Package = { icon = "package", hl = "@namespace" },
    Class = { icon = "type", hl = "@type" },
    Method = { icon = "method", hl = "@method" },
    Property = { icon = "property", hl = "@method" },
    Field = { icon = "field", hl = "@field" },
    Constructor = { icon = "ctor", hl = "@constructor" },
    Enum = { icon = "enum", hl = "@type" },
    Interface = { icon = "interface", hl = "@type" },
    Function = { icon = "func", hl = "@function" },
    Variable = { icon = "var", hl = "@constant" },
    Constant = { icon = "const", hl = "@constant" },
    String = { icon = "str", hl = "@string" },
    Number = { icon = "num", hl = "@number" },
    Boolean = { icon = "bool", hl = "@boolean" },
    Array = { icon = "arr", hl = "@constant" },
    Object = { icon = "obj", hl = "@type" },
    Key = { icon = "key", hl = "@type" },
    Null = { icon = "", hl = "@type" },
    EnumMember = { icon = "const", hl = "@constant" },
    Struct = { icon = "type", hl = "@type" },
    Event = { icon = "event", hl = "@type" },
    Operator = { icon = "op", hl = "@operator" },
    TypeParameter = { icon = "param", hl = "@parameter" },
    Component = { icon = "component", hl = "@function" },
    Fragment = { icon = "fragment", hl = "@constant" },
  },
  fold_markers = { '→', '⬐' },
})

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

