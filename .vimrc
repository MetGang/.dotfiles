" Include the system settings
if filereadable("/etc/vimrc")
  source /etc/vimrc
endif

" Setup plug.vim (then PlugInstall)
if !filereadable($HOME . "/.vim/autoload/plug.vim")
  silent ! curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Setup plugins
let g:AutoPairsMapCR = 0
let g:AutoPairsMapBS = 0

call plug#begin()
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }
  Plug 'jiangmiao/auto-pairs'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-sensible'
call plug#end()

" Enable mouse in all modes
set mouse=a

" Ensure UTF-8 encoding
set encoding=utf-8
set fileencoding=utf-8

" Disable all backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Disable modelines for security and consistency
set modelines=0
set nomodeline

" Line numbers are cool
set number
set relativenumber

" No status line
set laststatus=0

" Indentation (spaces > tabs)
set expandtab
set shiftround
set shiftwidth=2
set tabstop=2

" Text wrapping
set wrap

" Use one space when joining sentences
set nojoinspaces

" Show partial commands in the status area
set showcmd

" Enhanced command completion menu
set wildmenu
set wildmode=longest:full,full

" Syntax highlighting
syntax on

" Search enhancements
set ignorecase
set smartcase
set incsearch
set hlsearch

" Color scheme
set termguicolors
colorscheme catppuccin_mocha
hi Normal guibg=NONE ctermbg=NONE

" Windows terminal fixup
set visualbell
set t_vb=

" Extras
if filereadable($HOME . "/.vimrc_extra")
  source ~/.vimrc_extra
endif
