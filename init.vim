"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set ruler

" setting split openning
set splitbelow
set splitright

" general editor settings
syntax on
set number
filetype plugin indent on
highlight ColorColumn ctermbg=5
let &colorcolumn="81,".join(range(100,999),",")

" plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
call plug#end()

" Mappings
map <F2> :NERDTreeToggle<CR>
