"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" maksimr/vim-jsbeautify
" https://github.com/maksimr/vim-jsbeautify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Attempting to fix spaces/tabs issue
" let s:opt_indent_char = "\t"

autocmd FileType javascript noremap <buffer> <Leader>f :call JsBeautify()<CR>:Space2Tab<CR>
autocmd FileType javascript vnoremap <buffer> <Leader>f :call RangeJsBeautify()<CR>:Space2Tab<CR>

autocmd FileType html noremap <buffer> <Leader>f :call HtmlBeautify()<CR>:Space2Tab<CR>
autocmd FileType html vnoremap <buffer> <Leader>f :call RangeHtmlBeautify()<CR>:Space2Tab<CR>

autocmd FileType css noremap <buffer> <Leader>f :call CSSBeautify()<CR>:Space2Tab<CR>
autocmd FileType css vnoremap <buffer> <Leader>f :call RangeCSSBeautify()<CR>:Space2Tab<CR>
