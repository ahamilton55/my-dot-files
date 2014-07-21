if $COLORTERM == 'gnome-terminal'
      set t_Co=256
endif

colorscheme rootwater

set backspace=indent,eol,start
set cpoptions+=n
set expandtab
set modeline
set nocompatible
set number
set numberwidth=3
set shiftwidth=2
set softtabstop=2
set tabstop=2

syntax on

filetype indent plugin on

call pathogen#infect()

nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>
let g:enable_numbers = 0

autocmd FileType go set noexpandtab
autocmd BufWritePre *.go Fmt

" For Powerline
set laststatus=2
set noshowmode
let g:Powerline_theme='short'
let g:Powerline_symbols = 'unicode'

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
