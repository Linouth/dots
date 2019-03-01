" ----------------------------
" Load Plug and define plugins
" ----------------------------
call plug#begin('~/.local/share/nvim/plugged')

Plug 'chriskempson/base16-vim'
" Plug 'arcticicestudio/nord-vim'
Plug 'flazz/vim-colorschemes'

" Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'lepture/vim-jinja', { 'for': 'jinja' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'evidens/vim-twig', { 'for': 'twig' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'lervag/vimtex', { 'for': 'latex' }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-syntax'
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

Plug 'KeitaNakamura/highlighter.nvim'

call plug#end()
