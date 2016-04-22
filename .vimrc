" ~/.vimrc
" -----------------------------------------------------------------------------

set nocompatible
set encoding=utf-8
filetype plugin indent on
syntax on

" appearance
" -----------------------------------------------------------------------------
set background=dark
set cursorline
set number
set colorcolumn=81
set lines=50
set columns=81
set history=10000
set cmdheight=1
set laststatus=2
set linespace=3
set showmatch
set t_Co=256
set title
set ttyfast

" behaviour
"______________________________________________________________________________

set autochdir       " chdir to the buffer in use
set mouse=
set wrap
set spelllang=en_gb " God Save the Queen!
set textwidth=80    " line break when char > 80

" disable swap files; use scm (i.e. Git)
set nobackup
set nowb
set noswapfile

let g:tex_flavor = 'latex'

" folding
" -----------------------------------------------------------------------------
"
set foldignore=

" gvim
" -----------------------------------------------------------------------------
"
if has('gui_running')
    set guifont=Terminus\ 16
    set guioptions=
    set guicursor+=a:block-blinkon0
    inoremap <silent> <S-Insert> <Esc>"*p`]a
    inoremap <silent> <M-v> <Esc>"+p`]a
endif

" tabbing / indentation / spaces
" -----------------------------------------------------------------------------

set autoindent          " re-indent from previous line
set expandtab           " tabs to spaces
set shiftwidth=4        " indentations to spaces
set smarttab
set softtabstop=4
set tabstop=4           " tab = 4 spaces

" language-specific tabbing and indent
" -----------------------------------------------------------------------------

autocmd FileType c
    \ setlocal noexpandtab shiftwidth=8 softtabstop=8 tabstop=8

autocmd FileType make
    \ setlocal noexpandtab shiftwidth=4 softtabstop=4 tabstop=4

autocmd Filetype python 
    \setlocal expandtab tabstop=4 shiftwidth=4

" search
" -----------------------------------------------------------------------------

set hlsearch     " search result highlighting
set ignorecase   " case-insensitive search
set incsearch    " search incrementally
set smartcase
set mat=2        " ms delay before showing match

" mappings
" -----------------------------------------------------------------------------

let mapleader = ','
let maplocalleader = ','

" faster way to exit insert mode 
inoremap jj <esc>

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nnoremap <silent> <Space> :nohlsearch<CR>

" window navigation
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" real vim hackers don't use arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" copy, paste, yank to/from system clipboard
vnoremap <Leader>x "*x
nnoremap <Leader>x "*x

vnoremap <Leader>y "*y
nnoremap <Leader>y "*y

vnoremap <Leader>p "*p
nnoremap <Leader><S-P> "*P
vnoremap <Leader><S-P> "*P

" Helper Functions
" -----------------------------------------------------------------------------

au BufEnter *.c compiler gcc
autocmd BufWritePre *.c :%s/\s\+$//e

" Invoke C preprocessor on file
" Requires: Tiny C Compiler: http://bellard.org/tcc/
map <C-P>:!tcc -E %

" Plugins
" -----------------------------------------------------------------------------

" Requires: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged/')

Plug 'scrooloose/nerdtree'          " directory navigation
Plug 'bling/vim-airline'            " power line
Plug 'tpope/vim-surround'           " surround formating
Plug 'Rykka/riv.vim'
Plug 'w0ng/vim-hybrid'              " dark colorscheme
Plug 'lervag/vimtex'                " laTeX
Plug 'tikhomirov/vim-glsl'          " GLSL shader syntax
Plug 'mattn/emmet-vim'
Plug 'lervag/vimtex'
Plug 'jaxbot/browserlink.vim'       " 'Live browser editing for Vim'

call plug#end()

" Plugin Settings
" -----------------------------------------------------------------------------

colorscheme hybrid

" NERDTree
nnoremap <Leader>1 :NERDTreeToggle<CR>

" Airline
" -----------------------------------------------------------------------------

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
