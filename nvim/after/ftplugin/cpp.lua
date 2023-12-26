local mappign_opts = {}

vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>sc', '<Esc>`>a)<Esc>`<istatic_cast<>(<Esc>hi', mappign_opts)
vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>rc', '<Esc>`>a)<Esc>`<ireinterpret_cast<>(<Esc>hi', mappign_opts)
vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>dc', '<Esc>`>a)<Esc>`<idynamic_cast<>(<Esc>hi', mappign_opts)
vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>cc', '<Esc>`>a)<Esc>`<iconst_cast<>(<Esc>hi', mappign_opts)

-- Insert cast operator and put cursor inside angle brackets
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>sc', 'astatic_cast<>()<Esc>2hi', mappign_opts)
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rc', 'areinterpret_cast<>()<Esc>2hi', mappign_opts)
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>dc', 'adynamic_cast<>()<Esc>2hi', mappign_opts)
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>cc', 'aconst_cast<>()<Esc>2hi', mappign_opts)

-- Wrap selection with smart pointer and put cursor inside parenthesis
vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>up', '<Esc>`>a)<Esc>`<istd::unique_ptr<>(<Esc>hi', mappign_opts)
vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>sp', '<Esc>`>a)<Esc>`<istd::shared_ptr<>(<Esc>hi', mappign_opts)
vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>wp', '<Esc>`>a)<Esc>`<istd::weak_ptr<>(<Esc>hi', mappign_opts)

-- Insert smart pointer and put cursor inside angle blackets
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>up', 'astd::unique_ptr<>()<Esc>2hi', mappign_opts)
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>sp', 'astd::shared_ptr<>()<Esc>2hi', mappign_opts)
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>wp', 'astd::weak_ptr<>()<Esc>2hi', mappign_opts)
