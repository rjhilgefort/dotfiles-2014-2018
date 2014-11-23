"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin/visual-selection.vim
" http://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Why is this not a built-in Vim script function?!
function! s:GetVisualSelection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ?  1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

" :GetVisualSelection
command! GetVisualSelection call <SID>GetVisualSelection()
