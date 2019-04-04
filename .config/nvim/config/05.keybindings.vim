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

" Buffer traversal
nnoremap gb :b #<CR>
nnoremap gn :ls<CR>:buffer<Space>

" Abbreviate :vert sf to :vsf
cnoreabbrev vsf vert sf

" VimRC edit and reload
nnoremap gev :e $MYVIMRC<CR>
nnoremap gsv :so $MYVIMRC<CR>

" --------------------
" Plugin configuration
" --------------------

""" Easymotion
" map  <Space> <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

""" CoC Keybindings

" use <tab> for trigger completion and navigate to next complete item
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" CocList bindings
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Search files in cwd
nnoremap <silent> <space>f  :<C-u>CocList files<cr>
" Grep files in cwd
nnoremap <silent> <space>g  :<C-u>CocList -I grep<cr>
" Search buffer
nnoremap <silent> <space>b  :<C-u>CocList buffers<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
