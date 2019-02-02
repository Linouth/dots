" -------------------
" General keybindings
" -------------------

" map Ctrl hjkl for fast split movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" bind F3 to search highlighting
nnoremap <F3> :set hlsearch!<CR>

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" map Ctrl ; to replace regular Ctrl J (jumping)
nnoremap <C-;> <C-J>

" increase scroll speed (Ctrl E, Ctrl Y)
noremap <C-E> 8<C-E>
noremap <C-Y> 8<C-Y>


" --------------------
" Plugin configuration
" --------------------

" Tagbar
nnoremap <Leader>t :TagbarToggle<CR>

" Ctrlp
nnoremap ; :CtrlPBuffer<CR>

" Easymotion
map  <Space> <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Deoplete
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

" <C-g>; undo last insert
inoremap <expr><C-g>     deoplete#undo_completion()

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<Tab>"
