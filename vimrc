call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype on

syntax enable

"colors
set t_Co=256
colorscheme wombat

if has("gui_running")
	set guifont=Source\ Code\ Pro\ for\ Powerline\ 11,Monospace\ 11
	set lines=30
	set columns=130
	set guioptions-=T
else
	"let terminal resize scale the internal windows
	au VimResized * :wincmd =

	if $TERM == "xterm"
		set background=light
	end
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
set ts=4
set sts=4
set sw=4
set bs=2
set nocp incsearch nohlsearch
set smartcase
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set cindent
set autoindent
set smarttab
set noexpandtab
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
set antialias

"semicolon as colon
nmap ; :
cnoremap ;; ;

"So we can split a line somewhere
nmap NN i<Return><ESC>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null<CR>L<CR>

"cool stuff with leader
let mapleader=","
map , <leader>
noremap ,, ,

" For editing the vimrc more easily:
nnoremap <leader>ev :e $MYVIMRC<CR>

" toggle wrap
nnoremap <leader>w :set wrap!<CR>

"other stuff
set scrolloff=3 "So the cursor doesnt get lost on the edge
set wildmode=longest,list
set showmode "show the change to the user
set showcmd
set shortmess=aoI
"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default

" Keep search matches in the middle of the window.
"nnoremap n nzzzv
"nnoremap N Nzzzv

"NERDTRee
map <silent> <C-N> <ESC>:NERDTreeToggle<CR>

"BufExplorer
nmap <silent> <C-H> <ESC>:BufExplorer<CR>

"Vim-Powerline
let g:Powerline_symbols = 'fancy'
set encoding=utf-8 " Necessary to show unicode glyphs

cmap Q q!

map <silent> <F2> <ESC>:set number!<CR>
map <leader>r <ESC>:source ~/.vimrc<CR>

" indent all
map <silent> <F3> <ESC>mzgg=G`z

" formatoptions fix
au FileType * setlocal formatoptions-=ro

" custom zip/unzip
let g:zip_unzipcmd="7z x"

" old regexp engine
if exists("&regexpengine")
	set regexpengine=1
end
