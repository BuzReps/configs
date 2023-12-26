local map = require("buzreps.remap")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }

-- map.normal { '<Leader>e', vim.diagnostic.open_float, opts)
map.normal { '<Leader>e', vim.diagnostic.goto_next, opts, descr = "Goto next lsp error" }
map.normal { '<Leader>E', vim.diagnostic.goto_prev, opts, descr = "Goto prev lsp error" }
-- TODO read about
-- map.normal { '<Leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions

  -- buffer = 0 (0 means whether the current buffer is)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  map.normal { '<Leader>q', vim.lsp.buf.hover, bufopts }
  map.insert { '<C-q>', vim.lsp.buf.hover, bufopts }
  map.normal { 'gd', vim.lsp.buf.definition, bufopts }
  map.normal { 'gD', vim.lsp.buf.declaration, bufopts }
  map.normal { '<Leader>D', vim.lsp.buf.type_definition, bufopts }
  map.normal { '<Leader>rn', vim.lsp.buf.rename, bufopts }
  map.normal { '<Leader>gr', vim.lsp.buf.references, bufopts }
  map.normal { '<Leader>ca', vim.lsp.buf.code_action, bufopts }
  map.normal { '<Leader>f', vim.lsp.buf.format, bufopts }

  -- map.normal { 'gi', vim.lsp.buf.implementation, bufopts)
  -- map.normal { '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- map.normal { '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- map.normal { '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  --[[ map.normal { '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts) ]]
  --

  -- Saving active lsp clients (usually single) names to show them in statusline
  vim.b[0]["lsp_clients"] = (function()
    local concated_names = ""
    for _, buf in ipairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      if #concated_names > 0 then
        concated_names = concated_names .. ", "
      end
      concated_names = concated_names .. buf.name
    end
    return concated_names
  end)()
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- Tell lsp that client can autocomplete
-- Attach this caps to each server setup
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP for C/C++
require('lspconfig').clangd.setup {
  -- Uncomment to enable verbose log
  --cmd = { 'clangd', '--log=verbose' },
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- <Leader>h now will switch between header/source
    map.normal { '<Leader>h', "<cmd>ClangdSwitchSourceHeader<CR>", bufopts }
  end,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- LSP for LUA
require('lspconfig').lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  single_file_support = true,
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- LSP for Python
require('lspconfig').pyright.setup {
  single_file_support = true,
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- LSP for Haskell
require('lspconfig').hls.setup {
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- LSP for QML
require 'lspconfig'.qmlls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}
