vim.opt.compatible = false
vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = 'ucs-bom,utf-8'

-- ignore case in search and scripts
vim.opt.ignorecase = true

-- Do not select EOL character
vim.opt.selection = 'old'

-- Leave a few context lines at screen top and bottom
vim.opt.scrolloff = 0

-- Syntax folding can reduce performance because it uses regexes
vim.opt.foldmethod = 'indent'
-- Disable autofolding
vim.opt.foldenable = false
-- Do not unfold at text search
vim.opt.foldopen:remove('search')

-- Do not wrap lines
vim.opt.wrap = false

-- :vsp/vsplit <filename> will open file to the right
vim.opt.splitright = true

-- Default indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Show invisible characters
-- Useful characters: '»', '·', ඞ
vim.opt.listchars = 'lead: ,trail:·,tab:» '
vim.opt.list = true

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Show titlestring variable as GUI window title
vim.opt.title = true

-- Colors specified columns
vim.opt.colorcolumn = "80,120"

vim.opt.fillchars = 'horiz:─,horizup:┴,horizdown:┬,vert:│,vertleft:┤,vertright:├,verthoriz:┼'
vim.opt.fillchars:append('eob: ')
vim.opt.fillchars:append('fold: ')
vim.opt.fillchars:append('stl:─')

vim.o.pumheight = 20

