filetype on
filetype plugin on
filetype indent on
syntax on

set tabstop=4
set shiftwidth=4
set expandtab
set incsearch
set ignorecase

colorscheme desert

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType html source ~/.vimrc.html
autocmd FileType txt set tabstop=2 smarttab

colorscheme desert

" This is a weird fix for WSL so Vim doesn't open in --REPLACE-- mode
" Not sure exactly what this does, but solves the issue
set t_u7=
