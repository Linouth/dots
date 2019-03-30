""" Netrw
let g:netrw_browser_split=4
let g:netrw_altv=1          " Split to the right
let g:netrw_liststyle=3     " Tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

""" Highlighter
let g:highlighter#auto_update = 1
let g:highlighter#project_root_signs = ['.git']

""" CoC

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * call CocActionAsync('highlight')

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

""" Lightline (CoC)
" CoC Diagnostics for Lightline
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

""" NeoTags
let g:neotags_run_ctags = 0
