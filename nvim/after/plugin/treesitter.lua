require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "cmake", "lua", "haskell", "vim", "query" },
  sync_install = false,
  auto_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
