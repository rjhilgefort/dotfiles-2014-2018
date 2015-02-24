"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" maksimr/vim-jsbeautify
" https://github.com/maksimr/vim-jsbeautify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType javascript noremap <buffer> <Leader>f :call JsBeautify()<CR>
autocmd FileType javascript vnoremap <buffer> <Leader>f :call RangeJsBeautify()<CR>

autocmd FileType html noremap <buffer> <Leader>f :call HtmlBeautify()<CR>
autocmd FileType html vnoremap <buffer> <Leader>f :call RangeHtmlBeautify()<CR>

autocmd FileType css noremap <buffer> <Leader>f :call CSSBeautify()<CR>
autocmd FileType css vnoremap <buffer> <Leader>f :call RangeCSSBeautify()<CR>
