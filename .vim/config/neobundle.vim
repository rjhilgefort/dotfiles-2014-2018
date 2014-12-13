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
	NeoBundle 'Shougo/vimproc.vim', {
	    \ 'build' : {
	    \     'windows' : 'make -f make_mingw32.mak',
	    \     'cygwin' : 'make -f make_cygwin.mak',
	    \     'mac' : 'make -f make_mac.mak',
	    \     'unix' : 'make -f make_unix.mak',
	    \    },
	    \ }

	" Language
	""""""""""
		NeoBundle 'tpope/vim-surround'
		NeoBundle 'pangloss/vim-javascript'
		" NeoBundle 'tpope/vim-markdown'
		NeoBundle 'groenewege/vim-less'
		NeoBundle 'othree/html5.vim'
		NeoBundle 'elzr/vim-json'
		NeoBundle 'cakebaker/scss-syntax.vim'
		NeoBundle 'nono/vim-handlebars'
		NeoBundle 'Chiel92/vim-autoformat'
		" NeoBundle 'suan/vim-instant-markdown'

	" Completion
	""""""""""""
		NeoBundle 'ervandew/supertab'
		" NeoBundle 'Shougo/neocomplcache.vim'
		NeoBundle 'honza/vim-snippets'
		NeoBundle 'mustache/vim-mustache-handlebars'
		NeoBundle 'heavenshell/vim-jsdoc'

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
		" NeoBundle 'kien/ctrlp.vim'
		" Unite
			NeoBundle 'Shougo/unite.vim'
			NeoBundle 'Shougo/neomru.vim'
			NeoBundle 'Shougo/unite-outline'
			NeoBundle 'thinca/vim-unite-history'
		NeoBundle 'airblade/vim-gitgutter'
		NeoBundle 'Shougo/vimshell.vim'
		NeoBundle 'christoomey/vim-tmux-navigator'
		NeoBundle 'rizzatti/dash.vim'
		NeoBundle 'edkolev/tmuxline.vim'
		" NeoBundle 'edkolev/promptline.vim'

	" Interface
	"""""""""""
		NeoBundle 'scrooloose/nerdtree'
		NeoBundle 'jistr/vim-nerdtree-tabs'
		NeoBundle 'bling/vim-airline'
		" NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
		NeoBundle 'sjl/gundo.vim'
		NeoBundle 'myusuf3/numbers.vim'
		NeoBundle 'bling/vim-bufferline'
		NeoBundle 'blueyed/vim-diminactive'

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
		NeoBundle 'junegunn/vim-easy-align'
		NeoBundle 'rhlobo/vim-super-retab'
		NeoBundle 'tpope/vim-abolish'

	" Other
	"""""""
		NeoBundle 'tpope/vim-sleuth'
		NeoBundle 'thinca/vim-qfreplace'
		" NeoBundle 'AndrewRadev/linediff.vim'
		NeoBundle 'SearchComplete'
		NeoBundle 'xolox/vim-misc'
		NeoBundle 'xolox/vim-session'

 call neobundle#end()

 filetype plugin indent on

 " Install any uninstalled bundles found on startup
 NeoBundleCheck

