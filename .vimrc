set nocompatible

" --- Plugin Manager (vim-plug) ---
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'hashivim/vim-terraform'
Plug 'takac/vim-hardtime'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'ambv/black'
Plug 'davidhalter/jedi-vim'
Plug 'github/copilot.vim'
call plug#end()

filetype plugin indent on
set encoding=utf-8
scriptencoding utf-8

" --- General settings ---
set noswapfile
set hidden
set number
set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set noshowmode
set splitright
set fillchars+=vert:\
set ffs=unix
set fileencoding=utf-8
set listchars=eol:¶
set colorcolumn=85
set t_ut=

" --- ALE ---
highlight ALEErrorSign ctermfg=246 ctermbg=166
highlight ALEWarningSign ctermfg=246 ctermbg=214
let g:ale_sign_error = "\ue0b0"
let g:ale_sign_warning = "\ue0b0"
let g:ale_sign_column_always = 1
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'python': [],
\}
let g:ale_sh_shellcheck_options = '-x'
let g:ale_go_golint_options = '-tags integrationTest'

" --- Airline ---
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onehalfdark'

" --- Keymaps ---
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

" --- Go ---
let g:go_highlight_operators = 0
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "gopls"
let g:go_gopls_gofumpt = 1
let g:go_fmt_options = { 'gofmt': '-s' }
let g:go_auto_type_info = 1
let g:go_gocode_unimported_packages = 1
let g:go_addtags_transform = 'camelcase'
let g:go_build_tags = "unitTest integrationTest journeyTest"
let g:go_fmt_fail_silently = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_list_type = 'quickfix'
let g:go_rename_command = 'gopls'
let g:go_gopls_options = ['-debug=localhost:5050']

" --- Python ---
set completeopt-=preview

augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end

" --- Hardtime ---
let g:hardtime_default_on = 0
let g:hardtime_showmsg = 1
let g:hardtime_ignore_quickfix = 1
let g:hardtime_allow_different_key = 1

" --- True color + Theme ---
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax enable
colorscheme onehalfdark
set background=dark

" Go syntax overrides for onehalfdark
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

" --- Filetypes ---
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
