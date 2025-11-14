" Use Vim settings rather than Vi settings
set nocompatible

" Include the system settings
if filereadable("/etc/vimrc")
  source /etc/vimrc
endif

" Setup plug.vim (then PlugInstall)
if !filereadable($HOME . "/.vim/autoload/plug.vim")
  silent ! curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Setup plugins
call plug#begin()
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }
  Plug 'tpope/vim-sensible'
call plug#end()

" Line numbers are cool
set number
set relativenumber

" No status line
set laststatus=0

" Text wrapping
set wrap

" Indentation (spaces > tabs)
set expandtab
set shiftwidth=2
set tabstop=2

" Syntax highlighting
syntax on

" Color scheme
set termguicolors
colorscheme catppuccin_mocha
hi Normal guibg=NONE ctermbg=NONE

" Windows terminal shit
set visualbell
set t_vb=
