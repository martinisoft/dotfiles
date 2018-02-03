if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Add or remove your Bundles here:
Plug 'duff/vim-bufonly'
Plug 'godlygeek/tabular'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'qpkorr/vim-bufkill'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'gregsexton/gitv'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'edkolev/tmuxline.vim'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-classpath'
Plug 'Shougo/vimshell'
Plug 'tmux-plugins/vim-tmux'
Plug 'dag/vim-fish'
Plug 'airblade/vim-gitgutter'
Plug 'nsf/gocode'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'roxma/nvim-completion-manager'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'editorconfig/editorconfig-vim'
Plug 'hashivim/vim-terraform'
Plug 'sheerun/vim-polyglot'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

" Searching
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

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

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Ripgrep via Fzf. Search on mega steroids.
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
