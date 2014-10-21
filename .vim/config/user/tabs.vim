"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" user/tabs.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show tabline
set showtabline=2

" Vi tab navigation
nnoremap <Leader>th :tabfirst<CR>
nnoremap <Leader>tj :tabnext<CR>
nnoremap <Leader>tk :tabprev<CR>
nnoremap <Leader>tl :tablast<CR>
nnoremap <Leader>tt :tabedit<Space>
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>tm :tabm<Space>
nnoremap <Leader>td :tabclose<CR>
