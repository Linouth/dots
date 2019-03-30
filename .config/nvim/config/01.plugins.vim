" ----------------------------
" Load Plug and define plugins
" ----------------------------
call plug#begin('~/.local/share/nvim/plugged')

" Plug 'chriskempson/base16-vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'flazz/vim-colorschemes'
Plug 'dracula/vim', {'as':'dracula'}

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install --frozen-lockfile'}

Plug 'KeitaNakamura/highlighter.nvim'

call plug#end()
