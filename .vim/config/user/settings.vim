"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" user/settings.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use UTF-8 without BOM
set encoding=utf-8 nobomb
set termencoding=utf-8

" Spell checking
:setlocal spell spelllang=en_us
set complete+=kspell

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Allow cursor keys in insert mode
set esckeys

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

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
set noexpandtab

" Show “invisible” characters
set lcs=tab:»\ ,trail:·,eol:¬,nbsp:_
set nolist

" Enable mouse in all modes
set mouse=a

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Set rulers
set colorcolumn=80,120

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the (partial) command as it’s being typed
set showcmd

" Show the filename in the window titlebar
set title

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" No wordwrap
set linebreak
set nowrap

" Line numbers
set norelativenumber
set nonumber

" Automatic commands
if has("autocmd")

	" Enable file type detection
	filetype on

	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" autocmd BufNewFile,BufRead *.hbs setfiletype html syntax=html

endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/node_modules/*,*/\.git/*

