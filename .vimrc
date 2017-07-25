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
" Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'

Plugin 'fatih/vim-go'

Plugin 'Shougo/neocomplete'

Plugin 'kien/ctrlp.vim'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdtree'

Plugin 'vim-syntastic/syntastic'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-commentary'

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

" Theme & Styling
syntax enable
colorscheme gruvbox
set background=dark
" Disable pipes in vsplits
:set fillchars+=vert:\ 
" Style syntastic
highlight SyntasticErrorSign ctermfg=237 ctermbg=167 
highlight SyntasticStyleErrorSign ctermfg=237 ctermbg=167 
highlight SyntasticWarningSign ctermfg=237 ctermbg=214
highlight SyntasticStyleWarningSign ctermfg=237 ctermbg=214
let g:syntastic_error_symbol = "\ue0b0"
let g:syntastic_warning_symbol = "\ue0b0"
let g:syntastic_style_error_symbol = "\ue0b0"
let g:syntastic_style_warning_symbol = "\ue0b0"

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

"Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

"Keymaps
noremap ,f :CtrlP<cr>
noremap ,b :CtrlPBuffer<cr>
noremap ,t :GoAlternate<cr>
noremap ,n :NERDTreeToggle<cr>

"Golang Syntax
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_functions = 1

"Golang Syntastic
let g:syntastic_go_checkers = ['go', 'govet', 'golint', 'errcheck']

"Omni-Completion
:set completeopt-=preview

