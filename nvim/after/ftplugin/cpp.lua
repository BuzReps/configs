local opts = {
  noremap = true
}

-- Wrap selection with cast
vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>sc', '<Esc>`>a)<Esc>`<istatic_cast<>(<Esc>hi', opts)
vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>rc', '<Esc>`>a)<Esc>`<ireinterpret_cast<>(<Esc>hi', opts)
vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>dc', '<Esc>`>a)<Esc>`<idynamic_cast<>(<Esc>hi', opts)
vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>cc', '<Esc>`>a)<Esc>`<iconst_cast<>(<Esc>hi', opts)

-- Insert cast operator and put cursor inside angle brackets
vim.api.nvim_buf_set_keymap(0, 'i', ',sc', 'static_cast<><Left>', opts)
vim.api.nvim_buf_set_keymap(0, 'i', ',rc', 'reinterpret_cast<><Left>', opts)
vim.api.nvim_buf_set_keymap(0, 'i', ',dc', 'dynamic_cast<><Left>', opts)
vim.api.nvim_buf_set_keymap(0, 'i', ',cc', 'const_cast<><Left>', opts)

-- Wrap selection with smart pointer and put cursor inside parenthesis
vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>up', '<Esc>`>a)<Esc>`<istd::unique_ptr<>(<Esc>hi', opts)
vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>sp', '<Esc>`>a)<Esc>`<istd::shared_ptr<>(<Esc>hi', opts)
vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>wp', '<Esc>`>a)<Esc>`<istd::weak_ptr<>(<Esc>hi', opts)

-- Insert smart pointer and put cursor inside angle blackets
vim.api.nvim_buf_set_keymap(0, 'i', ',up', 'std::unique_ptr<><Left>', opts)
vim.api.nvim_buf_set_keymap(0, 'i', ',mu', 'std::make_unique<><Left>', opts)
vim.api.nvim_buf_set_keymap(0, 'i', ',sp', 'std::shared_ptr<><Left>', opts)
vim.api.nvim_buf_set_keymap(0, 'i', ',ms', 'std::make_shared<><Left>', opts)
vim.api.nvim_buf_set_keymap(0, 'i', ',wp', 'std::weak_ptr<><Left>', opts)

vim.api.nvim_buf_set_keymap(0, 'i', [[,(]], [[()<Left>]], opts)
vim.api.nvim_buf_set_keymap(0, 'i', [[']], [[''<Left>]], opts)
vim.api.nvim_buf_set_keymap(0, 'i', [["]], [[""<Left>]], opts)
vim.api.nvim_buf_set_keymap(0, 'i', [[,<]], [[<><Left>]], opts)
vim.api.nvim_buf_set_keymap(0, 'i', [[,co]], [[std::cout << ;<Left>]], opts)
vim.api.nvim_buf_set_keymap(0, 'i', [[,fmt]], [[std::cout << std::format("\n");<Esc>4hi]], opts)
vim.api.nvim_buf_set_keymap(0, 'i', [[,mv]], [[std::move()<Left>]], opts)
vim.api.nvim_buf_set_keymap(0, 'i', [[,less]], [[bool operator<() const {}<Left><CR>]], opts)

vim.api.nvim_buf_set_keymap(0, 'i', [[,um]], [[std::unordered_map<><Left>]], opts)
vim.api.nvim_buf_set_keymap(0, 'i', [[,umm]], [[std::unordered_multimap<><Left>]], opts)
vim.api.nvim_buf_set_keymap(0, 'i', [[,mm]], [[std::multimap<><Left>]], opts)
vim.api.nvim_buf_set_keymap(0, 'i', [[,us]], [[std::unordered_set<><Left>]], opts)
vim.api.nvim_buf_set_keymap(0, 'i', [[,ums]], [[std::unordered_multiset<><Left>]], opts)
vim.api.nvim_buf_set_keymap(0, 'i', [[,ms]], [[std::multiset<><Left>]], opts)
vim.api.nvim_buf_set_keymap(0, 'i', [[,vec]], [[std::vector<><Left>]], opts)
vim.api.nvim_buf_set_keymap(0, 'i', [[,op]], [[std::optional<><Left>]], opts)
vim.api.nvim_buf_set_keymap(0, 'i', [[,mo]], [[std::make_optional()<Left>]], opts)
vim.api.nvim_buf_set_keymap(0, 'i', [[,pq]], [[std::priority_queue<><Left>]], opts)

vim.api.nvim_buf_set_keymap(0, 'i', [[,pa]], [[std::pair<><Left>]], opts)
vim.api.nvim_buf_set_keymap(0, 'i', [[,mp]], [[std::make_pair()<Left>]], opts)

vim.api.nvim_buf_set_keymap(0, 'i', [[,tu]], [[std::tuple<><Left>]], opts)
vim.api.nvim_buf_set_keymap(0, 'i', [[,mt]], [[std::make_tuple()<Left>]], opts)

vim.api.nvim_buf_set_keymap(0, 'i', [[,la]], [[[&]{}();<Esc>3hi<CR><Esc>O]], opts)

vim.api.nvim_buf_set_keymap(0, 'i', ',sl', 'QStringLiteral("")<Left><Left>', opts)
