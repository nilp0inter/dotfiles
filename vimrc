set mouse=

" enable syntax highlighting
syntax enable

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" print options
set printoptions=number:y,wrap:n,syntax:y,left:3pc

" search
set hls is
"nmap <Esc> <Esc> :nohlsearch <CR>
nnoremap <esc><esc> :nohl<cr>

" columnwidth
set textwidth=79
set colorcolumn=+1

" status line
set ruler

" set nocompatible
set nocp

" nowrap
set nowrap

" change cursors
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" undo persistence
set undodir=~/.vim/undo-dir
set undofile

" vim-plug configuration
call plug#begin()
    " Util
    Plug 'wincent/command-t'
    Plug 'janko-m/vim-test'
    Plug 'takac/vim-hardtime'
    Plug 'easymotion/vim-easymotion'
    Plug 'SirVer/ultisnips'
    Plug 'nilp0inter/vim-snippets'

    " Syntax
    Plug 'luochen1990/rainbow'

    " Text objects
    Plug 'kana/vim-textobj-entire'
    Plug 'kana/vim-textobj-user'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tweekmonster/braceless.vim'
call plug#end()

" change <leader> to , for command-t
let mapleader = ","
let g:mapleader = ","

" custom simpylfold configuration
let g:SimpylFold_fold_import = 0
let b:SimpylFold_fold_import = 0
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0
set foldlevel=99

" vim-test configuration
let test#python#runner = 'pytest'
let test#python#pytest#executable = 'pipenv run pytest -vvs'
let test#strategy = 'vimterminal'

nmap tn :TestNearest<CR>
nmap tf :TestFile<CR>
nmap ts :TestSuite<CR>
nmap tl :TestLast<CR>
nmap tg :TestVisit<CR>

" braceless.vim
autocmd FileType python BracelessEnable +indent

" rainbow
let g:rainbow_active = 1

" hardtime
let g:hardtime_maxcount = 2
let g:hardtime_showmsg = 1
let g:hardtime_timeout = 2000
let g:hardtime_default_on = 1

" numbering
set number
set relativenumber

" use Ctrl+L to toggle the line number counting method
function! g:ToggleNuMode()
  if &relativenumber == 1
     set norelativenumber
  else
     set relativenumber
  endif
endfunction
nnoremap <silent><C-L> :call g:ToggleNuMode()<cr>


" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsListSnippets="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
