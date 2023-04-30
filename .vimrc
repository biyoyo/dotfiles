set nocompatible
filetype off

" Some mappings
cmap w!! w !sudo tee % > /dev/null

nmap ; :
nmap ,<space> :nohlsearch<CR>
nmap <space>w :w<CR>
nmap Q @q
nmap Y y$

imap jn <esc>

nmap <tab> gt
nmap <s-tab> gT

vmap > >gv
vmap < <gv

map <space>u :call ToggleCursorLine()<CR>


" Automatically put a shebang on new .sh files
autocmd BufNewFile *.sh :0put='#!/bin/bash'


" Completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete


" Colorscheme
colorscheme default
syntax enable
set colorcolumn=120


" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set copyindent
set smarttab
filetype plugin indent on


" Always display the status line
set laststatus=2


" Searching
set incsearch
set hlsearch
set ignorecase
set smartcase

set history=1000
set undolevels=1000
set title
set novisualbell
set noerrorbells
set belloff=all
set nowrap
set showcmd

set wildmenu
set lazyredraw
set showmatch
set number
set ruler
set backspace=indent,eol,start

set nocursorline

set background=dark
hi ColorColumn ctermbg=green

"set keymap=bulgarian-phonetic
"imap <C-B> <C-^>

"function! ToggleCursorLine()
"	if (&cursorline == 1)
"		set nocursorline
"	else
"		set cursorline
"	endif
"endfunc
