require("colorizer").setup {
  filetypes = { "*" },
  user_default_options = {
    RGB = true,          -- #RGB hex codes
    RRGGBB = true,       -- #RRGGBB hex codes
    names = true,        -- "Name" codes like Blue or blue
    RRGGBBAA = false,    -- #RRGGBBAA hex codes
    AARRGGBB = false,    -- 0xAARRGGBB hex codes
    -- Available modes for `mode`: foreground, background,  virtualtext
    mode = "background", -- Set the display mode.
    virtualtext = "■",
  },
  -- all the sub-options of filetypes apply to buftypes
  buftypes = {},
}
