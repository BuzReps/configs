function! SetLightTheme()
  let g:BuzTheme = "Light"
  set background=light
  call s:SetQuiet()
endfunction

function! s:SetQuiet()
  colorscheme quiet
  hi StatusLine gui=none guibg=none guifg=reverse
  hi WinBar gui=none
endfunction

