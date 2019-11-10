set nocompatible             " be iMproved, required
filetype off                  " required

"sets paste to system keyboard
set clipboard=unnamed

set rtp+=/user/local/lib/python2.7/site-packages/powerline/bindings/vim
set rtp+=~/.vim/bundle/Vundle.vim

"Plugin 'sbdchd/neoformat'

call vundle#begin('~/.vim/bundle')
Plugin 'w0rp/ale'
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'elzr/vim-json'
Plugin 'Valloric/YouCompleteMe'
Plugin 'leafgarland/typescript-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'zivyangll/git-blame.vim'
call vundle#end()            " required
filetype plugin indent on    " required

call plug#begin('~/.vim/plugged')
Plug 'elmcast/elm-vim'
call plug#end()

"consul template highlighting
au BufRead,BufNewFile *.ctmpl set filetype=gotexttmpl

"format onSave
"autocmd BufWritePre *.ts Neoformat
"let g:neoformat_try_formatprg = 1
autocmd FileType typescript set formatprg=prettier\ --stdin\ --parser\ typescript\ --single-quote\ --trailing-comma\ all\ --print-width\ 100

"Some remapping needed for gitblame plugin
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

"ale config
let g:ale_elm_format_options = '--yes --elm-version=0.19'
let g:ale_fixers = {}
let g:ale_fixers['elm'] = ['format']
let g:ale_fixers['typescript'] = ['prettier']

let g:ale_list_window_size = 1
let g:ale_fix_on_save = 1

let g:ale_set_loclist = 0
let g:ale_set_quickfix =0
let g:ale_open_list = 1
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

" settings
"switch semicolon with colon
nnoremap ; :


"custom settings
set autoindent
set backspace=2
set completeopt-=preview
set cursorline
set expandtab
set hlsearch
set incsearch
set laststatus=2
set number
set scroll=7
set shiftwidth=2
set showcmd
set showmatch
set softtabstop=2
set tabstop=2
set wildmode=longest,list
set wildmenu
set visualbell
set lazyredraw

" removes trailing whitespace
fun! StripTailingWhitespace()
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTailingWhitespace()



"color options
syntax on
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" elm and javascript autofromats
let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_syntastic_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_ex = '$(npm bin)/eslint'


"let gmycm_semantic_triggers = {
"			\ 'elm' : ['.'],
"			\}
"

