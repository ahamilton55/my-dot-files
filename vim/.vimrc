if $COLORTERM == 'gnome-terminal'
      set t_Co=256
endif

"source $VIMRUNTIME/colors/rootwater.vim
"colorscheme desert256
colorscheme rootwater

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

set modeline
set number
set numberwidth=3
set cpoptions+=n

syntax on

filetype indent plugin on

set nocompatible
set laststatus=2
let g:Powerline_symbols = 'unicode'

call pathogen#infect()

nnoremap <F3> :NumbersToggle<CR>
