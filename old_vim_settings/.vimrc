execute pathogen#infect()
filetype on
syntax on
colorscheme Tomorrow-Night
set number
set lines=35 columns=150
set colorcolumn=120
set hidden
set history=100
filetype indent on
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
autocmd BufWritePre * :%s/\s\+$//e
set hlsearch
set showmatch
set incsearch
set ignorecase
set smartcase
set ff=unix
set laststatus=2
if !has('gui_running')
      set t_Co=256
endif
filetype plugin on
