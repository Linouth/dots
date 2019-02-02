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
set nu
set incsearch       " search while string is being typed
set hls             " highlight search
set listchars=tab:>>,nbsp:~     " set list to see tabs and non-breakable spaces
set linebreak
set ruler           " show current position in file
set scrolloff=5     " show lines above and below cursor
set noshowmode      " hide mode
set laststatus=2
set showcmd         " show current command
set backspace=indent,eol,start  " allow backspacing over everything
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow 0 inserts
set lazyredraw      " skip redrawing screen in some cases
set autochdir       " automatically cd to dir of last opened file
set hidden          " allow auto-hiding of edited buffers
set history=8192    " more history
set clipboard=unnamedplus       " set clipboard to ctrl-v instead of mousewheel

" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" smart case-sensitive search
set ignorecase
set smartcase

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

colorscheme dracula
