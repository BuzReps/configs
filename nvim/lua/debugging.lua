------------------------- Setting up DAP client -------------------------

-- Instruction: https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(gdb-via--vscode-cpptools)

local dap = require('dap')

-- #TODO silent?
vim.keymap.set('n', '<F5>', ":lua require'dap'.continue()<CR>")
vim.keymap.set('n', '<F6>', ":lua require'dap'.terminate()<CR>")
vim.keymap.set('n', '<F7>', ":lua require('dapui').toggle()<CR>")
vim.keymap.set('n', '<F8>', ":lua require('dapui').focus_frame()<CR>")
vim.keymap.set('n', '<F1>', ":lua require'dap'.step_into()<CR>")
vim.keymap.set('n', '<F2>', ":lua require'dap'.step_over()<CR>")
vim.keymap.set('n', '<F3>', ":lua require'dap'.step_out()<CR>")
vim.keymap.set('n', '<Leader>bt', ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set('n', '<Leader>bc', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set('n', '<Leader>lp', ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set('n', '<Leader>dr', ":lua require'dap'.repl.open()<CR>")
vim.keymap.set('n', '<Leader>dr', ":lua require'dap'.run_last()<CR>")

vim.api.nvim_create_user_command(
  'DapResetSizes',
  function(opts)
    require'dapui'.open({reset=true})
  end,
  { desc = "Restores dapui windows to their original size" }
)

-- Stores path from last debuggee selection prompt.
-- If user haven't selected anything in current session, returns
-- lsp working dir or current working dir
dap_last_selected_program = setmetatable({}, {
  __index = function(table, key)
    local folders = vim.lsp.buf.list_workspace_folders()
    return folders and folders[1] and folders[1] .. "/" or vim.fn.getcwd() .. '/'
  end,
  __newindex = function(table, key, value)
    if type(value) == "string" then
      rawset(table, key, value)
      print("dap: Set " .. value .. " for " .. key)
    else
      print("dap: Declined " .. tostring(value) .. " for " .. tostring(key))
    end
  end
})

-- TODO Add CMake targets selection
function RunDebugging()
  -- Fast and less user-friendly
  -- do return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file') end
  -- TODO Set as initial value
  -- local last_selection = dap_last_selected_program.cpp
  require('pickers').select_executable({
    initial = last_selection,
    on_apply = function(executable_path)
      if executable_path and #executable_path > 0 then
        dap_last_selected_program.cpp = executable_path.value
        dap.continue()
      end
    end,
  })
end
vim.keymap.set('n', '<Leader><F5>', RunDebugging)


dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  -- Using adapter from https://github.com/microsoft/vscode-cpptools
  command = 'OpenDebugAD7',
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
        return dap_last_selected_program.cpp
      end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
    setupCommands = {
      {
         text = '-enable-pretty-printing',
         description =  'enable pretty printing',
         ignoreFailures = false
      },
    },
  },

  --[[
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
  --]]
}

-- Same config in c and rust
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

------------------------- Setting up DAP client UI -------------------------

-- Font fix: https://askubuntu.com/a/737285

local dapui = require("dapui")

require("dapui").setup({
  icons = { expanded = "⬐", collapsed = "→", current_frame = "→" },

  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 60, -- 60 columns
      position = "left",
    },

    --[[
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
    -]]
  },

  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "⏸",
      play = "▶",
      step_into = "↓",
      step_over = "↷",
      step_out = "↑",
      step_back = "↶",
      run_last = "⦿",
      terminate = "⨯",
    },
  },

  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },

  windows = { indent = 1 },

  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})

-- Open and close debugging interface automatically:
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
--  TODO FIX: Autoclosing does not work
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

