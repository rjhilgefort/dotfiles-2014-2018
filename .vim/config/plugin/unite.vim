"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
" let g:unite_split_rule = "botright"
" let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10

" ack > grep
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

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
endfunction

" General config
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#custom#source('buffer,file,file_rec,file_rec/async', 'sorters', ['sorter_rank', 'sorter_length'])
" call unite#custom#source('file_rec/async', 'ignore_globs', split(&wildignore, ','))
" call unite#custom#source('file_rec/async', 'converters', [])
" call unite#custom#source('file_rec/async', 'max_candidates', 24)

" prettier output
" call unite#custom#source('buffer', 'converters', ['converter_file_directory'])

nmap <C-p> <Leader>uf
nnoremap <Leader>uf :Unite file_rec/async:!<CR>

