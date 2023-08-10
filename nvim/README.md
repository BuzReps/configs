Start with [init.vim](init.vim)

## Telescope
1. Install [ripgrep](https://github.com/BurntSushi/ripgrep) - grep alternative  
  `sudo apt install ripgrep`
1. Install [fd](https://github.com/sharkdp/fd) - find alternative  
  `sudo apt install fd-find`

## Language Server Protocol (LSP)
1. Install lua language server: [lua_ls](https://github.com/LuaLS/lua-language-server)
  * Download [binaries](https://github.com/LuaLS/lua-language-server/releases)
  * Make PATH-visible [script](https://github.com/luals/lua-language-server/wiki/Getting-Started#command-line)
2. Install C/C++ language server: [clangd](https://clangd.llvm.org/)
  * `sudo apt install clangd`
3. Install python language server: [pyright](https://github.com/microsoft/pyright)
  * `sudo snap install pyright`
  * If `snap` not available, probably installed like other vscode extension: [download](https://github.com/microsoft/pyright/releases), unzip and make some binary PATH-visible

## Debug Adapter Protocol (DAP)
1. Install C/C++ debugger adapter: [vscode-cpptools](https://github.com/microsoft/vscode-cpptools)
  <!-- [Guide](https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(gdb-via--vscode-cpptools)) -->
  * Download [binaries](https://github.com/microsoft/vscode-cpptools/releases)
  * Unzip and make OpenDebugAD7 PATH-visible:
    ```
    mkdir cpptools-linux && unzip cpptools-linux.vsix -d cpptools-linux
    chmod +x cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7
    ```

