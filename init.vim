" https://github.com/junegunn/vim-plug Plugin Manager.
" Run :PlugInstall to install plugins
call plug#begin()
" File Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Color Scheme
Plug 'Mofiqul/vscode.nvim'
" Ruby
Plug 'vim-ruby/vim-ruby'
" Codium (AI)
"Plug 'Exafunction/codeium.vim'
" Copilot
Plug 'github/copilot.vim'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'HiPhish/nvim-ts-rainbow2', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'luochen1990/rainbow'

" Status Line
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'

call plug#end()


let g:rainbow_active = 1
" Map the leader key to ,
let mapleader="\<SPACE>"

" Formatting Options {

  set showmatch
  set number
  "set expandtab
  set tabstop=2
  set autoindent
  set smartindent
  " Whitespace
  " autotrim
  autocmd BufWritePre * :%s/\s\+$//e
  " highlight
  autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
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

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]


require("indent_blankline").setup {
				space_char_blankline = " ",
				char_highlight_list = {
								"IndentBlanklineIndent1",
								"IndentBlanklineIndent2",
								"IndentBlanklineIndent3",
								"IndentBlanklineIndent4",
								"IndentBlanklineIndent5",
								"IndentBlanklineIndent6",
				},
}

require'nvim-treesitter.configs'.setup {
				ensure_installed = { "ruby", "vue", "markdown" },
				highlight = {
								enable = true,
								-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
								-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
								-- Using this option may slow down your editor, and you may see some duplicate highlights.
								-- Instead of true it can also be a list of languages
								additional_vim_regex_highlighting = false,
				},
}

require("lualine").setup()
EOF
