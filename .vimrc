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
			" NeoBundle 'ervandew/supertab'
			NeoBundle 'Shougo/neocomplcache.vim'
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
			" Unite
				NeoBundle 'Shougo/unite.vim'
				NeoBundle 'Shougo/neomru.vim'
				NeoBundle 'Shougo/unite-outline'
				NeoBundle 'thinca/vim-unite-history'
			NeoBundle 'airblade/vim-gitgutter'
			NeoBundle 'Shougo/vimshell.vim'
			NeoBundle 'christoomey/vim-tmux-navigator'
			NeoBundle 'rizzatti/dash.vim'
			" NeoBundle 'edkolev/tmuxline.vim'
			" NeoBundle 'edkolev/promptline.vim'
		" Interface
		"""""""""""
			NeoBundle 'scrooloose/nerdtree'
			" NeoBundle 'jistr/vim-nerdtree-tabs'
			" NeoBundle 'bling/vim-airline'
			" NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
			NeoBundle 'sjl/gundo.vim'
			NeoBundle 'myusuf3/numbers.vim'
		" Commands
		""""""""""
			NeoBundle 'ntpeters/vim-better-whitespace'
			" NeoBundle 'scrooloose/nerdcommenter'
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
			NeoBundle 'AndrewRadev/linediff.vim'
			NeoBundle 'SearchComplete'

	 call neobundle#end()

	 filetype plugin indent on

	 " Install any uninstalled bundles found on startup
	 NeoBundleCheck


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

	" Unite
	"""""""

		 nnoremap <C-p> :Unite file_rec/async<cr>

	" suan/vim-instant-markdown
	"""""""""""""""""""""""""""
		au FileType markdown setl shell=bash\ -i
		let g:instant_markdown_slow = 0
		let g:instant_markdown_autostart = 1


	" scrooloose/nerdtree
	"""""""""""""""""""""
		" Start nerdtree on startup (even if no files were specified)
		autocmd StdinReadPre * let s:std_in=1
		autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

		let NERDTreeShowHidden=1

		map <C-n> :NERDTreeToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI & Color Scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

	" Scheme
	""""""""

		set guifont=Source\ Code\ Pro\ for\ Powerline:h15
		let g:Powerline_symbols = 'fancy'
		set fillchars+=stl:\ ,stlnc:\
		" set term=xterm-256color
		" set term=screen-256color
		set t_Co=256
		set background=dark
		let base16colorspace=256  " Access colors present in 256 colorspace
		colorscheme base16-eighties

	" General
	"""""""""

		" Enable syntax highlighting
		syntax enable
		syntax on

		" Enable line numbers
		set number

		" Highlight current line
		set cursorline

	" Cursor mods
	"""""""""""""

		" set the cursor to a vertical line in insert mode and a solid block in command mode
		let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
		let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

		" Upon hitting escape to change modes, send successive move-left and move-right
		" commands to immediately redraw the cursor
		inoremap <special> <Esc> <Esc>hl

		" TODO: http://vim.wikia.com/wiki/Configuring_the_cursor

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Everything else, TODO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

	" Spell checking
	:setlocal spell spelllang=en_us
	set complete+=kspell

	" Use the OS clipboard by default (on versions compiled with `+clipboard`)
	set clipboard=unnamed

	" background buffers
	" :set hidden

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

	" Disable arrow keys, prank arrow key users
	map <up> <down>
	map <down> <up>
	map <left> <right>
	map <right> <left>
	imap <up> <down>
	imap <down> <up>
	imap <left> <right>
	imap <right> <left>

	" <Esc> key alternative
	set timeout timeoutlen=1000 ttimeoutlen=100
	" :imap jk <Esc> " TODO: If no problems with below, remove this line
	inoremap jk <Esc>
	xnoremap jk <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

	" vim-airline:
		" powerline symbols
		let g:airline#extensions#tabline#enabled = 1
		let g:airline_powerline_fonts   = 1
		let g:airline_theme             = 'base16'
		let g:airline_enable_branch     = 1
