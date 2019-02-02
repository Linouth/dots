""" CtrlP
let g:ctrlp_switch_buffer = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " Ignore files in gitignore
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


""" Deoplete
let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#clang#libclang_path = '/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

" Use smartcase.
call deoplete#custom#option('smart_case', v:true)

" Disable comment/string completion
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

" clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/'


""" Jedi-VIM
let g:jedi#completions_enabled = 0


""" Highlighter
let g:highligher#auto_update = 2
let g:highlighter#project_root_signs = ['.git']


""" Ale linter
" let g:ale_c_parse_makefile = 1
let g:ale_c_parse_compile_commands = 1
" let g:ale_c_clang_options = '-I/home/marten/src/ESP32/btrecv/ /home/marten/src/ESP32/esp-idf/components/**/include/**'

