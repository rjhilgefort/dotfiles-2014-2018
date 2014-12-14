"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lokaltog/vim-easymotion
" https://github.com/Lokaltog/vim-easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" keep cursor colum when JK motion
let g:EasyMotion_startofline = 0

" Smartcase search setttings
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 0

" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1

" Prefer the home row
let g:EasyMotion_keys = 'JKL;ASDFBCEGHIMNOPQRTUVWXYZ'
" let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'

let g:EasyMotion_enter_jump_first = 1

" Easymotion entrance binding
nmap <Leader><Leader> <Plug>(easymotion-prefix)

" Repeat last easymotion
nmap <Leader><Leader><Leader> <Plug>(easymotion-repeat)

" Common, fast access to easymotion
nmap s <Plug>(easymotion-s)
nmap t <Plug>(easymotion-t)

" Replace Vim default search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Avoid hjkl repetition
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

