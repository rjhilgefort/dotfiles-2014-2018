"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" xolox/vim-sessions
" https://github.com/xolox/vim-session 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:session_command_aliases = 1
let g:session_default_name = 'default'
let g:session_verbose_messages = 0
let g:session_persist_colors = 0

" Autoload sessions when entering vim?
" 'prompt', 'yes', 'no'
let g:session_autoload = 'no'

" Autosave sessions when exiting vim?
" 'prompt', 'yes', 'no'
let g:session_autosave = 'yes'

" Overwrite default session when working with unnamed session?
let g:session_default_overwrite = 1

" Periodically save sessions (every _ minute(s))? 0 to disable
let g:session_autosave_periodic = 5

