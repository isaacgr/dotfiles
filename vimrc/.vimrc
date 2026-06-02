set nocompatible
filetype plugin indent on
syntax on

let mapleader = ";"

set number
set relativenumber
set cursorline
set scrolloff=8
set signcolumn=yes

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

set nowrap
set hidden
set noswapfile
set nobackup
set undofile

if has('win32') || has('win64')
    set undodir=$USERPROFILE\.vim\undodir
else
    set undodir=~/.vim/undodir
endif

set ignorecase
set smartcase
set incsearch
set hlsearch

set termguicolors
set background=dark
colorscheme habamax
set colorcolumn=80

if has('gui_running')
    set guifont=Cascadia\ Mono:h14
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guioptions-=L
endif

set laststatus=2
set showcmd
set showmode
set wildmenu
set wildmode=longest:full,full

set backspace=indent,eol,start
set mouse=
set updatetime=50

set splitright
set splitbelow

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap J mzJ`z

xnoremap <leader>p "_dP

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap Q <nop>

nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

nnoremap <leader>cn :cnext<CR>zz
nnoremap <leader>cp :cprev<CR>zz

nnoremap <leader>J :%!python3 -m json.tool<CR>

autocmd FileType markdown setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2

if &term =~? 'xterm' || &term =~? 'rxvt' || &term =~? 'st-'
    let &t_SI = "\e[6 q"
    let &t_EI = "\e[2 q"
endif
