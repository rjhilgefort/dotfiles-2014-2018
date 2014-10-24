"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" user/general.vim
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
" set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb
set termencoding=utf-8

" Change leader
let mapleader = "\<Space>"

" Easier saving, and quiting
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wa :wa<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>wqa :wqa<CR>

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

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2

" Enable mouse in all modes
set mouse=a

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
set linebreak
set nowrap

" Save a file as root (,W)
noremap <Leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")

	" Enable file type detection
	filetype on

	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" autocmd BufNewFile,BufRead *.hbs setfiletype html syntax=html

endif

" Set rulers
set colorcolumn=80,120

" Disable arrow keys
let arrowKeyWarn = "You no like hjkl?"
noremap <up> :echo arrowKeyWarn<CR>
noremap <down> :echo arrowKeyWarn<CR>
noremap <left> :echo arrowKeyWarn<CR>
noremap <right> :echo arrowKeyWarn<CR>
inoremap <up> :echo arrowKeyWarn<CR>
inoremap <down> :echo arrowKeyWarn<CR>
inoremap <left> :echo arrowKeyWarn<CR>
inoremap <right> :echo arrowKeyWarn<CR>

" <Esc> key alternative
set timeout timeoutlen=500 ttimeoutlen=50
inoremap jk <Esc>
xnoremap ;; <Esc>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/node_modules/*,*/\.git/*

" Execute the current file
nnoremap <F9> :!%:p<CR>

" Search for currently selected text from visual mode
vnoremap / "vy/<c-r>v

" Repeat previous command
nnoremap <Leader>. @:

" Add spacing
nmap <Leader>h i<Space><Esc>l
nmap <Leader>j ]<Leader>
nmap <Leader>k [<Leader>
nmap <Leader>l i<Space><Esc>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Semicolon is much easier to use for commands (and not used much otherwise)
nnoremap ; :
" nnoremap : ;

