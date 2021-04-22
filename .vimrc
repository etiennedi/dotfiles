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
" Plugin 'altercation/vim-colors-solarized'

Plugin 'fatih/vim-go'

Plugin 'mileszs/ack.vim'

Plugin 'junegunn/fzf.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-commentary'

Plugin 'tpope/vim-repeat'

Plugin 'tpope/vim-unimpaired'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-abolish'

Plugin 'w0rp/ale'

Plugin 'pangloss/vim-javascript'

Plugin 'mxw/vim-jsx'

Plugin 'flowtype/vim-flow'

Plugin 'rdolgushin/groovy.vim'

Plugin 'prettier/vim-prettier'

Plugin 'hashivim/vim-terraform'

Plugin 'vim/killersheep'

Plugin 'evanleck/vim-svelte'

Plugin 'takac/vim-hardtime'

Plugin 'sonph/onehalf', { 'rtp': 'vim' }

" Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8
scriptencoding utf-8

" Put your non-Plugin stuff after this line
filetype plugin indent on

set encoding=utf-8
scriptencoding utf-8

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
set background=light
set background=dark
set splitright


"Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='onehalfdark'

"Keymaps / Keybindings
noremap ,f :Files<cr>
noremap ,b :Buffers<cr>
noremap ,d :GoDecls<cr>
noremap ,t :GoAlternate<cr>
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
let g:go_highlight_operators = 0
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_build_constraints = 1
"Golang Behavior
let g:go_fmt_autosave = 1
let g:go_fmt_command = "gofumports"
let g:go_fmt_options = {
  \ 'gofmt': '-s',
  \ }
let g:go_auto_type_info = 1
let g:go_gocode_unimported_packages = 1
let g:go_addtags_transform = 'camelcase'
let g:go_build_tags = "unitTest integrationTest journeyTest"
let g:go_fmt_fail_silently = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode='gopls'


"Build tags for ale
let g:ale_go_golint_options='-tags integrationTest'

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

" " Fix missing background issue
" if &term =~ '256color'
"     " Disable Background Color Erase (BCE) so that color schemes
"     " work properly when Vim is used inside tmux and GNU screen.
"     set t_ut=
" endif
set t_ut=

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
let g:prettier#autoformat = 1
autocmd BufWritePre *.svelte,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html PrettierAsync

" fzf
" relies on fzf being installed through homebrew
set rtp+=/usr/local/opt/fzf

" vim-hardtime
let g:hardtime_default_on = 0
let g:hardtime_showmsg = 1
let g:hardtime_ignore_quickfix = 1
let g:hardtime_allow_different_key = 1

set colorcolumn=85

let g:ale_linters = {
\   'python': [],
\}

" true color mode
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Theme & Styling
syntax enable
colorscheme onehalfdark
set background=light
set background=dark

" override go syntax values so they fit the theme better
hi link goType Conditional
hi link goStatement Conditional
hi link goUnsignedInts Conditional
hi link goSignedInts Conditional
hi link goFloats Conditional
hi link goTypeName Function
hi link goReceiverType Function
hi link goTypeConstructor Conditional
hi link goBuiltins Keyword
hi link goImport Keyword
hi link goPackage Keyword
