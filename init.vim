call plug#begin('~/.local/share/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'thaerkh/vim-workspace'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'yggdroot/indentline'
Plug 'easymotion/vim-easymotion'
Plug 'luochen1990/rainbow'

Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'

Plug 'edkolev/promptline.vim'

Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer --system-libclang  --racer-completer --tern-completer --gocode-completer' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'neomake/neomake'

Plug 'bitc/vim-hdevtools'
Plug 'neovimhaskell/haskell-vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'eagletmt/neco-ghc'
Plug 'twinside/vim-hoogle'

Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'

Plug 'raichoo/purescript-vim'
Plug 'FrigoEU/psc-ide-vim'
call plug#end()

set background=dark
colorscheme solarized

syntax on
filetype plugin indent on

set encoding=utf-8
scriptencoding utf-8
set tw=80
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set mouse=a
set history=1000
set number
set ruler
set linespace=0

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

let g:rainbow_active = 1

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

nnoremap <leader>v :ToggleWorkspace<CR>
nmap <Leader>s :%s//g<Left><Left>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>h :Hoogle<CR>

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

nnoremap ; :
nnoremap Q @q
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '|' },
      \ 'tabline': { 'left': [['buffers']], 'right': [['close']] },
      \ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
      \ 'component_type':  {'buffers': 'tabsel'}
      \ }
let g:promptline_preset = 'full'
let g:promptline_theme = 'jelly'
set showtabline=2
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:ycm_rust_src_path = '/home/deciduously/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src'
let g:ycm_python_binary_path = '/usr/bin/python'
let g:ycm_semantic_triggers = {'haskell' : ['.']}

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>
map <silent> tl :GhcModLint<CR>
map <silent> tc :GhcModCheck<CR>

let g:haskell_tabular = 1
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

augroup NeomakeHaskell
  autocmd!
  autocmd! BufWritePost *.hs Neomake
augroup END
