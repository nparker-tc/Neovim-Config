" https://github.com/junegunn/vim-plug Plugin Manager.
" Run :PlugInstall to install plugins
call plug#begin()
" File Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Color Scheme
Plug 'Mofiqul/vscode.nvim'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

" Map the leader key to ,
let mapleader="\<SPACE>"

" Formatting Options {

  set showmatch
  set number
  set expandtab
  set tabstop=2

" }
"
" Plugin Configs
" Fzf
  nnoremap <C-p> :GFiles<CR>
  nnoremap <C-b> :Buffers<CR>
  nnoremap <C-f> :Ag<CR>

" VSCode Plugin Theme
lua << EOF
  vim.o.background = 'dark'
  require('vscode').load()
EOF
