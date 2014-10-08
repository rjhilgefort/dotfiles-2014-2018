"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NEOBUNDLE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif

 if has('vim_starting')
   set nocompatible " Be iMproved
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 call neobundle#begin(expand('~/.vim/bundle/'))

 " Plugins
 " REF: http://vimawesome.com
 """"""""""""""""""""""""""""

	" Let NeoBundle manage NeoBundle
	NeoBundleFetch 'Shougo/neobundle.vim'

	" Install vimproc.vim
	let g:make = 'gmake'
	if system('uname -o') =~ '^GNU/'
		let g:make = 'make'
	endif
	NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': g:make}}

	" Language
	""""""""""
		NeoBundle 'tpope/vim-surround'
		NeoBundle 'pangloss/vim-javascript'
		NeoBundle 'tpope/vim-markdown'
		NeoBundle 'groenewege/vim-less'
		NeoBundle 'othree/html5.vim'
		NeoBundle 'elzr/vim-json'
		NeoBundle 'cakebaker/scss-syntax.vim'
		NeoBundle 'nono/vim-handlebars'
		NeoBundle 'Chiel92/vim-autoformat'
		NeoBundle 'suan/vim-instant-markdown'

	" Completion
	""""""""""""
		NeoBundle 'ervandew/supertab'
		" NeoBundle 'Shougo/neocomplcache.vim'
		NeoBundle 'honza/vim-snippets'
		NeoBundle 'mustache/vim-mustache-handlebars'

	" Code Display
	""""""""""""""
		NeoBundle 'nathanaelkane/vim-indent-guides'
		NeoBundle 'chriskempson/base16-vim'
		NeoBundle 'tomasr/molokai'

	" Integrations
	""""""""""""""
		NeoBundle 'tpope/vim-fugitive'
		NeoBundle 'scrooloose/syntastic'
		NeoBundle 'mileszs/ack.vim'
		NeoBundle 'rking/ag.vim'
		NeoBundle 'kien/ctrlp.vim'
		" Unite
			" NeoBundle 'Shougo/unite.vim'
			" NeoBundle 'Shougo/neomru.vim'
			" NeoBundle 'Shougo/unite-outline'
			" NeoBundle 'thinca/vim-unite-history'
		NeoBundle 'airblade/vim-gitgutter'
		NeoBundle 'Shougo/vimshell.vim'
		NeoBundle 'christoomey/vim-tmux-navigator'
		NeoBundle 'rizzatti/dash.vim'
		NeoBundle 'edkolev/tmuxline.vim'
		" NeoBundle 'edkolev/promptline.vim'

	" Interface
	"""""""""""
		NeoBundle 'scrooloose/nerdtree'
		" NeoBundle 'jistr/vim-nerdtree-tabs'
		NeoBundle 'bling/vim-airline'
		" NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
		NeoBundle 'sjl/gundo.vim'
		NeoBundle 'myusuf3/numbers.vim'

	" Commands
	""""""""""
		NeoBundle 'ntpeters/vim-better-whitespace'
		NeoBundle 'tpope/vim-commentary'
		NeoBundle 'Lokaltog/vim-easymotion'
		NeoBundle 'godlygeek/tabular'
		NeoBundle 'tpope/vim-repeat'
		NeoBundle 'tpope/vim-unimpaired'
		NeoBundle 'tpope/vim-sensible'
		NeoBundle 'terryma/vim-multiple-cursors'
		NeoBundle 'bronson/vim-toggle-wrap'

	" Other
	"""""""
		NeoBundle 'tpope/vim-sleuth'
		NeoBundle 'thinca/vim-qfreplace'
		" NeoBundle 'AndrewRadev/linediff.vim'
		NeoBundle 'SearchComplete'

 call neobundle#end()

 filetype plugin indent on

 " Install any uninstalled bundles found on startup
 NeoBundleCheck

