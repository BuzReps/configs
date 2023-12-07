require("telescope").setup {
  defaults = {
    file_ignore_patterns = {
      ".git$",
      ".vs$",
      "vcpkg/*",
      "build/*",
      "doc/*",
      "tests/*",
      "dist/*",
      "mkspecs/*",
      "examples/*",

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

