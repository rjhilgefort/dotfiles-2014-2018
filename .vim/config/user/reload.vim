"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" user/reload.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Reload .vimrc and redraw ui
if !exists("*ReloadConfig")
	function! ReloadConfig()
		" silent !clear
		source $MYVIMRC
		redraw!
		AirlineRefresh
		checktime
		echo "Locked and (Re)loaded!"
	endfunction
	" :ReloadConfig
	command! ReloadConfig call ReloadConfig()
endif

" Setup mapping
noremap <Leader>r :ReloadConfig<CR>
