call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype on  " Automatically detect file types.  set nocompatible  " no vi compatibility.

"let terminal resize scale the internal windows
au VimResized * :wincmd =

syntax enable

set cf  " Enable error files & error jumping.
set clipboard=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
set hidden

" Formatting
set ts=4  " Tabs are 2 spaces
set sts=4  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set nocp incsearch nohlsearch
set smartcase 
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set cindent
set autoindent
set smarttab
set noexpandtab
set formatoptions=twan2

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set list
set listchars=tab:\ \ ,trail:·,nbsp:%
set novisualbell
set noerrorbells
set laststatus=2

set mousehide
set mouse=a
set antialias

"semicolon as colon
nmap ; :
cnoremap ;; ;

"So we can split a line somewhere
nmap NN i<Return><ESC>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null<CR>

"cool stuff with leader
let mapleader=","
map , <leader>
noremap ,, ,

"For editing the vimrc more easily:
nnoremap <leader>ev :e $MYVIMRC<CR>

"colors
set t_Co=256
colorscheme wombat

"other stuff
set scrolloff=3 "So the cursor doesnt get lost on the edge
set wildmode=longest,list
filetype plugin indent on
set showmode "show the change to the user
set showcmd
set shortmess=a
"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

"NERDTRee
map <silent> <C-N> <ESC>:NERDTreeToggle<CR>

"BufExplorer
nmap <silent> <C-H> <ESC>:BufExplorer<CR>

"Vim-Powerline
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')
let g:Powerline_symbols = 'fancy'
set encoding=utf-8 " Necessary to show unicode glyphs

cmap Q q!
cmap W w

map <silent> <F2> <ESC>:set number!<CR>
map <leader>r <ESC>:source ~/.vimrc<CR>

" indent all
map <silent> <F3> <ESC>mzgg=G`z

" formatoptions fix
au FileType * setlocal formatoptions-=r formatoptions-=o
