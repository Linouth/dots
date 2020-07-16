" ----------------------------
" Load Plug and define plugins
" ----------------------------
call plug#begin('~/.local/share/nvim/plugged')

" Color schemes
" Plug 'chriskempson/base16-vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'flazz/vim-colorschemes'
Plug 'dracula/vim', {'as':'dracula'}
" Plug 'romainl/Apprentice', {'as':'apprentice'}
" Plug 'rakr/vim-one', {'as': 'one'}
Plug 'ayu-theme/ayu-vim', {'as': 'ayu'}

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug '/usr/share/vim/vimfiles'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-which-key'

Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'

Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

call plug#end()

" Change leader
let mapleader = ","
let maplocalleader = "\\"

" ===== Playground =====

" Things to remember:
" - * (forward)
" - # (backward)
" - % (this line)

" Use <Space> for movement actions,
" Use <Leader> for anything else custom

" Playground
" just testing some stuff
" TODO: Clean this file...
" Following https://learnvimscriptthehardway.stevelosh.com/chapters/15.html

" Surround selection with quotes
vnoremap <Leader>" c""<esc>P
vnoremap <Leader>' c''<esc>P


" alt for <esc>
inoremap jl <esc>
inoremap <esc> <nop>

noremap Y "+y

nnoremap - <c-w>_
nnoremap = <c-w>=

" Insert single character
nnoremap <Leader>i i_<Esc>r
nnoremap <Leader>a a_<Esc>r

" Replace all instances of the word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<left><left>

noremap <c-q> :q<CR>

set colorcolumn=80
au BufReadPost,BufNewFile *.md setlocal tw=79


" <Space> movement bindings
nnoremap <space>f :Files<cr>
nnoremap <space>t :Tags<cr>
nnoremap <space>b :Buffers<cr>
nnoremap <space>g :Rg<cr>
nnoremap <space>l :Lines<cr>
nnoremap <space>h :Helptags<cr>

nnoremap <space>s :Startify<cr>


" Git bindings
" nnoremap <Leader>g :Git 
nnoremap <Leader>gg :Git 
nnoremap <Leader>ga :Git add<cr>
nnoremap <Leader>gc :Git commit<cr>
nnoremap <Leader>gb :Gbrowse<cr>
nnoremap <Leader>gd :Gdiffsplit<cr>
nnoremap <Leader>gt :SignifyToggle<cr>
nnoremap <Leader>gp :SignifyHunkDiff<cr>
nnoremap <Leader>gu :SignifyHunkUndo<cr>
" Hunk jumping: ]c [c ]C [C
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)


nnoremap <silent> <Leader> :WhichKey ','<CR>
nnoremap <silent> <space> :WhichKey '<Space>'<CR>

" Configure <Leader> <i> to jump to window <i>
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR><c-w>_'
    let i = i + 1
endwhile

" ===== END Playground =====
" TODO: Clean this mess up...


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

" Colors
set termguicolors
colorscheme dracula

function! StatusLine()
    return '%1* %{winnr()} %*'
        \. '%2*%{StatusCoc()}%*'
        \. ' %<%.30f '
        \. '%3*%m%r%*'
        \. '%='
        \. '%{FugitiveStatusline()}'
        \. '%{sy#repo#get_stats_decorated()}'
        \. '%y '
        \. '%P '
        \. '%4l/%-4L'
endfunction

function! StatusCoc()
    let status = coc#status()
    if empty(status) | return '' | endif
    return ' ' . status . ' '
endfunction

set statusline=%!StatusLine()
hi User1 gui=bold guifg=#14191F guibg=#f07178
hi User2 gui=none guifg=#f07178 guibg=#3E4B59
hi User3 gui=none guifg=#f07178 guibg=#14191F


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
set timeout timeoutlen=500      " fix slow 0 inserts
set lazyredraw      " skip redrawing screen in some cases set autochdir
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


" -------------------
" Misc configurations
" -------------------

" propper splitting
set splitbelow
set splitright

command! MakeTags !ctags -R .

set cmdheight=2

set updatetime=100


""" Netrw
let g:netrw_browser_split=4
let g:netrw_altv=1          " Split to the right
let g:netrw_liststyle=3     " Tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

""" CoC
" Highlight symbol under cursor on CursorHold
augroup CocAutocommands
    autocmd!
    autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

set shortmess+=c
set signcolumn=yes


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
" nnoremap <Leader>s :sp.<CR>
nnoremap <Leader>e :e.<CR>

" VimRC edit and reload
nnoremap <Leader>ev :vsp $MYVIMRC<CR>
nnoremap <Leader>eV :e $MYVIMRC<CR>
nnoremap <Leader>sv :so $MYVIMRC<CR>

" -- Logbook bindings
nnoremap tt ggi## <Esc>"=strftime('%a %d %b %Y, %T')<CR>
            \pa<CR><CR><CR><Esc>2ggi- <Esc>

" --------------------
" Plugin configuration
" --------------------

""" CoC Keybindings
" use <tab> for trigger completion and navigate to next complete item
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  " elseif &filetype == 'python'
  "   execute 'split|enew|put =system(''pydoc '.expand('<cword>')
  "               \''')|set ro|set nomod'
  elseif &filetype == 'c'
    execute 'Man '.expand('<cexpr>')<cr>
  else
    call CocAction('doHover')
  endif
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
