syntax on

set hlsearch
set exrc
set secure

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set undofile

autocmd Filetype yaml set cursorcolumn
autocmd Filetype yml set cursorcolumn
" autocmd Filetype python set cursorcolumn

set ignorecase
set smartcase
set incsearch

set number
set wrap
set textwidth=79
set colorcolumn=79
set encoding=utf-8

" New vim specific
"let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf=0
"let g:ycm_python_binary_path='/Users/aditya/miniforge3/bin/python3'
"let g:ycm_path_to_python_interpreter='/Users/aditya/miniforge3/bin/python3'
" New vim specific hack
set backspace=2

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

Plug 'flazz/vim-colorschemes'

Plug 'https://github.com/machakann/vim-highlightedyank'

Plug 'scrooloose/nerdtree'

Plug 'gosukiwi/vim-atom-dark'

Plug 'rakr/vim-one'

Plug 'vim-airline/vim-airline'

Plug 'ycm-core/YouCompleteMe', {'do': './install.py --all'}

call plug#end()

filetype plugin indent on

colorscheme gruvbox
set background=dark

ab heavycheckmark ✅
