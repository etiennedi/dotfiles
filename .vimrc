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

" Plugin 'prabirshrestha/async.vim'
" Plugin 'prabirshrestha/asyncomplete.vim'
" Plugin 'yami-beta/asyncomplete-omni.vim'
" Plugin 'prabirshrestha/asyncomplete-gocode.vim'

Plugin 'mileszs/ack.vim'

Plugin 'kien/ctrlp.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-commentary'

Plugin 'tpope/vim-repeat'

Plugin 'tpope/vim-unimpaired'

Plugin 'tpope/vim-fugitive'

Plugin 'w0rp/ale'

Plugin 'pangloss/vim-javascript'

Plugin 'mxw/vim-jsx'

Plugin 'flowtype/vim-flow'

Plugin 'rdolgushin/groovy.vim'

Plugin 'prettier/vim-prettier'

Plugin 'hashivim/vim-terraform'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8
scriptencoding utf-8

" Put your non-Plugin stuff after this line
filetype plugin indent on

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

set noswapfile
set hidden
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
noremap ,rc :e $MYVIMRC<cr>
noremap ,src :source $MYVIMRC<cr>
noremap gat :GoAddTags<cr>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Asyncomplete Keymaps
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
" imap <c-space> <Plug>(asyncomplete_force_refresh)

"Golang Syntax
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_build_constraints = 1
"Golang Behavior
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_options = {
  \ 'gofmt': '-s',
  \ }
let g:go_auto_type_info = 0
let g:go_gocode_unimported_packages = 1
let g:go_addtags_transform = 'camelcase'
let g:go_build_tags = "unitTests integrationTests journeyTests"

"Omni-Completion
:set completeopt-=preview

"Shellcheck Ale Options
let g:ale_sh_shellcheck_options = '-x'

" "Enable OmniCompletion as source for asyncomplete
" call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
" \ 'name': 'omni',
" \ 'whitelist': ['*'],
" \ 'completor': function('asyncomplete#sources#omni#completor')
" \  }))

" call asyncomplete#register_source(asyncomplete#sources#gocode#get_source_options({
"     \ 'name': 'gocode',
"     \ 'whitelist': ['go'],
"     \ 'completor': function('asyncomplete#sources#gocode#completor'),
"     \ 'config': {
"     \    'gocode_path': expand('~/go/bin/gocode')
"     \  },
"     \ }))


" CtrlP ignore folders
let g:ctrlp_custom_ignore = 'vendor\|node_modules'

" Fix missing background issue
if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

"JS
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0
let g:ale_fixers = {
\   'javascript': [
\       'eslint',
\   ],
\}
let g:ale_fix_on_save = 1
let g:flow#showquickfix = 0 "This will use ale to the flow checks, but use
"vim-flow for the autocompletion

"Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
    let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif
let g:flow#timeout = 6

" Configure Ack to use ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

set ffs=unix
set encoding=utf-8
set fileencoding=utf-8
set listchars=eol:¶

" Run prettier on save
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
