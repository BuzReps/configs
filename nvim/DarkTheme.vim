"TODO: try colorscheme evening
"TODO: try colorscheme lunaperche
"TODO: try colorscheme murphy

function! SetDarkTheme()
  let g:BuzTheme = "Dark"
  set background=dark
  "call s:SetElflord()
  call s:SetHabamax()
endfunction

function! s:SetHabamax()
  colorscheme habamax
  hi MatchParen gui=none
  hi Vertsplit guibg=none
  hi StatusLine guibg=none guifg=#bcbcbc
  hi WinBar gui=none
  hi TabLine guibg=none guifg=#bcbcbc
  hi TabLineFill guibg=none
  "hi StatusLine guibg=#87afaf guifg=black
endfunction

function! s:SetElflord()
  colorscheme elflord

  "Line numbers
  hi TabLineSel guibg=cyan3 guifg=black gui=bold
  hi TabLine guibg=cyan4 guifg=black gui=bold
  hi WinSeparator guibg=none guifg=cyan4
  hi StatusLine guibg=cyan3 guifg=black gui=bold
  hi StatusLineNC guibg=cyan4 guifg=black gui=bold
  hi WinBar guifg=cyan
  hi WinBarNC guifg=cyan4
  hi Folded guibg=cyan4 guifg=black gui=none
  hi FoldColumn guibg=cyan4 guifg=black gui=none
  hi SignColumn guibg=none
  hi ColorColumn guibg=darkred
  "Tabs/spaces from listchars
  hi Whitespace guifg=cyan4
  hi Visual guibg=cyan4
  hi PMenu guibg=cyan4 guifg=black
  hi PMenuSel guibg=cyan guifg=black ctermbg=red
  hi DiffAdd gui=none guifg=DarkGreen guibg=none
  hi DiffDelete gui=none guifg=DarkRed guibg=none
  "Changed lines (whitespace). foreground is useless
  hi DiffChange gui=none guifg=none guibg=none
  hi DiffText gui=none guifg=DarkRed guibg=none
  hi LineNr guibg=cyan4 guifg=black
  hi LineNrAbove guibg=none guifg=cyan4
  hi link LineNrBelow LineNrAbove
  hi Normal guifg=cyan4
  hi markdownError guibg=none guifg=red
  hi MatchParen guifg=red
endfunction

