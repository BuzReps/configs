require('rose-pine').setup({
  variant = "moon",
  dark_variant = "dawn", -- main, moon, or dawn
  styles = {
    bold = true,
    italic = false,
    transparency = true,
  },
})

vim.cmd.colorscheme("rose-pine")

-- 'laststatus 3' shows only single line at the bottom
-- That looks better without highlight
vim.api.nvim_set_hl(0, "StatusLine", { link = "StatusLineNC" })

-- Italic makes '|' look like backslash '/' for my font (Iosevka Nerd Font)
-- Disabling italic comments
local comment_hl = vim.api.nvim_get_hl(0, { name = "Comment" })
comment_hl.italic = false
vim.api.nvim_set_hl(0, "Comment", comment_hl)
