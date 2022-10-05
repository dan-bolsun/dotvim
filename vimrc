call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype plugin indent on
syntax enable

" colors
set t_Co=256

" gui
if has("gui_running")
	set guifont=Inconsolata 13
	set lines=36
	set columns=148
	set guioptions-=T
	set guioptions-=r
	set guioptions-=R
	set guioptions-=l
	set guioptions-=L
else
	"let terminal resize scale the internal windows
	au VimResized * :wincmd =
	map <silent> <F4> <ESC>:set paste!<CR>
end

set cf
set clipboard=unnamedplus
set history=256
set autowrite
set ruler
set nu
set wrap
set timeoutlen=250
set hidden

" Formatting
set ts=8
set sts=8
set sw=8
set bs=2
set nocp incsearch "nohlsearch
set smartcase
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set cindent
set autoindent
set smarttab
set noexpandtab
set smartindent
set formatoptions=twn2

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set list listchars=tab:\ \ ,trail:•,nbsp:˽
set novisualbell
set noerrorbells
set laststatus=2

set mousehide
set mouse=a

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null<CR>

" leader stuff
let mapleader=","
map , <leader>
map <leader>e <ESC>:e ~/.vimrc<CR>
map <leader>r <ESC>:source ~/.vimrc<CR>
nnoremap <leader>w :set wrap!<CR>

"other stuff
"set scrolloff=2 "So the cursor doesnt get lost on the edge
set wildmode=longest,list
set showmode "show the change to the user
set showcmd
set shortmess=aoI
"folding settings
set foldmethod=manual   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
"set nofoldenable       "dont fold by default

"NERDTRee
map <silent> <C-N> <ESC>:NERDTreeToggle<CR>

"BufExplorer
nmap <silent> <C-H> <ESC>:BufExplorer<CR>

set encoding=utf-8 " Necessary to show unicode glyphs

" vim-airline
let g:airline_powerline_fonts=1

cmap Q q!
nmap q :q

" line numbers
map <silent> <F2> <ESC>:set number!<CR>

" indent all
map <silent> <F3> <ESC>mzgg=G`z

" formatoptions fix
au FileType * setlocal formatoptions-=r
au FileType * setlocal formatoptions-=o

" Allow to gf when '=' is used without spaces
set includeexpr=substitute(v:fname,'^.*=','','')

" stop vim to reindent comments
set cinkeys-=0#

" jedi
pa! python-jedi
set completeopt-=preview

" tagbar
nmap <F8> :TagbarToggle<CR>

" termdebug
pa! termdebug
au BufNewFile,BufRead *.rs let termdebugger="rust-gdb"
