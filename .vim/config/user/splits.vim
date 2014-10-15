" More natural split when using default split hotkeys
set splitbelow
set splitright

" " Min and Max size
" set winheight=30
" set winminheight=5

" Faster split resizing
nnoremap <silent> <Leader>srh :exe "vertical resize " . (winwidth(0) * 4/5)<CR>
nnoremap <silent> <Leader>srl :exe "vertical resize " . (winwidth(0) * 5/4)<CR>
nnoremap <silent> <Leader>srk :exe "resize " . (winheight(0) * 5/4)<CR>
nnoremap <silent> <Leader>srj :exe "resize " . (winheight(0) * 4/5)<CR>

" Window splitting
nnoremap <Leader>swh :topleft  vnew<CR>
nnoremap <Leader>swl :botright vnew<CR>
nnoremap <Leader>swk :topleft  new<CR>
nnoremap <Leader>swj :botright new<CR>
" Buffer splitting
nnoremap <Leader>sh :leftabove  vnew<CR>
nnoremap <Leader>sl :rightbelow vnew<CR>
nnoremap <Leader>sk :leftabove  new<CR>
nnoremap <Leader>sj :rightbelow new<CR>

