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

" Disable arrow keys
let arrowKeyWarn = "You no like hjkl?"
map <up> :echo arrowKeyWarn<CR>
map <down> :echo arrowKeyWarn<CR>
map <left> :echo arrowKeyWarn<CR>
map <right> :echo arrowKeyWarn<CR>
imap <up> :echo arrowKeyWarn<CR>
imap <down> :echo arrowKeyWarn<CR>
imap <left> :echo arrowKeyWarn<CR>
imap <right> :echo arrowKeyWarn<CR>

" <Esc> key alternative
set timeout timeoutlen=1000 ttimeoutlen=100
" :imap jk <Esc> " TODO: If no problems with below, remove this line
inoremap jk <Esc>
xnoremap jk <Esc>

