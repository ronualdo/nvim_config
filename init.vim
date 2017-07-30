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

" column limit config
highlight ColorColumn ctermbg=5
let &colorcolumn="81,".join(range(100,999),",")

" Nerdtree settings
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" lightline config
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'mattn/emmet-vim'
Plug 'eugen0329/vim-esearch'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
call plug#end()

" Mappings
map <F2> :NERDTreeToggle<CR>
nmap <tab> :tabnext<CR>
nmap <S-tab> :tabprevious<CR>
