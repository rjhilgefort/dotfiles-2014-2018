"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" user/wrap.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Cycle through wrap options
function! s:ToggleWrap()
	if (&wrap == 1)
		if (&linebreak == 0)
			set linebreak
			echo "set linebreak"
		else
			set nowrap
			echo "set nowrap"
		endif
	else
		set wrap
		set nolinebreak
		echo "set wrap | set nolinebreak"
	endif
endfunction

" :ToggleWrap
command! ToggleWrap call <SID>ToggleWrap()

" Go ahead and setup expected mapping
noremap cow :ToggleWrap<CR>
