" More natural split
set splitbelow
set splitright

" Min and Max size
set winheight=30
set winminheight=5

" Faster split resizing
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> > :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> < :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

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

