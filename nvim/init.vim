"Buzun Vladislav's neovim config
language en_US.UTF-8

"Absolute path to nvim configs folder
if !exists('g:config_root')
  let g:config_root = fnamemodify(resolve(expand('<sfile>:p')), ':h')
endif

"This variable contains absolute path to local config file
"E.g. host-specific cd aliases, etc.
if !exists('g:local_config')
  let g:local_config = resolve(expand('~/nvim_local.vim'))
endif

exec "source " .. g:config_root .. "/common.vim"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        PLUGINS CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin("~/.vim/plugged")
  Plug 'vim-scripts/vim-plug'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  "Generic lua tools required for nvim-telescope
  Plug 'nvim-lua/plenary.nvim'
  "Finder over lists of anything
  "Optionaly requires github.com/BurntSushi/ripgrep for live_grep
  Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

  "Git plugin
  Plug 'tpope/vim-fugitive'

  "Adjust settings to .editorconfig
  Plug 'editorconfig/editorconfig-vim'

  "LSP config. Also need to install external LSP servers
  Plug 'neovim/nvim-lspconfig'

  "Autocomplete engine
  Plug 'hrsh7th/nvim-cmp'
  "Sources for autocomplete engine
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  "Snippet expansion plugins, because LSP can return snippets for completion:
  "Snippet Engine for Neovim written in Lua.
  Plug 'L3MON4D3/LuaSnip'
  "luasnip completion source for nvim-cmp
  Plug 'saadparwaiz1/cmp_luasnip'

  "DAP client implementation. Also need to install external DAP servers
  Plug 'mfussenegger/nvim-dap'
  "Adds sources for telescope `:Telescope dap list_breakpoints|variables|frames`
  Plug 'nvim-telescope/telescope-dap.nvim'
  "Debugger UI: threads, stacktrace, scopes, variables windows
  Plug 'rcarriga/nvim-dap-ui'
  "TODO enable
  "Shows variables values next to their definitions. Requires nvim-treesitter
  " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " Plug 'theHamsta/nvim-dap-virtual-text'

  "Markdown tools. (e.g. :Toc for table of contents)
  Plug 'preservim/vim-markdown'
call plug#end()

"""""""""""
"netrw - default filesystem browser
"""""""""""

"Set tree view type as default
let g:netrw_liststyle = 3

"Disable banner
let g:netrw_banner = 0

"Open files in new previous window
let g:netrw_browse_split = 4

"Default width = 40 columns
let g:netrw_winsize = -40

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"""""""""""
" 'preservim/vim-markdown' - Markdown tools
"""""""""""

let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = []
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        BEHAVIOUR CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set encoding=utf-8
scriptencoding utf-8
set fileencodings=ucs-bom,utf8

"ignore case in search and scripts
set ignorecase

"Do not select EOL character
set selection=old

"Leave a few context lines at screen top and bottom
set scrolloff=0

"Syntax folding is can slow because it uses regexes
set foldmethod=indent
"Disable autofolding
set nofoldenable
"Do not unfold at text search
set foldopen-=search

"Do not wrap lines
set nowrap

":vsp/vsplit <filename> will open file to the right
set splitright

"Default indent
set expandtab
set tabstop=2
set shiftwidth=2

"Always show sign column. Prevents from flickering
set signcolumn=yes

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        COMMAND MAPPING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! W w
command! Q q

exec "source " .. g:config_root .. "/DarkTheme.vim"
exec "source " .. g:config_root .. "/LightTheme.vim"

function! s:ToggleTheme()
  if !exists("g:BuzTheme")
    call SetDarkTheme()
  elseif g:BuzTheme ==? "Dark"
    call SetLightTheme()
  elseif g:BuzTheme ==? "Light"
    call SetDarkTheme()
  elseif
    echom "Unknown theme mode: " .. string(s:BuzTheme)
  endif
endfunction

command! LightTheme call SetLightTheme()
command! DarkTheme call SetDarkTheme()
command! ToggleTheme call s:ToggleTheme()

"Enables 24-bit RGB color in the TUI
"Uses "gui" attributes instead of "cterm" attributes
"Requires compatible terminal
set termguicolors

"Darktheme by default
DarkTheme

command! OpenHighlightGroupsWindow :so $VIMRUNTIME\syntax\hitest.vim
command! ReloadConfig :source $MYVIMRC
command! PasteUnformatted call PasteUnformatted()
command! FileInfo call FileInfo()
command! DeleteHiddenListedBuffers call DeleteHiddenListedBuffers()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        KEY MAPPING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <SPACE> <nop>
let mapleader=" "

"Alt key controls tabs:

"Goto tab
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
"Crete [n]ew tab next to current
nnoremap <A-n> <cmd>tabnew<CR>
"Move current tab left/right
nnoremap <A-j> <cmd>call MoveCurrentTab(-1)<CR>
nnoremap <A-k> <cmd>call MoveCurrentTab(1)<CR>
"Goto prev/next tab
nnoremap <A-h> gT
nnoremap <A-l> gt
"[R]ename current tab
nnoremap <A-r> :SetCurrentTabPageLabel 

"Goto window
noremap <Leader>1 1<C-w>w
noremap <Leader>2 2<C-w>w
noremap <Leader>3 3<C-w>w
noremap <Leader>4 4<C-w>w
noremap <Leader>5 5<C-w>w
noremap <Leader>6 6<C-w>w
noremap <Leader>7 7<C-w>w
noremap <Leader>8 8<C-w>w
noremap <Leader>9 9<C-w>w

inoremap jk <Esc>

"[W]rap: toggle word wrap
nnoremap <Leader>w <cmd>set wrap!<CR>

function! ToggleDiffForCurrWindow()
if &diff == 0
  execute 'diffthis'
else
  execute 'diffoff'
endif
endfunction
nnoremap <Leader>d <cmd>call ToggleDiffForCurrWindow()<CR>

"[S]earch: yank current selection into search buffer
"warning: Overwrites 's' register
"requires appropriate selection mode
vnoremap <Leader>s "sy :let @/=@s<CR>

"Turn off last search highlight
noremap <Leader>S :nohl<CR>

"[C]lipboard: copy unnamed register contents to OS clipboard
nnoremap <Leader>c :let @+=@"<CR>
"[C]lipboard: copy selected to OS clipboard
vnoremap <Leader>c "+y

"'[P]aste: paste last yanked text
"or `xnoremap <Leader>p pgvy` - paste(p), select pasted(gv), yank(y)
noremap <Leader>p "0p
noremap <Leader>P "0P

noremap <Leader>o o<Esc>
noremap <Leader>O O<Esc>

"centering window at search result
nnoremap n nzz
nnoremap N Nzz

"centering window at undo/redo
nnoremap u uzz
nnoremap <C-r> <C-r>zz

"'f' - 'find'
"fg - grep in lua/init.lua
nnoremap <Leader>ff <cmd>Telescope find_files<cr>
nnoremap <Leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>f/ <cmd>Telescope search_history<cr>
nnoremap <leader>fht <cmd>Telescope help_tags<cr>
nnoremap <leader>fmp <cmd>Telescope man_pages<cr>
"[d]iagnostics [a]ll
nnoremap <leader>fda <cmd>Telescope diagnostics<cr>
"[d]iagnostics [c]urrent
nnoremap <leader>fdc <cmd>Telescope diagnostics bufnr=0<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fref <cmd>Telescope lsp_references<cr>
nnoremap <leader>fic <cmd>Telescope lsp_incoming_calls<cr>
nnoremap <leader>foc <cmd>Telescope lsp_outgoing_calls<cr>
nnoremap <leader>freg <cmd>Telescope registers<cr>
"[r]esume [p]icker
nnoremap <leader>frp <cmd>Telescope resume<cr>
"[l]ast [p]ickers
nnoremap <leader>flp <cmd>Telescope pickers<cr>
nnoremap <leader>fws <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <leader>fds <cmd>Telescope lsp_document_symbols<cr>
"'n' - netrw
nnoremap <leader>n  <cmd>Lex<cr>

"Window resizing
nnoremap <F10> :resize +2<CR>
nnoremap <F9> :resize -2<CR>
nnoremap <F12> :vertical resize +10<CR>
nnoremap <F11> :vertical resize -10<CR>

"Wrap selection with brackets or quotes
"Requires 'old' or 'inclusive' selection
vnoremap <Leader>' <Esc>`>a'<Esc>`<i'<Esc>
vnoremap <Leader>" <Esc>`>a"<Esc>`<i"<Esc>
vnoremap <Leader>( <Esc>`>a)<Esc>`<i(<Esc>
vnoremap <Leader>{ <Esc>`>a}<Esc>`<i{<Esc>
vnoremap <Leader>< <Esc>`>a><Esc>`<i<<Esc>
vnoremap <Leader>[ <Esc>`>a]<Esc>`<i[<Esc>
vnoremap <Leader>* <Esc>`>a*<Esc>`<i*<Esc>
vnoremap <Leader>` <Esc>`>a`<Esc>`<i`<Esc>

nnoremap <Leader>' a''<Esc>i
nnoremap <Leader>" a""<Esc>i
nnoremap <Leader>( a()<Esc>i
nnoremap <Leader>{ a{}<Esc>i
nnoremap <Leader>< a<><Esc>i
nnoremap <Leader>[ a[]<Esc>i
nnoremap <Leader>* a**<Esc>i
nnoremap <Leader>` a``<Esc>i

function! s:SetCppMappings()
  "C++ static cast:
  "wraps selection and puts cursor '|': 'static_cast<|>(selection)'
  vnoremap <Leader>sc <Esc>`>a)<Esc>`<istatic_cast<>(<Esc>hi
  vnoremap <Leader>rc <Esc>`>a)<Esc>`<ireinterpret_cast<>(<Esc>hi
  vnoremap <Leader>dc <Esc>`>a)<Esc>`<idynamic_cast<>(<Esc>hi
  vnoremap <Leader>cc <Esc>`>a)<Esc>`<iconst_cast<>(<Esc>hi

  nnoremap <Leader>sc astatic_cast<>()<Esc>2hi
  nnoremap <Leader>rc areinterpret_cast<>()<Esc>2hi
  nnoremap <Leader>dc adynamic_cast<>()<Esc>2hi
  nnoremap <Leader>cc aconst_cast<>()<Esc>2hi

  vnoremap <Leader>up <Esc>`>a)<Esc>`<istd::unique_ptr<>(<Esc>hi
  vnoremap <Leader>sp <Esc>`>a)<Esc>`<istd::shared_ptr<>(<Esc>hi
  vnoremap <Leader>wp <Esc>`>a)<Esc>`<istd::weak_ptr<>(<Esc>hi

  nnoremap <Leader>up astd::unique_ptr<>()<Esc>2hi
  nnoremap <Leader>sp astd::shared_ptr<>()<Esc>2hi
  nnoremap <Leader>wp astd::weak_ptr<>()<Esc>2hi

  nnoremap <Leader>lo afor (int i = 0; i < ; ++i) {}<Esc>8hi
endfunction

augroup CppMappingsGroup
  autocmd!
  autocmd FileType cpp call s:SetCppMappings()
augroup END

"Paste tabs on <Tab>; Set tab virtual size to arg
nnoremap <Leader>ut :UseTabs 
"Paste spaces in <Tab>; Set amount of spaces per <Tab>
nnoremap <Leader>us :UseSpaces 

"Font size changing. See ginit.vim
noremap <C-0> :execute "call g:GUISetFontSize(g:defaultFontSize)"<CR>
noremap <C-=> :execute "call GUIAdjustFontSize(1)"<CR>
noremap <C--> :execute "call GUIAdjustFontSize(-1)"<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        UI AND SYNTAX HIGHLIGHTING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on

"Show titlestring variable as GUI window title
set title

"relative numbers + current line number
set number relativenumber

"Colors specified columns
set colorcolumn=80,120

"Show invisible characters
"Useful characters: '»', '·', ඞ
set listchars=lead:·,trail:·,tab:\|\ 
set fillchars=horiz:—,horizup:┴,horizdown:┬,vert:│,vertleft:┤,vertright:├,verthoriz:┼
set fillchars+=eob:\ 
set fillchars+=fold:\ 
set fillchars+=stl:—

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        TABLINE WINBAR STATUSLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

exec "source " .. g:config_root .. "/tabline.vim"
exec "source " .. g:config_root .. "/winbar.vim"
exec "source " .. g:config_root .. "/statusline.vim"

function! s:SetLayoutTheme(layout_num)
  if a:layout_num == 1
    set tabline=%!GetTabLine()
    set winbar=%!GetWinBar1()
    set laststatus=3 "Show only one statusline of a current buffer at screen bottom
    set statusline=%!GetStatusLine1()
  elseif a:layout_num == 2
    set tabline=%!GetTabLine()
    set winbar=""
    set laststatus=3
    set statusline=%!GetStatusLine2()
  else
    echom "Unknown theme layout: " .. string(a:layout_num) .. ". Defaulting to 1"
    call s:SetLayoutTheme(1)
  endif
endfunction

call s:SetLayoutTheme(1)
command! -nargs=1 SetLayoutTheme call s:SetLayoutTheme(<f-args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        OTHER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Executing here, because mappings not works after leader change
exec 'luafile ' .. g:config_root .. '/lua/init.lua'

"Host-specific configs e.g. cd aliases
if (filereadable(g:local_config))
  exec "source" .. g:local_config
endif

