set nocompatible
filetype off

call pathogen#infect()

set background=dark
colorscheme solarized

call vundle#begin()
Plugin 'fatih/vim-go'
call vundle#end()

set autoindent
set backspace=indent,eol,start
set copyindent
set cpoptions+=n
set expandtab
set modeline
set nocompatible
set nowrap
set number
set numberwidth=3
set shiftround
set shiftwidth=2
set showmatch
set smartcase
set smarttab
set softtabstop=2
set tabstop=2
set title

syntax on

set list
set listchars=tab:».,trail:•,extends:#,nbsp:•,eol:¬

filetype indent plugin on

nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>
let g:enable_numbers = 0

if has('autocmd')
  autocmd FileType go set noexpandtab
  autocmd BufWritePre *.go Fmt
endif

" For Powerline
set laststatus=2
set noshowmode
let g:Powerline_theme='short'
let g:Powerline_symbols = 'unicode'

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>gl <Plug>(go-lint)

nmap <Leader>gt :TagbarToggle<CR>
