set nocompatible             " be iMproved, required
filetype off                  " required

"sets paste to system keyboard
set clipboard=unnamed

set rtp+=/user/local/lib/python2.7/site-packages/powerline/bindings/vim
set rtp+=~/.vim/bundle/Vundle.vim


""" Install plug
""" https://github.com/junegunn/vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
""" Install Plugged

call plug#begin('~/.vim/plugged')
""" Plugs
" Tools
Plug 'edkolev/tmuxline.vim'
Plug 'mtth/scratch.vim'
Plug 'scrooloose/nerdtree'
Plug 'kien/rainbow_parentheses.vim'
Plug '/usr/local/opt/fzf'
Plug 'mileszs/ack.vim'
Plug 'dbakker/vim-projectroot'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'w0rp/ale'
" elm
Plug 'elmcast/elm-vim'
" golang
Plug 'fatih/vim-go'
" elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
" markdown
Plug 'shime/vim-livedown'
" typescript
Plug 'leafgarland/typescript-vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'HerringtonDarkholme/yats.vim'
"Plug 'Quramy/vim-js-pretty-template'
"autocmd FileType typescript let $PATH .= ":" . trim(system("npm bin"))
" terraform
Plug 'hashivim/vim-terraform'
Plug 'b4b4r07/vim-hcl'
Plug 'fatih/vim-hclfmt'
"Plug 'Valloric/YouCompleteMe'
Plug 'prisma/vim-prisma'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'


call plug#end()
filetype plugin indent on    " required


"""""""File Highlighting"""""""""
au BufRead,BufNewFile *.json.ejs set filetype=json
"consul template highlighting
au BufRead,BufNewFile *.ctmpl set filetype=gotexttmpl
au BufRead,BufNewFile *.dockerfile set filetype=dockerfile

"format onSave
"autocmd BufWritePre *.ts Neoformat
"let g:neoformat_try_formatprg = 1
"autocmd FileType typescript set formatprg=prettier\ --stdin\ --parser\ typescript\ --single-quote\ --trailing-comma\ all\ --print-width\ 100
autocmd FileType typescript set formatprg=prettier\ --stdin\ --parser\ typescript\ --trailing-comma\ all\ --print-width\ 100

"Some remapping needed for gitblame plugin
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

"ale config
let g:ale_elm_format_options = '--yes --elm-version=0.19'
let g:ale_fixers = {}
let g:ale_fixers['elm'] = ['elm-format']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['rust'] = ['rustfmt']
let g:ale_fixers['go'] = []


let g:ale_list_window_size = 1
let g:ale_fix_on_save = 1

let g:ale_set_loclist = 0
let g:ale_set_quickfix =0
let g:ale_open_list = 1
"let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

" show Perl::Critic rules which have been violated
let g:ale_perl_perlcritic_showrules = 1
let g:ale_type_map = {
      \    'perlcritic': {'ES': 'WS', 'E': 'W'},
      \}



let g:NERDTreeWinSize = 20

""""""Remapping"""""""""
"switch semicolon with colon
nnoremap ; :
"Dont yank deleted lines
vnoremap <leader>p "_dP


""""""""""custom settings"""""""""""
"indenting/tabs
set autoindent
set ai
set softtabstop=2
set tabstop=2
set backspace=2
set shiftwidth=2
set smarttab
set expandtab
retab
" tabs
nnoremap tt :tabnew .<CR>
nnoremap tn1 :tabn 1<CR>
nnoremap tn2 :tabn 2<CR>
nnoremap tn3 :tabn 3<CR>
nnoremap tn4 :tabn 4<CR>

"set completeopt-=preview
set completeopt=menu,noselect,noinsert
set cursorline

set hlsearch
set incsearch

set laststatus=2
set number
set scroll=7
set showcmd
set showmatch
set wildmode=longest,list
set wildmenu
set visualbell


set lazyredraw
set ttyfast

set autoread


" removes trailing whitespace
fun! StripTailingWhitespace()
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTailingWhitespace()


function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction


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
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_ex = '$(npm bin)/eslint'



let g:ale_yaml_yamllint_options =
      \   get(g:, 'ale_yaml_yamllint_options', '-c $HOME/.yamllint.yml')

" Scratch
let g:scratch_autohide = "hidden"


" Terraform
let g:terraform_fmt_on_save = 1

" Paste mode stuff
noremap <C-p> :set invpaste paste?<CR>
set pastetoggle=<C-p>
set showmode
set completeopt+=noinsert


"let gmycm_semantic_triggers = {
"			\ 'elm' : ['.'],
"			\}
"

"typescript setings
autocmd FileType typescript nnoremap <Leader>d :split <bar> YcmCompleter GoToDefinition <CR>
autocmd FileType typescript nnoremap <Leader>t :YcmCompleter GetType <CR>
autocmd FileType typescript nnoremap <Leader>r :YcmCompleter RefactorRename

cnoreabbrev F ALEGoToDefinition




let g:tmuxline_powerline_separators = 0

