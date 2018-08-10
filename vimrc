" disable mouse
set mouse=

" enable syntax highlighting
syntax enable

set background=dark

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

" smarttab.
set smarttab

" switchbuf = usetab
set switchbuf=usetab

" enable all Python syntax highlighting features
let python_highlight_all = 1

" completion
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
          \ if &omnifunc == "" |
          \     setlocal omnifunc=syntaxcomplete#Complete |
          \ endif
endif

set complete+=t

" print options
set printoptions=number:y,wrap:n,syntax:y,left:3pc

" search
set hls is
nnoremap <esc><esc> :nohl<cr>

" columnwidth
set textwidth=79
set colorcolumn=+1

" status line
set ruler

" set nocompatible
set nocp

" wrap
set wrap

" showcmd
set showcmd

" edit config in new tab via gC
map gC :tabedit ~/.vimrc<cr>
vmap gS :!sort<cr>
" invisible characters
set list

" undo persistence
set undodir=~/.vim/undo-dir
set undofile

" encryption
set cm=blowfish2

" numbering
set number
set relativenumber

" use Ctrl+C to toggle the line number counting method
function! g:ToggleNuMode()
  if &relativenumber == 1
     set norelativenumber
  else
     set relativenumber
  endif
endfunction
nnoremap <silent><C-C> :call g:ToggleNuMode()<cr>

" change <leader> to , for command-t
let mapleader = ","
let g:mapleader = ","

" spell/dictionary/thesaurus
set thesaurus+=/home/nil/.vim/thesaurus/words.txt
set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/spanish

" shortcuts
nnoremap <C-J> m`o<Esc>``
nnoremap <C-K> m`O<Esc>``

" wildmenu
set wildmenu
set wildmode=full

" reload vimrc on save
autocmd! bufwritepost .vimrc call ReloadAndUpdatePlugins()

if !exists('*ReloadAndUpdatePlugins')
    function ReloadAndUpdatePlugins()
        source %
        PlugClean!
        PlugUpdate
    endfunction
endif

" autochdir
"set autochdir
autocmd BufEnter * silent! lcd %:p:h


" save with Ctrl-S
nnoremap <C-S> :w<cr>
"
" PLUGINS
"

" vim-plug configuration
call plug#begin()
    " Util
    Plug 'SirVer/ultisnips'
    Plug 'easymotion/vim-easymotion'
    Plug 'jsfaint/gen_tags.vim'
    Plug 'takac/vim-hardtime'
    Plug 'wincent/command-t'

    " TDD
    Plug 'janko-m/vim-test'
    Plug 'tpope/vim-dispatch'
    Plug '5long/pytest-vim-compiler'


    " Syntax
    Plug 'luochen1990/rainbow'
    Plug 'vim-syntastic/syntastic'
    Plug 'tell-k/vim-autopep8'

    " Text objects
    Plug 'kana/vim-textobj-entire'
    Plug 'kana/vim-textobj-user'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tweekmonster/braceless.vim'

    " Snippets
    Plug 'nilp0inter/vim-snippets'
call plug#end()

" vim-test configuration
let test#python#runner = 'pytest'
let test#python#pytest#executable = 'pipenv run pytest'
let test#python#pytest#options = '--color=no --tb=short -q'
let test#strategy = 'make'
let test#preserve_screen = 0

nmap tn :TestNearest<CR>
nmap tf :TestFile<CR>
nmap ts :TestSuite<CR>
nmap tl :TestLast<CR>
nmap tg :TestVisit<CR>

" braceless.vim
autocmd FileType python BracelessEnable +indent +highlight
let g:braceless_line_continuation = 0

" rainbow
let g:rainbow_active = 1

" hardtime
let g:hardtime_maxcount = 5
let g:hardtime_showmsg = 1
let g:hardtime_timeout = 2000
let g:hardtime_default_on = 1

" gen_tags
let g:gen_tags#gtags_default_map = 1

" Trigger configuration.
let g:UltiSnipsListSnippets="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="/home/nil/.vim/plugged/vim-snippets/UltiSnips"
let g:UltiSnipsEnableSnipMate=0

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_mode_map = {"mode": "passive"}
let g:syntastic_python_checkers = ['pycodestyle']

" autopep8 as equalprg
autocmd FileType python set equalprg=autopep8\ -
