"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" user/buffers.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" List buffers
nnoremap <Leader>bb :buffers<CR>

" Buffer navigation
nnoremap <Leader>bh :bfirst<CR>
nnoremap <Leader>bj :bnext<CR>
nnoremap <Leader>bk :bprevious<CR>
nnoremap <Leader>bl :blast<CR>

" Buffer split and navigate
nnoremap <Leader>bsh :sbfirst<CR>
nnoremap <Leader>bsj :sbnext<CR>
nnoremap <Leader>bsk :sbprevious<CR>
nnoremap <Leader>bsl :sblast<CR>

" Unload current buffer
nnoremap <Leader>bd :Bclose<CR>:bnext<CR>

" Unload all buffers and reset NERDTree
nnoremap <Leader>bdd :1,1000bd<CR>:NERDTreeToggle<CR>
