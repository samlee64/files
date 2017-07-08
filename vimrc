set nocompatible             " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'elixir-lang/vim-elixir'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'elmcast/elm-vim'
Plugin 'othree/html5.vim'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'elzr/vim-json'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Valloric/YouCompleteMe'
Plugin 'sbdchd/neoformat'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'fatih/vim-go'
call vundle#end()            " required
filetype plugin indent on    " required

"consul template highlighting
au BufRead,BufNewFile *.ctmpl set filetype=gotexttmpl

"format onSave
autocmd BufWritePre *.ts Neoformat
let g:neoformat_try_formatprg = 1
autocmd FileType typescript set formatprg=prettier\ --stdin\ --parser\ typescript\ --single-quote\ --trailing-comma\ all\ --print-width\ 100

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

" removes trailing whitespace
fun! StripTailingWhitespace()
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTailingWhitespace()

"sets paste to system keyboard
set clipboard=unnamed


"color options
syntax on
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" elm and javascript autofromats
let g:elm_format_autosave = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_ex = '$(npm bin)/eslint'
