vim.cmd [[
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
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'w0rp/ale'
  Plug 'edkolev/tmuxline.vim'
  Plug 'guns/vim-clojure-static'
  Plug 'tpope/vim-fireplace'
  Plug 'tpope/vim-classpath'
  Plug 'Shougo/vimshell'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'dag/vim-fish'
  Plug 'airblade/vim-gitgutter'
  Plug 'fatih/vim-go'
  Plug 'nsf/gocode'
  Plug 'Shougo/ddc.vim'
  Plug 'vim-denops/denops.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'hashivim/vim-terraform'
  Plug 'sheerun/vim-polyglot'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'mattn/emmet-vim'
  Plug 'lilydjwg/colorizer'
  Plug 'lambdalisue/fila.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'haishanh/night-owl.vim'
  Plug 'sbdchd/neoformat'
  Plug 'tpope/vim-bundler'
  Plug 'WolfgangMehner/bash-support'
  Plug 'mileszs/ack.vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'neovim/nvim-lspconfig'

  " Initialize plugin system
  call plug#end()

  " Searching
  if executable('rg')
    let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'
  endif

  " Any empty ack search will search for the work the cursor is on
  let g:ack_use_cword_for_empty_search = 1

  " Don't jump to first match
  cnoreabbrev Ack Ack!

  " Maps <leader>/ so we're ready to type the search keyword
  nnoremap <Leader>/ :Ack!<Space>

  " Navigate quickfix list with ease
  nnoremap <silent> [q :cprevious<CR>
  nnoremap <silent> ]q :cnext<CR>

  syntax on
  filetype plugin indent on

  set visualbell

  set wildmenu
  set wildmode=list:longest,full

  set splitright
  set splitbelow

  set hidden

  " Highlight matches.
  set hlsearch

  set shell=bash

  " pastetoggle (set paste/nopaste) if we aren't in NeoVim
  if !has('nvim')
    set pastetoggle=<F9>
  endif

  " For vim-go
  let g:go_info_mode = 'guru'

  augroup vimrc
    autocmd!
    autocmd GuiEnter * set columns=120 lines=70 number
  augroup END

  " Ripgrep via Fzf. Search on mega steroids.
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

  " Enable per-command history.
  " CTRL-N and CTRL-P will be automatically bound to next-history and
  " previous-history instead of down and up. If you don't like the change,
  " explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
  let g:fzf_history_dir = '~/.local/share/fzf-history'

  " Remove netrw banner for now
  let g:netrw_banner = 0

  " Terraform LSP Setup
  lua <<EOF
    require'lspconfig'.terraformls.setup{}
  EOF
  autocmd BufWritePre *.tfvars lua vim.lsp.buf.formatting_sync()
  autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()

  if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
  endif

  " ==== local .vimrc with .envrc using add_extra_vimrc
  if exists("$EXTRA_VIM")
    for path in split($EXTRA_VIM, ':')
      exec "source ".path
    endfor
  endif
]]
