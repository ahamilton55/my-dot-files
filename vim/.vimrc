set nocompatible
filetype off
let mapleader=","

call pathogen#infect()

set background=dark
colorscheme solarized

call vundle#begin()
"Plugin 'fatih/vim-go'
  Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
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

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

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

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

nmap <Leader>gt :TagbarToggle<CR>

"split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"split defaults
set splitbelow
set splitright

"enable folding for python
"au FileType python set foldmethod=indent
"au FileType python set foldlevel=99

"setup PEP8 for pythonf files
au BufNewFile,BufRead *.py
            \ set tabstop=2
            \ softtabstop=2
            \ shiftwidth=2
            \ expandtab
            \ autoindent
            \ fileformat=unix

"plugin for python indentation
Plugin 'vim-scripts/indentpython.vim'

"setup YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"plugin for nerdtree
Plugin 'scrooloose/nerdtree'

"Nerdtree settings
let NERDTreeIgnore=['\.pyc$', '\~$']
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
