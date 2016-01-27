" Pathogen {{{
filetype off
execute pathogen#infect()
Helptags
filetype plugin indent on
" }}}

" Arduino {{{
"au BufNewFile,BufRead *.ino set filetype=cpp

let g:vim_arduino_library_path = "/home/markus/apps/arduino-1.6.4"
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
set textwidth=0
set wrapmargin=0
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
set number
"set relativenumber
"set undofile
set nobackup
set nowritebackup

set ignorecase
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch
"Clear out the search-bar
nnoremap <leader><space> :noh<cr>

let g:ctrlp_match_window = 'top,order:ttb'

set clipboard^=unnamed
set clipboard^=unnamedplus

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

nnoremap <leader>o :JavaImportOrganize<CR>
nnoremap <leader>j :JavaCorrect<CR>

" }}}

" Java {{{
let g:syntastic_html_checkers=['w3']
let g:syntastic_java_checkers=['javac']
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"nnoremap <leader>jc :SyntasticJavacEditClasspath<cr>

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

" RoboWars {{{

augroup ft_robowars
	au!

	au BufNewFile,BufRead *.bot setlocal filetype=robowars

	au Filetype robowars nnoremap j gj
	au Filetype robowars nnoremap k gk
	"au Filetype robowars nnoremap l f 
	"au Filetype robowars nnoremap h F 

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

" CtrlP {{{

let g:ctrlp_use_caching = 0
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor

	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
	let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
	let g:ctrlp_prompt_mappings = {
		\ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
		\ }
endif

" }}}

" tdd {{{

function! MapCallback(file)
	if exists("g:myTddTestFile")
		return g:myTddTestFile
	endif
	return ""
	"return glob('~/Dropbox/UNI/dSoftArk/hotciv-tdd-start/test/hotciv/standard/TestAlphaCiv.java')
endfunction

autocmd BufNewFile,BufRead *.java execute "let g:tdd_test_command = 'ant test'"
autocmd BufNewFile,BufRead *.java execute "let g:tdd_map_callback = 'MapCallback'"
autocmd BufNewFile,BufRead *.java execute "let g:tdd_fail_command = 'espeak failure'"
autocmd BufNewFile,BufRead *.java execute "let g:tdd_success_command = 'espeak success'"
"autocmd BufNewFile,BufRead *.java execute "let g:tdd_tmux_target = '0.1'"

" }}}

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
	set t_Co=256
endif

" Remap autocomplete menu control keys
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> j pumvisible() ? "\<C-n>" : "j"
inoremap <expr> k pumvisible() ? "\<C-p>" : "k"
inoremap <expr> h pumvisible() ? "\<PageUp>\<C-n>\<C-p>" : "h"
inoremap <expr> l pumvisible() ? "\<PageDown>\<C-n>\<C-p>" : "l"
"
let g:SuperTabCrMapping = 0 " prevent remap from breaking supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
set wildmode=list:longest,full
let g:SuperTabClosePreviewOnPopupClose = 1 " close scratch window on autocompletion

let g:ctrlp_custom_ignore = { 'dir': '\v[\/](build)$', 'file': '\v\.(class)$'}

" Easy paste/nopaste
"noremap <leader>p :set paste<CR>:put "*p<CR>:set nopaste<CR>

" Easy paste/nopaste
nnoremap <leader>p :set paste!<CR>:set number!<CR>






colorscheme ron
