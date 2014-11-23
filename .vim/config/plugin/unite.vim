"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
	let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --hidden --ignore ".git" -g ""'
endif

" Profile
let g:unite_source_history_yank_enable = 1
let g:unite_matcher_fuzzy_max_input_length = 32

" Custom mappings for the unite buffer
function! s:uniteSettings()
	" Play nice with supertab
	let b:SuperTabDisabled=1

	" Enable navigation with control-j and control-k in insert mode (like `ctrl-p`)
	imap <buffer> <C-j> <Plug>(unite_select_next_line)
	imap <buffer> <C-k> <Plug>(unite_select_previous_line)

	" Toggle file preview
	map <buffer> P <Plug>(unite_toggle_auto_preview)
endfunction
autocmd FileType unite call s:uniteSettings()

" General config
" call unite#filters#matcher_default#use(['matcher_glob'])
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('buffer,file,file_rec,file_rec/async', 'sorters', ['sorter_selecta', 'sorter_rank'])
call unite#custom#source('file_rec/async', 'ignore_globs', split(&wildignore, ','))
call unite#custom#source('file_rec/async', 'converters', [])
call unite#custom#source('file_rec/async', 'max_candidates', 24)

" Prettier output
call unite#custom#source('buffer', 'converters', ['converter_file_directory'])


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Default settings
call unite#custom#profile('default', 'context', {
	\ 'winheight': 25,
	\ 'start_insert': 1,
	\ 'auto_preview': 0,
	\ 'vertical_preview': 1,
\ })

" Feature Settings
call unite#custom#profile('files', 'context', {})
call unite#custom#profile('flat', 'context', {})
call unite#custom#profile('file_mru', 'context', {})
call unite#custom#profile('buffer', 'context', {})
call unite#custom#profile('grep', 'context', { 'start_insert': 0 })
call unite#custom#profile('outline', 'context', { 'auto_preview': 1 })
call unite#custom#profile('change', 'context', { 'auto_preview': 1 })
call unite#custom#profile('line', 'context', {})
call unite#custom#profile('yank', 'context', {})
call unite#custom#profile('command', 'context', {})
call unite#custom#profile('mapping', 'context', {})


"""
" Create a unite feature bind
"
" @param feature: Unite feature to setup
" @param bind: Key to bind to after `<Leader>u`
" @param a:1: Override Unite feature bind command
"
" EX: nnoremap <Leader>ub :Unite -buffer-name=buffer -toggle buffer<CR>
"""
function! s:uniteFeatureBind(feature, bind, ...)
	let l:featureCommand = (a:0 >= 1) ? a:1 : a:feature

	execute 'nnoremap <Leader>u' . a:bind . ' :Unite -buffer-name=' . a:feature . ' -toggle ' . l:featureCommand . '<CR>'
endfunction

call s:uniteFeatureBind('files',    'p', 'file_rec/async:!')
call s:uniteFeatureBind('flat',     'f', 'file directory directory/new file/new')
call s:uniteFeatureBind('file_mru', 'r')
call s:uniteFeatureBind('buffer',   'b')
call s:uniteFeatureBind('grep',     'g', 'grep:.')
call s:uniteFeatureBind('outline',  'o')
call s:uniteFeatureBind('change',   'u')
call s:uniteFeatureBind('line',     'l')
call s:uniteFeatureBind('yank',     'y', 'history/yank')
call s:uniteFeatureBind('command',  ';', 'history/command')
call s:uniteFeatureBind('mapping',  'm')

" Shortcuts
" nmap <Leader>uu <Leader>up
nmap <C-p> <Leader>up

