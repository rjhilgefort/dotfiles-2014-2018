"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:unite_source_history_yank_enable = 1

" ack >> grep
if executable('ack')
	let g:unite_source_grep_command = 'ack'
	let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
	let g:unite_source_grep_recursive_opt = ''
endif

" ag > ack
if executable('ag')
	let g:unite_source_grep_command = 'ag'
	let g:unite_source_grep_default_opts = '--nogroup --nocolor --column --hidden'
	let g:unite_source_grep_recursive_opt = ''
	let g:unite_source_rec_async_command = 'ag' .
		\ ' --follow' .
		\ ' --nocolor' .
		\ ' --nogroup' .
		\ ' --hidden' .
		\ ' --ignore ".git"' .
		\ ' -g ""'
endif

" Height of search box
call unite#custom#profile('default', 'context', {
\   'winheight': 24,
\ })


call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('buffer,file,file_rec,file_rec/async', 'sorters', ['sorter_rank', 'sorter_length'])
call unite#custom#source('file_rec/async', 'ignore_globs', split(&wildignore, ','))
call unite#custom#source('file_rec/async', 'converters', [])
call unite#custom#source('file_rec/async', 'max_candidates', 24)
" prettier output
call unite#custom#source('buffer', 'converters', ['converter_file_directory'])

" Search with ctrl+p
nnoremap <C-p> :Unite -start-insert file_rec/async:!<CR>

