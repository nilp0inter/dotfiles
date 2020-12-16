" ※ BEHAVIOR ※ {{{1
set mouse=
set nocompatible
set hidden
set switchbuf=useopen
set virtualedit=block
set scrolloff=5
set shortmess+=I
set modeline
set modelines=5
set nowrap
set termwinscroll=40000

" ※ DISPLAY ※ {{{1
set background=dark
set number
set relativenumber

set nocursorcolumn
set nocursorline
set nolist

function! g:ToggleNuMode()
  if &relativenumber == 1
     set norelativenumber
     set cursorcolumn
     set cursorline
     set list
     " call HardTimeOn()
  else
     set relativenumber
     set nocursorcolumn
     set nocursorline
     set nolist
     " call HardTimeOff()
  endif
endfunction

" ※ STATUS LINE ※ {{{1
set ruler
set showcmd
set wildmenu
set wildmode=full


" ※ AUTOCOMPLETION ※ {{{1
set autoindent
autocmd Filetype python setlocal shiftwidth=4 tabstop=4 expandtab
autocmd Filetype cucumber setlocal shiftwidth=2 tabstop=2 expandtab
autocmd Filetype tex setlocal shiftwidth=4 tabstop=4 expandtab
autocmd Filetype markdown setlocal textwidth=0 shiftwidth=4 tabstop=4 expandtab colorcolumn=0
autocmd Filetype c setlocal shiftwidth=8 tabstop=8 noexpandtab
autocmd Filetype go setlocal shiftwidth=4 tabstop=4 expandtab
autocmd Filetype cpp setlocal shiftwidth=8 tabstop=8 noexpandtab
autocmd Filetype javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd Filetype yaml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd Filetype cabal setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType haskell,lhaskell setlocal shiftwidth=8 tabstop=8 nowrap expandtab keywordprg=hoogle\ search\ -iln10\ --colour 
autocmd FileType xml setlocal foldmethod=syntax nowrap

" autocmd BufRead * syntax off

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


" ※ PRINTING ※ {{{1
set printoptions=number:y,wrap:n,syntax:y,left:3pc


" ※ SEARCH ※ {{{1
set hlsearch
set incsearch
nnoremap <esc><esc> :nohlsearch<cr>
set showmatch
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
set path=$PWD/**


" ※ FOLDING ※ {{{1
set foldmethod=marker
set foldcolumn=3
set foldlevel=99


" ※ MAX TEXT WIDTH ※ {{{1
set textwidth=72
set colorcolumn=73,80
set wrap
set linebreak
set formatoptions-=t


" ※ KEYBOARD SHORTCUTS ※ {{{1
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
map <F5> :GoRun<cr>
map <F4> :GoTest<cr>

" ALTGR + s
nnoremap ß :w<cr>

" nnoremap <silent><C-C> :call g:ToggleNuMode()<cr>
" let mapleader = ","
" let g:mapleader = ","
nnoremap <silent> <Right> :wincmd l<cr>
nnoremap <silent> <Left> :wincmd h<cr>
nnoremap <silent> <Up> :wincmd k<cr>
nnoremap <silent> <Down> :wincmd j<cr>
nnoremap <silent> <C-H> :tabprev<cr>
nnoremap <silent> <C-L> :tabnext<cr>
tnoremap <silent> <C-H> <c-w>:tabprev<cr>
tnoremap <silent> <C-L> <c-w>:tabnext<cr>
command! TabTerm execute "tabnew | terminal ++curwin ++noclose"
" autocmd FileType python nnoremap <buffer> zi :set foldenable!<cr>:PyFoldEnable<cr>

function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
nnoremap <silent> mm :w\|Make!<CR>


" ※ UNDO ※ {{{1
set undodir=~/.vim/undo-dir
set undofile


" ※ ENCRYPTION ※ {{{1
set cm=blowfish2


" ※ NETRW ※ {{{1
let g:netrw_liststyle = 2
let g:netrw_banner = 1


" ※ PLUGINS ※ {{{1
call plug#begin()
    " MOTION {{{2
    " Plug 'takac/vim-hardtime'
    Plug 'easymotion/vim-easymotion'
    Plug 'voithos/vim-python-matchit'
    Plug 'tpope/vim-repeat'
    Plug 'terryma/vim-multiple-cursors'

    " SEARCH {{{2
    Plug 'tpope/vim-abolish'
    Plug 'dkprice/vim-easygrep'
    Plug 'kien/ctrlp.vim'

    " PROGRAMMING {{{2
    Plug 'tpope/vim-fugitive'
    Plug 'janko-m/vim-test'
    Plug 'tpope/vim-dispatch'
    Plug '5long/pytest-vim-compiler'
    Plug 'jsfaint/gen_tags.vim'
    " Plug 'davidhalter/jedi-vim'
    Plug 'bitc/vim-hdevtools'
    " Plug 'enomsg/vim-haskellConcealPlus'
    Plug 'ryankuczka/vim-pyfold'
    Plug 'LnL7/vim-nix'
    " Plug 'xuhdev/vim-latex-live-preview'
    Plug 'mhinz/vim-signify'
    Plug 'jparise/vim-graphql'
    Plug 'fatih/vim-go'
    " Plug 'editorconfig/editorconfig.vim'
    Plug 'idris-hackers/idris-vim'
    Plug 'prabirshrestha/vim-lsp'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'autozimu/LanguageClient-neovim', {
    " \ 'branch': 'next',
    " \ 'do': './install.sh'
    " \ }
    Plug 'elmcast/elm-vim'

    " SYNTAX {{{2
    " Plug 'frazrepo/vim-rainbow'
    Plug 'vim-syntastic/syntastic'
    Plug 'tell-k/vim-autopep8'
    Plug 'junegunn/limelight.vim'

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

    " STYLE {{{2
    Plug 'vim-scripts/Wombat'
    Plug 'junegunn/goyo.vim'
call plug#end()

packadd! matchit


" ※ PLUGINS CONFIGURATION ※ {{{1 
" ※ VIM-TEST CONFIGURATION ※ {{{2
let test#python#runner = 'pytest'
let test#python#pytest#executable = 'pipenv run pytest'
let test#python#pytest#options = '--color=no --tb=short -q'
let test#go#runner = 'gotest'
let test#strategy = 'make'
let test#preserve_screen = 0
nmap tn :TestNearest<CR>
nmap tf :TestFile<CR>
nmap ts :TestSuite<CR>
nmap tl :TestLast<CR>
nmap tg :TestVisit<CR>

" ※ BRACELESS ※ {{{2
autocmd FileType python BracelessEnable +indent +highlight
let g:braceless_line_continuation = 0

" ※ RAINBOW ※ {{{2
let g:rainbow_active = 1

" ※ DISPATCH ※ {{{2
" let g:dispatch_no_maps = 1

" ※ SURROUND ※ {{{2
autocmd FileType python let b:surround_45 = "\"\"\" \r \"\"\""


" ※ HARDTIME ※ {{{2
" let g:hardtime_maxcount = 5
" let g:hardtime_showmsg = 1
" let g:hardtime_showerr = 0
" let g:hardtime_timeout = 2000
" let g:hardtime_default_on = 1
" let g:hardtime_ignore_quickfix = 1
" let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+"]
" let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
" let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
" let g:list_of_disabled_keys = []

" ※ GEN_TAGS ※ {{{2
let g:gen_tags#gtags_default_map = 1

" ※ ULTISNIPS ※ {{{2
let g:UltiSnipsListSnippets="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="/home/nil/.vim/plugged/vim-snippets/UltiSnips"
let g:UltiSnipsEnableSnipMate=0

" ※ SYNTASTIC ※ {{{2
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_mode_map = {"mode": "passive"}
let g:syntastic_python_checkers = ['pycodestyle','pylint']
let g:syntastic_go_checkers = ['golangci_lint']
let g:syntastic_go_golangci_lint_args = ['--enable-all']
let g:syntastic_haskell_checkers = ['hlint']
let g:syntastic_rst_checkers = ['proselint']

" ※ AUTOPEP8 ※ {{{2
autocmd FileType python set equalprg=autopep8\ -
autocmd FileType haskell set equalprg=hindent

" ※ EASYGREP ※ {{{2
let g:EasyGrepJumpToMatch = 0
let g:EasyGrepWindow = 0

" ※ JEDI ※ {{{2
let python_highlight_all = 1
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 2
let g:jedi#show_call_signatures_delay = 0
let g:jedi#use_tag_stack = 1
let g:jedi#show_call_signatures = 0
let g:jedi#completions_enabled = 1
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_select_first = 0
let g:jedi#auto_close_doc = 0
" autocmd FileType python setlocal completeopt -= preview

" ※ LANGUAGE-CLIENT ※ {{{2
"
au User lsp_setup call lsp#register_server({
    \ 'name': 'ghcide',
    \ 'cmd': {server_info->['/nix/store/7i61rp9d72dkb5a3m98ixgbq0bwy39b2-ghc-8.8.4-with-packages/bin/ghcide', '--lsp']},
    \ 'whitelist': ['haskell'],
    \ })

" let g:LanguageClient_serverCommands = { 'haskell': ['stack', 'exec', 'hie-wrapper', '--', '--lsp'] }
" function LC_maps()
"   if has_key(g:LanguageClient_serverCommands, &filetype)
"     nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
"     nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
"     nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
"     set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
"   endif
" endfunction

" autocmd FileType * call LC_maps()


" ※ VIM-GO ※ {{{2
let g:go_play_browser_command = 'opera %URL% &'

" ※ EASYMOTION ※ {{{2
nmap <Leader><cr> <Plug>(easymotion-overwin-w)

" ※ VIM-LATEX ※ {{{2

" ※ COLORSCHEME ※ {{{2
set termguicolors
colorscheme wombat
set guifont=Fira\ Code\ 18
highlight Folded ctermbg=lightgray guibg=lightgray ctermfg=black guifg=black 
highlight FoldColumn ctermbg=darkgray guibg=darkgray ctermfg=black guifg=black 
highlight ColorColumn ctermbg=black guibg=black

" ※ GOYO ※ {{{2
let g:goyo_height = "85%"

function! s:goyo_enter()
    set noshowmode
    set noshowcmd
    set noruler
    set laststatus=0
    set scrolloff=999
    Limelight
endfunction

function! s:goyo_leave()
    set showmode
    set showcmd
    set ruler
    set scrolloff=5
    set laststatus=2
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" ※ TERMINAL EDITOR ※ {{{1
augroup my_terminal
    autocmd!
    autocmd WinEnter * call s:my_term(+expand('<abuf>'))
augroup END


let s:terms = {}
function! s:my_term(bufnr)
    if getbufvar(a:bufnr, '&buftype') ==# 'terminal'
        let tabpagenr = tabpagenr()
        let s:terms[tabpagenr] = a:bufnr
    endif
endfunction

function! s:op(type, ...)
      let [sel, rv, rt] = [&selection, @@, getregtype('"')]
      let &selection = "inclusive"

      if a:0 
        silent exe "normal! `<" . a:type . "`>y"
      elseif a:type == 'line'
        silent exe "normal! '[V']y"
      elseif a:type == 'block'
        silent exe "normal! `[\<C-V>`]y"
      else
        silent exe "normal! `[v`]y"
      endif

    call s:send_to_term(@@)

      let &selection = sel
        call setreg('"', rv, rt)
endfunction

function! s:send_to_term(keys)
    let bufnr = get(s:terms, tabpagenr(), 0)
    if bufnr > 0 && bufexists(bufnr)
        let keys = substitute(a:keys, '\n$', '', '')
        call term_sendkeys(bufnr, keys . "\<cr>")
        echo "Sent " . len(keys) . " chars -> " . bufname(bufnr)
    else
        echom "Error: No terminal"
    endif
endfunction

command! -range -bar SendToTerm call s:send_to_term(join(getline(<line1>, <line2>), "\n"))
nmap <script> <Plug>(send-to-term-line) :<c-u>SendToTerm<cr>
nmap <script> <Plug>(send-to-term) :<c-u>set opfunc=<SID>op<cr>g@
xmap <script> <Plug>(send-to-term) :<c-u>call <SID>op(visualmode(), 1)<cr>

nmap yrr <Plug>(send-to-term-line)
nmap yr <Plug>(send-to-term)
xmap R <Plug>(send-to-term)
