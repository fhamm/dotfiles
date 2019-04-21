set nu

set wildmenu

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set autoindent
set smartindent

set laststatus=2

" PLUGINS
" For help, check junegunn/vim-plug on GitHub

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'itchyny/lightline.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
"Plug 'ervandew/supertab'

call plug#end()
