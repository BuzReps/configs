-- Tab switching
vim.keymap.set("n", "<A-1>", "1gt")
vim.keymap.set("n", "<A-2>", "2gt")
vim.keymap.set("n", "<A-3>", "3gt")
vim.keymap.set("n", "<A-4>", "4gt")
vim.keymap.set("n", "<A-5>", "5gt")
vim.keymap.set("n", "<A-6>", "6gt")
vim.keymap.set("n", "<A-7>", "7gt")
vim.keymap.set("n", "<A-8>", "8gt")
vim.keymap.set("n", "<A-9>", "9gt")

-- Create [n]ew tab next to current
vim.keymap.set("n", "<A-n>", "<cmd>tabnew<CR>")

-- Move current tab left/right
vim.keymap.set("n", "<A-j>", "<cmd>call MoveCurrentTab(-1)<CR>")
vim.keymap.set("n", "<A-k>", "<cmd>call MoveCurrentTab(1)<CR>")

-- Goto prev/next tab
vim.keymap.set("n", "<A-h>", "gT")
vim.keymap.set("n", "<A-l>", "gt")

-- [R]ename current tab
-- TODO: insert current tab label after command
vim.keymap.set("n", "<A-r>", ":SetCurrentTabPageLabel ")

-- Window switching
vim.keymap.set("n", "<Leader>1", "1<C-w>w")
vim.keymap.set("n", "<Leader>2", "2<C-w>w")
vim.keymap.set("n", "<Leader>3", "3<C-w>w")
vim.keymap.set("n", "<Leader>4", "4<C-w>w")
vim.keymap.set("n", "<Leader>5", "5<C-w>w")
vim.keymap.set("n", "<Leader>6", "6<C-w>w")
vim.keymap.set("n", "<Leader>7", "7<C-w>w")
vim.keymap.set("n", "<Leader>8", "8<C-w>w")
vim.keymap.set("n", "<Leader>9", "9<C-w>w")

vim.keymap.set("i", "jk", "<Esc>")

-- Toggle word [w]rap
vim.keymap.set("n", "<Leader>w", "<cmd>set wrap!<CR>")

-- [S]earch: yank current selection into search buffer
-- warning: Overwrites 's' register
-- requires appropriate selection mode
vim.keymap.set("v", "<Leader>s", '"sy :let @/=@s<CR>')

-- Turn off search highlight
vim.keymap.set("n", "<Leader>S", "<cmd>nohl<CR>")

-- Clipboard [y]ank: copy unnamed register contents to OS clipboard
vim.keymap.set("n", "<Leader>y", ':let @+=@"<CR>')
-- Clipboard [y]ank: copy selection to OS clipboard
vim.keymap.set('v', "<Leader>y", '"+y')

-- [P]aste: paste last yanked text
-- or `xnoremap <Leader>p pgvy` - paste(p), select pasted(gv), yank(y)
vim.keymap.set("n", "<Leader>p", '"0p')
vim.keymap.set("n", "<Leader>P", '"0P')

-- centering window at search result
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- centering window at undo/redo
vim.keymap.set("n", "u", "uzz")
vim.keymap.set("n", "<C-r>", "<C-r>zz")

-- fg - grep in lua/init.lua
vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<Leader>fof", "<cmd>Telescope oldfiles<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")

vim.keymap.set("n", "<leader>fref", "<cmd>Telescope lsp_references<cr>")
vim.keymap.set("n", "<leader>fic", "<cmd>Telescope lsp_incoming_calls<cr>")
vim.keymap.set("n", "<leader>foc", "<cmd>Telescope lsp_outgoing_calls<cr>")
vim.keymap.set("n", "<leader>fws", "<cmd>Telescope lsp_workspace_symbols<cr>")
vim.keymap.set("n", "<leader>fds", "<cmd>Telescope lsp_document_symbols<cr>")

-- [f]ind [a]ll [d]iagnostics
vim.keymap.set("n", "<leader>fad", "<cmd>Telescope diagnostics<cr>")
-- [f]ind [c]urrent [d]iagnostics
vim.keymap.set("n", "<leader>fcd", "<cmd>Telescope diagnostics bufnr=0<cr>")

vim.keymap.set("n", "<leader>fhel", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>fman", "<cmd>Telescope man_pages<cr>")
vim.keymap.set("n", "<leader>fcom", "<cmd>Telescope commands<cr>")

vim.keymap.set("n", "<leader>f/", "<cmd>Telescope search_history<cr>")
vim.keymap.set("n", "<leader>frp", "<cmd>Telescope resume<cr>")
-- vim.keymap.set("n", "<leader>flp", "<cmd>Telescope pickers<cr>")
-- [f]ind [t]elescope [d]efaults
-- vim.keymap.set("n", "<leader>ftd", "<cmd>Telescope builtin<cr>")
-- vim.keymap.set("n", "<leader>freg", "<cmd>Telescope registers<cr>")

vim.keymap.set('n', '<leader>n', ' <cmd>Lex<cr>')

-- [s]ymbols [o]utline
vim.keymap.set('n', '<Leader>so', ' <cmd>SymbolsOutline<cr>')

-- Window resizing
vim.keymap.set('n', '<F10>', ':resize +2<CR>')
vim.keymap.set('n', '<F9>', ':resize -2<CR>')
vim.keymap.set('n', '<F12>', ':vertical resize +10<CR>')
vim.keymap.set('n', '<F11>', ':vertical resize -10<CR>')

-- Wrap selection with brackets or quotes
-- Requires 'old' or 'inclusive' selection
vim.keymap.set('v', "<Leader>'", "<Esc>`>a'<Esc>`<i'<Esc>")
vim.keymap.set('v', '<Leader>"', '<Esc>`>a"<Esc>`<i"<Esc>')
vim.keymap.set('v', '<Leader>(', '<Esc>`>a)<Esc>`<i(<Esc>')
vim.keymap.set('v', '<Leader>{', '<Esc>`>a}<Esc>`<i{<Esc>')
vim.keymap.set('v', '<Leader><', '<Esc>`>a><Esc>`<i<<Esc>')
vim.keymap.set('v', '<Leader>[', '<Esc>`>a]<Esc>`<i[<Esc>')
vim.keymap.set('v', '<Leader>*', '<Esc>`>a*<Esc>`<i*<Esc>')
vim.keymap.set('v', '<Leader>`', '<Esc>`>a`<Esc>`<i`<Esc>')

vim.keymap.set('n', "<Leader>'", "a''<Esc>i")
vim.keymap.set('n', '<Leader>"', 'a""<Esc>i')
vim.keymap.set('n', '<Leader>(', 'a()<Esc>i')
vim.keymap.set('n', '<Leader>{', 'a{}<Esc>i')
vim.keymap.set('n', '<Leader><', 'a<><Esc>i')
vim.keymap.set('n', '<Leader>[', 'a[]<Esc>i')
vim.keymap.set('n', '<Leader>*', 'a**<Esc>i')
vim.keymap.set('n', '<Leader>`', 'a``<Esc>i')

-- Paste tabs on <Tab>; Set tab virtual size to arg
vim.keymap.set('n', '<Leader>ut', ':UseTabs ')
-- Paste spaces in <Tab>; Set amount of spaces per <Tab>
vim.keymap.set('n', '<Leader>us', ':UseSpaces ')

-- TODO: compact mode for all windows (on current tab?)
vim.keymap.set('n', '<Leader>cm', ':execute ":call ToggleCompactMode()"<CR>')

