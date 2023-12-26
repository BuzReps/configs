local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      ".git$",
      ".vs$",
      "^vcpkg/*",
      "^build/*",
      "^doc/*",
      "^tests/*",
      "^dist/*",
      "^mkspecs/*",
      "^examples/*",

      -- Binaries
      ".pdb$",
      ".tlog$",
      ".exe$",
      ".dll$",
      ".ilk$",
      ".obj$",
      ".idb$",
      ".bin$",
      ".obj$",

      -- Images
      ".png$",
      ".jpg$",
      ".jpeg$",
      ".bmp$",
      ".ico$",

      -- Documents
      ".xls$",
      ".xlsx$",

      -- Archives
      ".zip$",
      ".rar$",
      ".tar$",
      ".gz$",
    },
  }
}

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
  builtin.live_grep({
    glob_pattern = pattern,
    disable_coordinates = true
  })
end
vim.keymap.set('n', '<Leader>fg', GrepWithFileFilter, { noremap = true, silent = true })

