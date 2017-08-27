set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

Plugin 'tpope/vim-sensible'

Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'

Plugin 'fatih/vim-go'

Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'yami-beta/asyncomplete-omni.vim'

Plugin 'kien/ctrlp.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdtree'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-commentary'

Plugin 'tpope/vim-repeat'

Plugin 'tpope/vim-unimpaired'

Plugin 'tpope/vim-fugitive'

Plugin 'jiangmiao/auto-pairs'

Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
filetype plugin indent on
set noswapfile

" Theme & Styling
syntax enable
colorscheme solarized
set background=light
" Disable pipes in vsplits
:set fillchars+=vert:\ 
" Style ALE
highlight ALEErrorSign ctermfg=246 ctermbg=166 
highlight ALEWarningSign ctermfg=246 ctermbg=214 
let g:ale_sign_error = "\ue0b0"
let g:ale_sign_warning = "\ue0b0"
let g:ale_sign_column_always = 1
set splitright


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
set splitright


"Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

"Keymaps / Keybindings
noremap ,f :CtrlP<cr>
noremap ,b :CtrlPBuffer<cr>
noremap ,d :GoDecls<cr>
noremap ,t :GoAlternate<cr>
noremap ,n :NERDTreeToggle<cr>
noremap ,rc :e ~/.vimrc<cr>
noremap gat :GoAddTags<cr>

"Asyncomplete Keymaps
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

"Golang Syntax
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
"Golang Behavior
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_options = {
  \ 'gofmt': '-s',
  \ }
let g:go_auto_type_info = 0
let g:go_gocode_unimported_packages = 1
let g:go_addtags_transform = 'camelcase'

"Omni-Completion
:set completeopt-=preview

"Shellcheck Ale Options
let g:ale_sh_shellcheck_options = '-x'

"Enable OmniCompletion as source for asyncomplete
call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
\ 'name': 'omni',
\ 'whitelist': ['*'],
\ 'completor': function('asyncomplete#sources#omni#completor')
\  }))


" CtrlP ignore folders
let g:ctrlp_custom_ignore = 'vendor\|node_modules'

" Fix missing background issue
if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif
