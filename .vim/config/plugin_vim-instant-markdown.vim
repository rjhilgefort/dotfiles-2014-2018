"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" suan/vim-instant-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fixes issue with auto loading/reloading in browser
au FileType markdown setl shell=bash\ -i

" Slow down markdown reload if buggy
let g:instant_markdown_slow = 0

let g:instant_markdown_autostart = 1

