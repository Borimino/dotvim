" Pathogen {{{
filetype off
execute pathogen#infect()
Helptags
filetype plugin indent on
" }}}

" Arduino {{{
au BufNewFile,BufRead *.ino set filetype=cpp
" }}}

" Automatically source .vimrc on saving {{{
autocmd! bufwritepost .vimrc :source %
" }}}

" Basic options {{{
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
"set undofile

set ignorecase
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch
"Clear out the search-bar
nnoremap <leader><space> :noh<cr>

let g:ctrlp_match_window = 'top,order:ttb'

"let g:Powerline_symbols = 'fancy'
" }}}

" Mappings {{{
"Open the .vimrc in vertical
"nnoremap <leader>vi <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>vi :50vs<cr>:e $MYVIMRC<cr>

"Open new vertical
nnoremap <leader>w <C-w>v<C-w>l
"Move around in vertical
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

"Taglist
nnoremap <silent> <Leader>t :TlistToggle<CR>

"noremap <C-o> <C-T>
"noremap <C-i> <C-]>

"Better indentation
vnoremap < <gv
vnoremap > >gv

"Sorting
vnoremap <leader>s :sort<CR>

"Delete without buffering
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" }}}

" Java {{{
let g:syntastic_html_checkers=['w3']
let g:syntastic_java_checkers=['javac']
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

nnoremap <leader>jc :SyntasticJavacEditClasspath<cr>

let g:syntastic_java_javac_config_file_enabled = 1

" }}}

" Taglist {{{
set tags=./tags;/
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Close_On_Select=1
" }}}

"No backup or swp-files {{{
set nobackup
set nowritebackup
set noswapfile
" }}}

" Folding {{{
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

set foldmethod=marker
" }}}

" Supertab {{{

"let g:SuperTabMappingForward = '<S-Space>'
"let g:SuperTabMappingBackward = '<C-S-Space>'
let g:SuperTabNoCompleteAfter = ['^', '\s']

" }}}

" Style Checking {{{

"function CheckTab()
	"normal gg"cyG
	"new
	"normal "cp
	"normal gg=G
	"windo diffthis
"endfunction

"function CheckSpaces()
	"normal gg"cyG
	"new
	"normal "cp
	"set expandtab
	"normal gg=G
	"windo diffthis
"endfunction

" }}}

" My Git {{{

nnoremap <C-w> :w<CR>:silent !mygit.sh write >/dev/null 2>/dev/null &<CR>:redraw!<CR>
inoremap <C-w> :w<CR>:silent !mygit.sh write >/dev/null 2>/dev/null &<CR>:redraw!<CR>
"nnoremap <A-w> :w<CR>:silent !mygit.sh write >/dev/null 2>/dev/null &<CR>:redraw!<CR>

" }}}

" LISP {{{

let g:slime_target = "tmux"

" }}}

" Markdown {{{

augroup ft_markdown
	au!

	au BufNewFile,BufRead *.md setlocal filetype=markdown foldlevel=1

	au Filetype markdown nmap <silent> <leader>p <C-w>:silent !pandoc % -s -o %:r.pdf > /dev/null 2>/dev/null &<CR>:redraw!<CR>

" }}}

" MyThesaurus {{{

set thesaurus+=mythesaurus.txt

inoremap <leader>t :Mythesaurus<CR>

function! Mythesaurus()
	! ~/myscripts/mythesaurus.sh >/dev/null 2>/dev/null
	
	
endfunction

" }}}

" Make {{{

autocmd BufRead *.java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
autocmd BufRead *.java set makeprg=ant\ -find\ build.xml

" }}}

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
	set t_Co=256
endif
