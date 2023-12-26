local map = require("buzreps.remap")

-- Tab switching
map.normal { "<A-1>", "1gt" }
map.normal { "<A-2>", "2gt" }
map.normal { "<A-3>", "3gt" }
map.normal { "<A-4>", "4gt" }
map.normal { "<A-5>", "5gt" }
map.normal { "<A-6>", "6gt" }
map.normal { "<A-7>", "7gt" }
map.normal { "<A-8>", "8gt" }
map.normal { "<A-9>", "9gt" }

-- Create [n]ew tab next to current
map.normal { "<A-n>", "<cmd>tabnew<CR>" }

-- Move current tab left/right
map.normal { "<A-j>", "<cmd>call MoveCurrentTab(-1)<CR>" }
map.normal { "<A-k>", "<cmd>call MoveCurrentTab(1)<CR>" }

-- Goto prev/next tab
map.normal { "<A-h>", "gT" }
map.normal { "<A-l>", "gt" }

-- [R]ename current tab
-- TODO: insert current tab label after command
map.normal { "<A-r>", ":SetCurrentTabPageLabel ", descr = "Rename current tab" }

-- Window switching
map.normal { "<Leader>1", "1<C-w>w" }
map.normal { "<Leader>2", "2<C-w>w" }
map.normal { "<Leader>3", "3<C-w>w" }
map.normal { "<Leader>4", "4<C-w>w" }
map.normal { "<Leader>5", "5<C-w>w" }
map.normal { "<Leader>6", "6<C-w>w" }
map.normal { "<Leader>7", "7<C-w>w" }
map.normal { "<Leader>8", "8<C-w>w" }
map.normal { "<Leader>9", "9<C-w>w" }

map.insert { "jk", "<Esc>" }

-- Toggle word [w]rap
map.normal { "<Leader>w", "<cmd>set wrap!<CR>", descr = "Toggle wrap mode" }

-- [S]earch: yank current selection into search buffer
-- warning: Overwrites 's' register
-- requires appropriate selection mode
map.visual { "<Leader>s", '"sy :let @/=@s<CR>', descr = "Yank selection into search buffer" }

-- Turn off search highlight
map.normal { "<Leader>S", "<cmd>nohl<CR>" }

-- Clipboard [y]ank: copy unnamed register contents to OS clipboard
map.normal { "<Leader>y", ':let @+=@"<CR>', descr = "Yank into system clipboard" }
-- Clipboard [y]ank: copy selection to OS clipboard
map.visual { "<Leader>y", '"+y', descr = "Yank into system clipboard" }

-- [P]aste: paste last yanked text
-- or `xnoremap <Leader>p pgvy` - paste{p), select pasted(gv), yank(y}
map.normal { "<Leader>p", '"0p', descr = "Paste last yanked text" }
map.normal { "<Leader>P", '"0P', descr = "Paste last yanked text" }

-- centering window at search result
map.normal { "n", "nzzzv" }
map.normal { "N", "Nzzzv" }

-- centering window at undo/redo
map.normal { "u", "uzz" }
map.normal { "<C-r>", "<C-r>zz" }

-- fg - grep in lua/init.lua
map.normal { "<Leader>ff", "<cmd>Telescope find_files<cr>" }
map.normal { "<Leader>fof", "<cmd>Telescope oldfiles<cr>" }
map.normal { "<leader>fb", "<cmd>Telescope buffers<cr>" }

map.normal { "<leader>fref", "<cmd>Telescope lsp_references<cr>" }
map.normal { "<leader>fic", "<cmd>Telescope lsp_incoming_calls<cr>" }
map.normal { "<leader>foc", "<cmd>Telescope lsp_outgoing_calls<cr>" }
map.normal { "<leader>fws", "<cmd>Telescope lsp_workspace_symbols<cr>" }
map.normal { "<leader>fds", "<cmd>Telescope lsp_document_symbols<cr>" }

-- [f]ind [a]ll [d]iagnostics
map.normal { "<leader>fad", "<cmd>Telescope diagnostics<cr>" }
-- [f]ind [c]urrent [d]iagnostics
map.normal { "<leader>fcd", "<cmd>Telescope diagnostics bufnr=0<cr>" }

map.normal { "<leader>fhel", "<cmd>Telescope help_tags<cr>" }
map.normal { "<leader>fman", "<cmd>Telescope man_pages<cr>" }
map.normal { "<leader>fcom", "<cmd>Telescope commands<cr>" }

map.normal { "<leader>f/", "<cmd>Telescope search_history<cr>" }
map.normal { "<leader>frp", "<cmd>Telescope resume<cr>" }
-- normal{"<leader>flp", "<cmd>Telescope pickers<cr>"}
-- [f]ind [t]elescope [d]efaults
-- normal{"<leader>ftd", "<cmd>Telescope builtin<cr>"}
-- normal{"<leader>freg", "<cmd>Telescope registers<cr>"}

map.normal { '<leader>n', ' <cmd>Lex<cr>' }

-- [s]ymbols [o]utline
map.normal { '<Leader>so', ' <cmd>SymbolsOutline<cr>' }

-- Window resizing
map.normal { '<F9>', ':resize -2<CR>' }
map.normal { '<F10>', ':resize +2<CR>' }
map.normal { '<F11>', ':vertical resize -10<CR>' }
map.normal { '<F12>', ':vertical resize +10<CR>' }

-- Wrap selection with brackets or quotes
-- Requires 'old' or 'inclusive' selection
map.visual { "<Leader>'", "<Esc>`>a'<Esc>`<i'<Esc>" }
map.visual { '<Leader>"', '<Esc>`>a"<Esc>`<i"<Esc>' }
map.visual { '<Leader>(', '<Esc>`>a)<Esc>`<i(<Esc>' }
map.visual { '<Leader>{', '<Esc>`>a}<Esc>`<i{<Esc>' }
map.visual { '<Leader><', '<Esc>`>a><Esc>`<i<<Esc>' }
map.visual { '<Leader>[', '<Esc>`>a]<Esc>`<i[<Esc>' }
map.visual { '<Leader>*', '<Esc>`>a*<Esc>`<i*<Esc>' }
map.visual { '<Leader>`', '<Esc>`>a`<Esc>`<i`<Esc>' }

map.normal { "<Leader>'", "a''<Esc>i" }
map.normal { '<Leader>"', 'a""<Esc>i' }
map.normal { '<Leader>(', 'a()<Esc>i' }
map.normal { '<Leader>{', 'a{}<Esc>i' }
map.normal { '<Leader><', 'a<><Esc>i' }
map.normal { '<Leader>[', 'a[]<Esc>i' }
map.normal { '<Leader>*', 'a**<Esc>i' }
map.normal { '<Leader>`', 'a``<Esc>i' }

-- Paste tabs on <Tab>; Set tab virtual size to arg
map.normal { '<Leader>ut', ':UseTabs ' }
-- Paste spaces in <Tab>; Set amount of spaces per <Tab>
map.normal { '<Leader>us', ':UseSpaces ' }

-- TODO: compact mode for all windows {on current tab?}
map.normal { '<Leader>cm', ':execute ":call ToggleCompactMode()"<CR>' }
