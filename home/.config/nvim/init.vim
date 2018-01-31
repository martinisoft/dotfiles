if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.config/nvim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'duff/vim-bufonly'
NeoBundle 'godlygeek/tabular'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/bufkill.vim'
NeoBundle 'vim-scripts/bufexplorer.zip'
NeoBundle 'jgdavey/vim-blockle'
NeoBundle 'gregsexton/gitv'
NeoBundle 'evanmiller/nginx-vim-syntax'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-classpath'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'racer-rust/vim-racer'
NeoBundle 'elzr/vim-json'
NeoBundle 'cespare/vim-toml'
NeoBundle 'Shougo/vimshell'
NeoBundle 'tmux-plugins/vim-tmux'
NeoBundle 'fatih/vim-go'
NeoBundle 'dag/vim-fish'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'nsf/gocode'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'zchee/deoplete-go', {'build': {'unix': 'make'}}
NeoBundle 'editorconfig/editorconfig-vim'

" Searching
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Required for NeoBundle
call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax on
filetype plugin indent on

set visualbell

set wildmenu
set wildmode=list:longest,full

set splitright
set splitbelow

set hidden

set guifont=Inconsolata-dz\ for\ Powerline:h16
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=bash

" pastetoggle (set paste/nopaste) if we aren't in NeoVim
if !has('nvim')
  set pastetoggle=<F9>
endif

" For racer-rust
let g:racer_cmd = "/Users/martinisoft/.cargo/bin/racer"
let $RUST_SRC_PATH="/Users/martinisoft/projects/rust/src/"

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END

let g:deoplete#enable_at_startup = 1

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
