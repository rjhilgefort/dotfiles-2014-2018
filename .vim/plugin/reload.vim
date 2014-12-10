"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin/reload.vim
" @author rjhilgefort@gmail.com
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Reload .vimrc and redraw ui
if !exists("*ReloadConfig")
	function! s:ReloadConfig()
		" silent !clear
		source $MYVIMRC
		redraw!
		AirlineRefresh
		bufdo e
		" checktime
		echo "Locked and (Re)loaded!"
	endfunction

	" :ReloadConfig
	command! ReloadConfig call <SID>ReloadConfig()
endif

