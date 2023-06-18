"Disable native tabline
GuiTabline 0

let s:defaultFont="Iosevka Fixed"
let s:defaultFontSize="12"
let s:currentFont = s:defaultFont
let s:currentFontSize = s:defaultFontSize

function! s:GUISetFontSize(fontSize)
  let g:currentFontSize = a:fontSize
  execute "GuiFont! " .. s:currentFont .. ":h" .. g:currentFontSize
endfunction

"Increase or decrease font size
function! s:GUIAdjustFontSize(adjust)
  let s:currentFontSize += a:adjust
  call g:GUISetFontSize(g:currentFontSize)
endfunction

let &guifont=s:defaultFont .. ":h" .. s:defaultFontSize
call g:GUISetFontSize(g:currentFontSize)

