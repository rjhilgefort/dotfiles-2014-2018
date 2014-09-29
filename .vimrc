"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NEOBUNDLE:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

	" Note: Skip initialization for vim-tiny or vim-small.
	 if !1 | finish | endif

	 if has('vim_starting')
	   set nocompatible " Be iMproved
	   set runtimepath+=~/.vim/bundle/neobundle.vim/
	 endif

	 call neobundle#begin(expand('~/.vim/bundle/'))

	 " Plugins

		" Let NeoBundle manage NeoBundle
		NeoBundleFetch 'Shougo/neobundle.vim'

		" Install vimproc.vim
		let g:make = 'gmake'
		if system('uname -o') =~ '^GNU/'
			let g:make = 'make'
		endif
		NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': g:make}}

		" enhancements
			NeoBundle 'tpope/vim-repeat'	" let `.` repeat things like plugin mappings
			NeoBundle 'ervandew/supertab'	" <tab>-complete in insert mode
			NeoBundle 'SearchComplete'		" <tab>-complete in the search prompt
			" NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

		" navigation
			NeoBundle 'Lokaltog/vim-easymotion'

		" languages
			NeoBundle 'Chiel92/vim-autoformat'				" jsjbuetifier
			NeoBundle 'mustache/vim-mustache-handlebars'

		" unite
			NeoBundle 'Shougo/unite.vim'
			NeoBundle 'Shougo/neomru.vim'
			NeoBundle 'Shougo/unite-outline'
			NeoBundle 'thinca/vim-unite-history'

		" utils
			NeoBundle 'tpope/vim-sensible'				" sensible default settings
			NeoBundle 'tpope/vim-sleuth'				" auto-detuct indent settings
			NeoBundle 'tpope/vim-surround'
			NeoBundle 'tpope/vim-commentary'			" comment mappings
			NeoBundle 'tpope/vim-unimpaired'			" settings toggles and symmetrical before/after mappings
			NeoBundle 'scrooloose/nerdtree'
			NeoBundle 'jistr/vim-nerdtree-tabs'
			NeoBundle 'sjl/gundo.vim'					" visualized undo tree
			NeoBundle 'terryma/vim-multiple-cursors'	" better multiple-cursor functionality
			NeoBundle 'AndrewRadev/linediff.vim'		" diff two selections
			NeoBundle 'scrooloose/syntastic'
			NeoBundle 'thinca/vim-qfreplace'
			NeoBundle 'ntpeters/vim-better-whitespace'	" show trailing whitespace, and provide a command to clean it

		" UI
			" NeoBundle 'bling/vim-airline'
			NeoBundle 'tomasr/molokai'

		" integration
			NeoBundle 'tpope/vim-fugitive'
			NeoBundle 'airblade/vim-gitgutter'
			NeoBundle 'rking/ag.vim' " ack-flack

		" external
			NeoBundle 'christoomey/vim-tmux-navigator'
			" NeoBundle 'edkolev/tmuxline.vim'
			" NeoBundle 'edkolev/promptline.vim'

	""""""""""
	" /Plugins

	 call neobundle#end()

	 filetype plugin indent on

	 " Install any uninstalled bundles found on startup
	 NeoBundleCheck

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI & Color Scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

	set number
	syntax enable

	set guifont=Source\ Code\ Pro\ for\ Powerline:h15
	let g:Powerline_symbols = 'fancy'
	set fillchars+=stl:\ ,stlnc:\
	set term=xterm-256color
	" set term=screen-256color
	set t_Co=256
	set background=dark
	let base16colorspace=256  " Access colors present in 256 colorspace
	colorscheme base16-eighties

	" Use the OS clipboard by default (on versions compiled with `+clipboard`)
	set clipboard=unnamed

	" Enhance command-line completion
	set wildmenu

	" Allow cursor keys in insert mode
	set esckeys

	" Allow backspace in insert mode
	set backspace=indent,eol,start

	" Optimize for fast terminal connections
	set ttyfast

	" Add the g flag to search/replace by default
	set gdefault

	" Use UTF-8 without BOM
	set encoding=utf-8 nobomb
	set termencoding=utf-8

	" Change mapleader
	let mapleader=","

	" Centralize backups, swapfiles and undo history
	set backupdir=~/.vim/backups
	set directory=~/.vim/swaps
	if exists("&undodir")
		set undodir=~/.vim/undo
	endif

	" Don’t create backups when editing files in certain directories
	set backupskip=/tmp/*,/private/tmp/*

	" Respect modeline in files
	set modeline
	set modelines=4

	" Enable line numbers
	set number

	" Enable syntax highlighting
	syntax on

	" Highlight current line
	set cursorline

	" Make tabs as wide as four spaces
	set tabstop=4

	" Show “invisible” characters
	set lcs=tab:»\ ,trail:·,eol:¬,nbsp:_
	set nolist " set nolist

	" Ignore case of searches
	set ignorecase

	" Highlight dynamically as pattern is typed
	set incsearch

	" Always show status line
	set laststatus=2

	" Enable mouse in all modes
	set mouse=

	" Don’t reset cursor to start of line when moving around.
	set nostartofline

	" Show the cursor position
	set ruler

	" Don’t show the intro message when starting Vim
	set shortmess=atI

	" Show the current mode
	set showmode

	" Show the filename in the window titlebar
	set title

	" Show the (partial) command as it’s being typed
	set showcmd

	" Start scrolling three lines before the horizontal window border
	set scrolloff=3

	" No wordwrap
	set nowrap

	" Save a file as root (,W)
	noremap <leader>W :w !sudo tee % > /dev/null<CR>

	" Automatic commands
	if has("autocmd")

		" Enable file type detection
		filetype on

		" Treat .json files as .js
		autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
		autocmd BufNewFile,BufRead *.hbs setfiletype html syntax=html

	endif

	" Set rulers
	set colorcolumn=80,120

	" Disable arrow keys
	map <up> <nop>
	map <down> <nop>
	map <left> <nop>
	map <right> <nop>
	imap <up> <nop>
	imap <down> <nop>
	imap <left> <nop>
	imap <right> <nop>

	" <Esc> key alternative
	set timeout timeoutlen=1000 ttimeoutlen=100
	:imap jk <Esc>

	" vim-airline:
		" powerline symbols
		let g:airline#extensions#tabline#enabled = 1
		let g:airline_powerline_fonts   = 1
		" let g:airline_theme             = 'base16-eighties'
		let g:airline_enable_branch     = 1
