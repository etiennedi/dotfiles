set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'dracula/vim'

Plugin 'fatih/vim-go'

Plugin 'Shougo/neocomplete'

Plugin 'kien/ctrlp.vim'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdtree'

Plugin 'vim-syntastic/syntastic'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
filetype plugin indent on
set noswapfile
syntax on
set number
set relativenumber
set tabstop     =2
set softtabstop =2
set shiftwidth  =2
set expandtab
set laststatus=2
set noshowmode
set encoding=utf-8
set term=xterm-256color

"Keymaps
noremap ,f :CtrlP<cr>
noremap ,t :GoAlternate<cr>
noremap ,n :NERDTreeToggle<cr>

"Golang Syntax
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
"Golang Syntastic
let g:syntastic_go_checkers = ['govet', 'golint', 'errcheck']



