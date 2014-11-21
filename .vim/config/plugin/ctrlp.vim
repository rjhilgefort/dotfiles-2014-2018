"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp.vim
"
" TODO: Add ack fall back
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show hidden files
let g:ctrlp_show_hidden = 1

" Show search on top of VIM
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0

" Always start in regexp search mode
" let g:ctrlp_regexp = 1

" Use common cache
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" Use ag for file list
if executable('ag')
  let g:ctrlp_user_command = 'ag %s' .
	\ ' -l' .
	\ ' --follow' .
	\ ' --nocolor' .
	\ ' --nogroup' .
	\ ' --hidden' .
	\ ' --ignore ".git"' .
	\ ' -g ""'
endif

