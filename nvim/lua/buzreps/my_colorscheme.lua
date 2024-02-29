-- See example how to config highlight groups from lua [here](https://github.com/rose-pine/neovim/blob/main/lua/rose-pine.lua)
-- See how nvim-treesitter highlight works `:h treesitter-highlight`
-- See how lsp highlighting works `:h lsp-semantic-highlight`
-- See default vscode dark theme colors [here](https://github.com/microsoft/vscode/blob/main/extensions/theme-defaults/themes/dark_vs.json)

-- nvim-treesitter highlight queries has a priority of 100

local M = {}

function M.enable(args)
  args = args or {}

  vim.opt.termguicolors = true
  if vim.g.colors_name then
    vim.cmd("hi clear")
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "buz_theme"

  local hi = function(name, val)
    -- Force links
    val.force = true
    -- Make sure that `cterm` attribute is not populated from `gui`
    val.cterm = val.cterm or {}
    -- Define global highlight
    vim.api.nvim_set_hl(0, name, val)
  end

  -- all groups from :h group-name:
  hi("Comment", { fg = "#6A9955" })       -- any comment

  hi("Constant", { fg = "" })             -- any constant
  hi("String", { fg = "#ce9178" })        -- a string constant: "this is a string"
  hi("Character", { fg = "" })            -- a character constant: 'c', '\n'
  hi("Number", { fg = "" })               -- a number constant: 234, 0xff
  hi("Boolean", { fg = "" })              -- a boolean constant: TRUE, false
  hi("Float", { fg = "" })                -- a floating point constant: 2.3e10

  hi("Identifier", { fg = "" })           -- any variable name
  hi("Function", { fg = "" })             -- function name (also: methods for classes)

  hi("Statement", { fg = "" })            -- any statement
  hi("Conditional", { link = "Keyword" }) -- if, then, else, endif, switch, etc.
  hi("Repeat", { fg = "" })               -- for, do, while, etc.
  hi("Label", { fg = "" })                -- case, default, etc.
  hi("Operator", { fg = "" })             -- "sizeof", "+", "*", etc.
  hi("Keyword", { fg = "#55899B" })       -- any other keyword
  hi("Exception", { fg = "" })            -- try, catch, throw

  hi("PreProc", { fg = "#52003d" })       -- generic Preprocessor
  hi("Include", { fg = "" })              -- preprocessor #include
  hi("Define", { fg = "" })               -- preprocessor #define
  hi("Macro", { fg = "" })                -- same as Define
  hi("PreCondit", { fg = "" })            -- preprocessor #if, #else, #endif, etc.

  hi("Type", { fg = "" })                 -- int, long, char, etc.
  hi("StorageClass", { fg = "" })         -- static, register, volatile, etc.
  hi("Structure", { fg = "" })            -- struct, union, enum, etc.
  hi("Typedef", { fg = "" })              -- a typedef

  hi("Special", { fg = "" })              -- any special symbol
  hi("SpecialChar", { fg = "" })          -- special character in a constant
  hi("Tag", { fg = "" })                  -- you can use CTRL-] on this
  hi("Delimiter", { fg = "" })            -- character that needs attention
  hi("SpecialComment", { fg = "" })       -- special things inside a comment
  hi("Debug", { fg = "" })                -- debugging statements

  hi("Underlined", { fg = "" })           -- text that stands out, HTML links

  hi("Ignore", { fg = "" })               -- left blank, hidden  |hl-Ignore|

  hi("Error", { fg = "" })                -- any erroneous construct

  hi("Todo", { fg = "" })                 -- anything that needs extra attention; mostly the
  hi("keywords", { fg = "" })             -- TODO FIXME and XXX

  hi("Added", { fg = "" })                -- added line in a diff
  hi("Changed", { fg = "" })              -- changed line in a diff
  hi("Removed", { fg = "" })              -- removed line in a diff

  -- Treesitter standard captures
  hi("@comment", { link = "Comment" })
  hi("@module", { fg = "gray51" }) -- namespaces
  hi("@variable.member", { fg = "Gold3" })
  hi("@variable.builtin", { link = "@keyword" })
  hi("@constant.builtin", { link = "@keyword" })
  hi("@property", { link = "@variable.member" }) -- struct pointer fields?
  hi("@string.escape", { link = "@string" })
  hi("@character", { link = "@string" })

  hi("@keyword.return", { fg = "Red" })
  hi("@keyword.conditional", { link = "Conditional" })
  hi("@keyword.directive", { link = "PreProc" })
  hi("@keyword.directive.define", { link = "@keyword.directive" })
  hi("@keyword.import", { link = "@keyword.directive" })
  hi("@function.macro", { link = "@keyword.directive" })
  hi("@function.builtin", { link = "@keyword" })

  hi("@keyword", { link = "Keyword" })
  hi("@operator", { link = "@keyword" })
  hi("@punctuation.delimiter", { link = "@keyword" })
  hi("@punctuation.bracket", { link = "@keyword" })
  hi("@type.builtin", { link = "@keyword" })
  hi("@type.qualifier", { link = "@keyword" })
  hi("@boolean", { link = "@keyword" })
  hi("@number", { link = "@keyword" })

  -- LSP semantic highlights. Works only with provided third-party LSP server
  hi("@lsp.type.macro", { link = "PreProc" })
  hi("@lsp.type.typeParameter", { fg = "Red" })
  hi("@lsp.type.enumMember", { link = "@lsp.mod.readonly" })
  -- hi("@lsp.mod.defaultLibrary", { link = "@keyword" })
  hi("@lsp.mod.readonly", { fg = "#AAFFAA" })
  hi("@lsp.typemod.method.readonly", { fg = "LightGreen" })
  hi("@lsp.typemod.property.classScope", { fg = "Gold3" })

  -- hi("@lsp.type.struct", { fg = "#1aff00" })
  -- hi("@lsp.type.class", { fg = "#eaff00" })
  -- hi("@lsp.type.method", { fg = "#fc9d03" })

  -- CMake specific
  hi("@constant.cmake", { link = "@keyword" })
  hi("@variable.cmake", { fg = "Pink" })
  hi("@punctuation.special.cmake", { fg = "Pink" })
end

return M
