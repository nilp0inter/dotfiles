" BEHAVIOR {{{1
set mouse=
set nocompatible
set hidden
set switchbuf=usetab
set virtualedit=block
set scrolloff=2


" DISPLAY {{{1
syntax on
set background=dark
set list
set number
set relativenumber
set cursorcolumn
set cursorline
function! g:ToggleNuMode()
  if &relativenumber == 1
     set norelativenumber
     set nocursorcolumn
     set nocursorline
     call HardTimeOff()
  else
     set relativenumber
     set cursorcolumn
     set cursorline
     call HardTimeOn()
  endif
endfunction


" STATUS LINE {{{1
set ruler
set showcmd
set wildmenu
set wildmode=full


" AUTOCOMPLETION {{{1
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set complete+=t
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
          \ if &omnifunc == "" |
          \     setlocal omnifunc=syntaxcomplete#Complete |
          \ endif
endif
set thesaurus+=/home/nil/.vim/thesaurus/words.txt
set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/spanish


" PRINTING {{{1
set printoptions=number:y,wrap:n,syntax:y,left:3pc


" SEARCH  {{{1
set hlsearch
set incsearch
nnoremap <esc><esc> :nohlsearch<cr>
set showmatch
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif


" FOLDING {{{1
set foldmethod=marker


" MAX TEXT WIDTH {{{1
set textwidth=79
set colorcolumn=+1
set wrap


" KEYBOARD SHORTCUTS {{{1
map gC :tabedit ~/.vimrc<cr>
vmap gS :!sort<cr>
nnoremap <C-J> m`o<Esc>``
nnoremap <C-K> m`O<Esc>``
autocmd! bufwritepost .vimrc call ReloadAndUpdatePlugins()
if !exists('*ReloadAndUpdatePlugins')
    function ReloadAndUpdatePlugins()
        source %
        PlugClean!
        PlugUpdate
    endfunction
endif
nnoremap <C-S> :w<cr>
nnoremap <Space> @:
nnoremap <silent><C-C> :call g:ToggleNuMode()<cr>
let mapleader = ","
let g:mapleader = ","


" UNDO {{{1
set undodir=~/.vim/undo-dir
set undofile


" ENCRYPTION {{{1
set cm=blowfish2


" NETRW {{{1
let g:netrw_liststyle = 2
let g:netrw_banner = 1


" PLUGINS {{{1
call plug#begin()
    " MOTION {{{2
    Plug 'takac/vim-hardtime'
    Plug 'easymotion/vim-easymotion'

    " SEARCH {{{2
    Plug 'wincent/command-t'
    Plug 'tpope/vim-abolish'
    Plug 'dkprice/vim-easygrep'

    " PROGRAMMING {{{2
    Plug 'tpope/vim-fugitive'
    Plug 'janko-m/vim-test'
    Plug 'tpope/vim-dispatch'
    Plug '5long/pytest-vim-compiler'
    Plug 'jsfaint/gen_tags.vim'

    " SYNTAX {{{2
    Plug 'luochen1990/rainbow'
    Plug 'vim-syntastic/syntastic'
    Plug 'tell-k/vim-autopep8'
    Plug 'davidhalter/jedi-vim'

    " TEXT OBJECTS {{{2
    Plug 'kana/vim-textobj-entire'
    Plug 'kana/vim-textobj-user'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tweekmonster/braceless.vim'

    " SNIPPETS {{{2
    Plug 'nilp0inter/vim-snippets'
    Plug 'SirVer/ultisnips'
call plug#end()


" PLUGINS CONFIGURATION {{{1 
" VIM-TEST CONFIGURATION {{{2
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

" BRACELESS {{{2
autocmd FileType python BracelessEnable +indent +highlight
let g:braceless_line_continuation = 0

" RAINBOW {{{2
let g:rainbow_active = 1

" HARDTIME {{{2
let g:hardtime_maxcount = 5
let g:hardtime_showmsg = 1
let g:hardtime_showerr = 0
let g:hardtime_timeout = 2000
let g:hardtime_default_on = 1
let g:hardtime_ignore_quickfix = 1

" GEN_TAGS {{{2
let g:gen_tags#gtags_default_map = 1

" ULTISNIPS {{{2
let g:UltiSnipsListSnippets="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="/home/nil/.vim/plugged/vim-snippets/UltiSnips"
let g:UltiSnipsEnableSnipMate=0

" SYNTASTIC {{{2
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_mode_map = {"mode": "passive"}
let g:syntastic_python_checkers = ['pycodestyle']

" AUTOPEP8 {{{2
autocmd FileType python set equalprg=autopep8\ -

" EASYGREP {{{2
let g:EasyGrepJumpToMatch = 0
let g:EasyGrepWindow = 0

" JEDI {{{2
let python_highlight_all = 1
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 1
let g:jedi#show_call_signatures_delay = 0
let g:jedi#use_tag_stack = 1
autocmd FileType python setlocal completeopt-=preview
