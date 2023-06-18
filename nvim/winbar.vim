""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        WINBAR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("g:buz_winbar")
  finish
endif
let g:buz_winbar = 1

exec "source " .. g:config_root .. "/common.vim"

"Example:
"Buf:21                    init.vim Win:2
"Example for active buffer:
"Buf:21                  [init.vim] Win:2
function! GetWinBar1()
  let winInfo = getwininfo(g:statusline_winid)[0]
  "let bufInfo = getbufinfo(winInfo.bufnr)[0]
  let winNum = string(win_id2win(g:statusline_winid))
  if winInfo.bufnr == bufnr()
    let file_name = "[%f]"
  else
    let file_name = "%f"
  endif
  "%= align right; %m modifiable flag; %f file relpath

  return "Buf:" .. string(winInfo.bufnr) .. "%=%m " .. file_name .. " Win:" .. winNum
endfunction

