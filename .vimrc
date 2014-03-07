set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'davidhalter/jedi-vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'nvie/vim-flake8'
Bundle 'tpope/vim-fugitive'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'elzr/vim-json'
Bundle 'kevinw/pyflakes'
Bundle 'kien/ctrlp.vim'
Bundle 'SirVer/ultisnips'
Bundle 'vim-scripts/taglist.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mileszs/ack.vim'

" Snippets are separated from the engine. Add this if you want them:
Bundle 'honza/vim-snippets'

filetyp plugin indent on " required

set mouse=a
nmap <leader>ne :NERDTree<cr>

let Tlist_Ctags_Cmd = "/usr/local/Cellar/ctags/5.8/bin/ctags"

syntax on " syntax highlighting
" ==============
" : Whitespace :
" ==============
"
set autoindent

set expandtab               " insert space instead of tab
set shiftround              " rounds indent to a multiple of shiftwidth
set shiftwidth=4            " makes # of spaces = 4 for new tab
set softtabstop=4           " makes the spaces feel like tab
set tabstop=4               " makes # of spaces = 8 for preexisitng tab
"

au! BufRead,BufNewFile *.json set filetype=json 


augroup json_autocmd 
  autocmd! 
  autocmd FileType json set autoindent 
  autocmd FileType json set formatoptions=tcq2l 
  autocmd FileType json set textwidth=78 shiftwidth=4 
  autocmd FileType json set softtabstop=4 tabstop=8 
  autocmd FileType json set expandtab 
  autocmd FileType json set foldmethod=syntax 
augroup END
" !!!!!!!!!!!!!! CODE FOLDING !!!!!!!!!!!
" type za in a method to fold that method.
set foldmethod=indent
set foldlevel=99

" Scroll between windows using <ctrl><direction>
map <S-j> <c-w>j
map <S-k> <c-w>k
map <S-l> <c-w>l
map <S-h> <c-w>h

" No arrow keys :)
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" because :qa hurts my pinky
map mm <Esc>:qa<Return>

map <leader>tl :TlistToggle<CR>

" Ultinsips Config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsListSnippets="<S-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Syntastic Config
map <leader>s :SyntasticToggleMode<CR>
let g:syntastic_always_populate_loc_list=1

" Ctrlp Config
let g:ctrlp_map = '<S-p>'
let g:ctrlp_cmt = 'CtrlP'
let g:ctrlp_working_path_mode = 2          " CtrlP: use the nearest ancestor that contains one of these directories or files: .git/ .hg/ .svn/ .bzr/ _darcs/
set wildignore+=*/tmp/*,*.so,*.swp,*.zip   " MacOSX/Linux
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.hg$\|\.svn$\|node_modules',
    \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\|\.DS_Store',
    \ 'link': 'some_bad_symbolic_links',
    \ }
let g:ctrlp_follow_symlinks = 1


"Syntax  Highligting and Validation

let g:pyflakes_use_quickfix = 0

" Pep-8 checking
autocmd FileType python map <leader>8 :call Flake8()<CR>
let g:flake8_max_line_length=120
let g:flake8_ignore="E501,E128" " Ignore lines too long, and continuation line under-indented for visual indent 
let g:PyFlakeDefaultComplexity=10
let g:PyFlakeOnWrite = 1 
let g:PyFlakeSigns = 1
"Auto complete stuff for SuperTab
" au FileType python set omnifunc=pythoncomplete#Complete
" let g:SuperTabDefaultCompletionType = "context"
" set completeopt=menuone,longest,preview
set title
" Enable line numbers
set number

map ; :

" How many spaces a tab is
set smartindent
set hlsearch
autocmd BufWritePre *.py :%s/\s\+$//e
hi Search guibg=LightBlue
" colorscheme vividchalk
colorscheme molokai

hi Search cterm=NONE ctermfg=black ctermbg=yellow

" Case sensitivity
set ignorecase
set smartcase

" Remember last positon of file where I left off at
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

setlocal colorcolumn=120
highlight ColorColumn guibg=Orange

hi DiffAdd      ctermfg=bg      ctermbg=113     cterm=none      guifg=bg        guibg=#95e454   gui=none
hi DiffDelete   ctermfg=bg      ctermbg=173     cterm=none      guifg=bg        guibg=#e5786d   gui=none
hi DiffText     ctermfg=0       ctermbg=11     cterm=none      guifg=#000000   guibg=#88b8f6   gui=none
hi DiffChange                   ctermbg=238                                     guibg=#444444

" POWERLINE
set nocompatible
set laststatus=2
let g:Powerline_symbols = 'unicode'

" the z. below centers the change in the middle of your screen
if &diff
    nnoremap <Enter> ]cz.
    nnoremap <Space> [cz. 
endif
set list listchars=tab:».,trail:.
hi NonText ctermfg=7 guifg=gray


" Swap window locations
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" Jedi
let g:jedi#popup_on_dot = 0

" Indent guides
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=darkgrey
"inoremap <CR> <CR>x<BS>
"nnoremap o ox<BS>
"nnoremap O Ox<BS>

""""""""""""""""
"    RUBY    "
""""""""""""""""
autocmd FileType ruby colorscheme badwolf
autocmd BufWritePre *.rb :%s/\s\+$//e " remove trailing white space on save
let g:syntastic_ruby_checkers=['rubocop', 'mri']

""""""""""""""""
"    PYTHON    "
""""""""""""""""
autocmd BufWritePre *.py :%s/\s\+$//e " remove trailing white space on save
let g:syntastic_python_checkers=['pylint', 'flake8']

""""""""""""""""
"    Java      "
""""""""""""""""
autocmd FileType java colorscheme molokai
autocmd BufWritePre *.java :%s/\s\+$//e " remove trailing white space on save

""""""""""""""""
"     JSON     "
""""""""""""""""
au! BufRead,BufNewFile *.json set filetype=json

augroup json_autocmd 
    autocmd! 
    autocmd FileType json set autoindent 
    autocmd FileType json set formatoptions=tcq2l 
    autocmd FileType json set textwidth=78 shiftwidth=2 
    autocmd FileType json set softtabstop=2 tabstop=8 
    autocmd FileType json set expandtab 
    autocmd FileType json set foldmethod=syntax 
augroup END
