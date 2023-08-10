-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }

-- vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<Leader>e', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<Leader>E', vim.diagnostic.goto_prev, opts)
-- TODO read about
-- vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions

  -- buffer = 0 (0 means whether the current buffer is)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', '<Leader>q', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('i', '<C-q>', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<Leader>gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, bufopts)

  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  --[[ vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts) ]]--

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
      vim.keymap.set('n', '<Leader>h', "<cmd>ClangdSwitchSourceHeader<CR>", bufopts)
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

