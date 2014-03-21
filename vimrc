filetype off
execute pathogen#infect()
filetype plugin indent on
au BufNewFile,BufRead *.ino set filetype=cpp

set nocompatible

set modelines=0

let mapleader = ","

set tabstop=4
set shiftwidth=4
set softtabstop=4
"set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

set ignorecase
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch
"Clear out the search-bar
nnoremap <leader><space> :noh<cr>

"Move to matching brackets
"nnoremap <tab> %
"vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

"Open the .vimrc in vertical
nnoremap <leader>vi <C-w><C-v><C-l>:e $MYVIMRC<cr>

"Open new vertical
nnoremap <leader>w <C-w>v<C-w>l
"Move around in vertical
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

let g:syntastic_html_checkers=['w3']
let g:syntastic_java_checkers=['javac']
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

nnoremap <leader>jc :SyntasticJavacEditClasspath<cr>

let g:EclimCompletionMethod = 'omnifunc'
