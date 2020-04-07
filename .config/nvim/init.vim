" ----------------------------
" Load Plug and define plugins
" ----------------------------
call plug#begin('~/.local/share/nvim/plugged')

" Plug 'chriskempson/base16-vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'flazz/vim-colorschemes'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'romainl/Apprentice', {'as':'apprentice'}
Plug 'rakr/vim-one', {'as': 'one'}
Plug 'ayu-theme/ayu-vim', {'as': 'ayu'}

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug '/usr/share/vim/vimfiles'

Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

call plug#end()


" -----------------
" Syntax and indent
" -----------------
syntax on       " turn on syntax highlighting
set showmatch   " show matching braces when text indicator is over them

filetype plugin indent on   " enable file type detection

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

set autoindent


" --------------------
" Basic editing config
" --------------------
set relativenumber  " relative line numbering
set number          " linenumbers
set incsearch       " search while string is being typed
set hlsearch        " highlight search
set listchars=tab:>>,nbsp:~     " set list to see tabs and non-breakable spaces
set linebreak       " visually wrap line
set breakindent     " indent wrapped line
set showbreak=>     " show a line is wrapped
set ruler           " show current position in file
set scrolloff=5     " show lines above and below cursor
set noshowmode      " hide mode
set laststatus=2
set showcmd         " show current command
set backspace=indent,eol,start  " allow backspacing over everything
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow 0 inserts
set lazyredraw      " skip redrawing screen in some cases
" set autochdir       " automatically cd to dir of last opened file
set hidden          " allow auto-hiding of edited buffers
set history=8192    " more history
"set clipboard=unnamedplus       " set clipboard to ctrl-v instead of mousewheel

" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" smart case-sensitive search
set ignorecase
set smartcase

" Add recursive find paths
set path+=**

" tab completion for files/buffers
set wildmode=longest,list
set wildmenu
set mouse+=a        " enable mouse mode (scrolling, selection, etc)

" Change leader
let mapleader = ","


" -------------------
" Misc configurations
" -------------------

" propper splitting
set splitbelow
set splitright

set termguicolors
colorscheme ayu

command! MakeTags !ctags -R .

set updatetime=300


""" Netrw
let g:netrw_browser_split=4
let g:netrw_altv=1          " Split to the right
let g:netrw_liststyle=3     " Tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

""" Highlighter
"let g:highlighter#auto_update = 1
"let g:highlighter#project_root_signs = ['.git']

""" CoC
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * call CocActionAsync('highlight')

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

""" Lightline (CoC)
" CoC Diagnostics for Lightline
"let g:lightline = {
"      \ 'colorscheme': 'jellybeans',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ 'component_function': {
"      \   'cocstatus': 'coc#status'
"      \ },
"      \ }

""" NeoTags
"let g:neotags_run_ctags = 0


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
nnoremap <C-;> :set hlsearch!<CR>

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

" New tap/split with netrw
nnoremap <Leader>t :tabe.<CR>
nnoremap <Leader>v :vsp.<CR>
nnoremap <Leader>s :sp.<CR>
nnoremap <Leader>e :e.<CR>

" VimRC edit and reload
nnoremap gev :e $MYVIMRC<CR>
nnoremap gsv :so $MYVIMRC<CR>

                        
 " -- Logbook bindings
 nnoremap tt ggi## <Esc>"=strftime('%a %d %b %Y, %T')<CR>pa<CR><CR><CR><Esc>2ggi- <Esc>

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
