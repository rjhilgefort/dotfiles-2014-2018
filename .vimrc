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
		 """""""""

				" Let NeoBundle manage NeoBundle
				NeoBundleFetch 'Shougo/neobundle.vim'
				
				" Install vimproc.vim
				let g:make = 'gmake'
				if system('uname -o') =~ '^GNU/'
						let g:make = 'make'
				endif
				NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': g:make}}
				
				NeoBundle 'airblade/vim-gitgutter'

		""""""""""
		" /Plugins

		 call neobundle#end()

		 filetype plugin indent on

		 " Install any uninstalled bundles found on startup
		 NeoBundleCheck

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

		" Color Scheme
		syntax enable
		set background=dark
		let base16colorspace=256  " Access colors present in 256 colorspace
		colorscheme base16-eighties
		
		set number
		
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

		" Change mapleader
		let mapleader=","

		" Don’t add empty newlines at the end of files
		"set binary
		"set noeol

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

		" Enable per-directory .vimrc files and disable unsafe commands in them
		set exrc
		set secure

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
		set list " nolist

		" Highlight searches
		set hlsearch

		" Ignore case of searches
		set ignorecase

		" Highlight dynamically as pattern is typed
		set incsearch

		" Always show status line
		set laststatus=2

		" Enable mouse in all modes
		set mouse=

		" Disable error bells
		"set noerrorbells

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

		" Use relative line numbers
		"if exists("&relativenumber")
		"	set relativenumber
		"	au BufReadPost * set relativenumber
		"endif

		" Start scrolling three lines before the horizontal window border
		set scrolloff=3

		" No wordwrap
		set nowrap

		" Strip trailing whitespace (,ss)
		function! StripWhitespace()
			let save_cursor = getpos(".")
			let old_query = getreg('/')
			:%s/\s\+$//e
			call setpos('.', save_cursor)
			call setreg('/', old_query)
		endfunction
		noremap <leader>ss :call StripWhitespace()<CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
		let g:ctrlp_working_path_mode = 'ra'
		let g:ctrlp_show_hidden = 1
		let g:ctrlp_user_command = 'find %s -type f'
		let g:ctrlp_custom_ignore = {
		  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
		  \ 'file': '\v\.(exe|so|dll)$',
		  \ }

