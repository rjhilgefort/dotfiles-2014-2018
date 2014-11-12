"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" user/splits.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" More natural split when using default split hotkeys
set splitbelow
set splitright

" " Min and Max size
set winheight=30
set winminheight=5

" Reset all split resizing
nnoremap <silent> <Leader>srr <C-W>=

" Faster split resizing
nnoremap <silent> <Leader>srh :exe "vertical resize " . (winwidth(0) * 4/5)<CR>
nnoremap <silent> <Leader>srl :exe "vertical resize " . (winwidth(0) * 5/4)<CR>
nnoremap <silent> <Leader>srk :exe "resize " . (winheight(0) * 5/4)<CR>
nnoremap <silent> <Leader>srj :exe "resize " . (winheight(0) * 4/5)<CR>

" Standard split resizing
" nnoremap <silent> <Leader>srh <C-W><
" nnoremap <silent> <Leader>srl <C-W>>
" nnoremap <silent> <Leader>srk <C-W>+
" nnoremap <silent> <Leader>srj <C-W>-

" Window splitting
nnoremap <silent> <Leader>swh :topleft  vnew<CR>
nnoremap <silent> <Leader>swl :botright vnew<CR>
nnoremap <silent> <Leader>swk :topleft  new<CR>
nnoremap <silent> <Leader>swj :botright new<CR>

" Buffer splitting
nnoremap <silent> <Leader>sh :leftabove  vnew<CR>
nnoremap <silent> <Leader>sl :rightbelow vnew<CR>
nnoremap <silent> <Leader>sk :leftabove  new<CR>
nnoremap <silent> <Leader>sj :rightbelow new<CR>

" Quit current split
nnoremap <silent> <Leader>sd <C-W>d

" Quit all but current split
nnoremap <silent> <Leader>sdd <C-W>o

