set nocompatible
filetype off


" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
if &compatible
    set nocompatible               " Be iMproved
endif

" ==============
" : NeoBundle  :
" ==============

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

set autoindent
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Valloric/YouCompleteMe', {
     \ 'build' : {
     \     'mac' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
     \     'unix' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
     \     'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
     \     'cygwin' : './install.sh --clang-completer --system-libclang --omnisharp-completer'
     \    }
     \ }
NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'andviro/flake8-vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'elzr/vim-json'
NeoBundle 'kevinw/pyflakes'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'Lokaltog/powerline-fonts'
NeoBundle 'bling/vim-airline'
NeoBundle 'jwhitley/vim-matchit'
NeoBundle 'faith/vim-go'
NeoBundle 'vim-scripts/Tagbar'
NeoBundle 'rking/ag.vim'
NeoBundle 'derekwyatt/vim-scala'

" Snippets are separated from the engine. Add this if you want them:
NeoBundle 'honza/vim-snippets'
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14
    endif
endif
""" FOR STATUSLINE
set t_Co=256
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols = 'fancy'
set rtp+=/Users/nate/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
" For powerline font in MacVim
set guifont=Menlo\ For\ Powerline
set fillchars+=stl:\ ,stlnc:\

filetyp plugin indent on " required

""" GENERAL VIM mappings

" Scroll between windows using <ctrl><direction>
map <C-j> <c-w>j
map <C-k> <c-w>k
map <C-l> <c-w>l
map <C-h> <c-w>h

" No arrow keys :)
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" because :qa hurts my pinky
map mm <Esc>:qa<Return>

" change directory to current window's file
map <leader>cd :lcd %:p:h<CR>
map <leader>o :Explore<CR>
map <leader>tl :TlistToggle<CR>
map <leader>r :redraw!<CR>

" saves by hitting s in command mode
nmap s :w<cr>

" When I hit y in visual-mode it copies to the system buffer
vmap y :w !pbcopy<CR><CR>

" ================
" :    Vim-Go     :
" ================
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']

" Allows me to use 'go' checker only after <leader>s, so it doesn't 
" check everytime I save.
let g:syntastic_mode_map={'mode': 'passive'}
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_wq=0
let g:syntastic_auto_loc_list=1

" =================
" : YouCompleteMe :
" =================

let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_key_list_accept_completion = ['<C-y>']


" =============
" : Ultisnips :
" =============

" hotkey mappings
nmap <leader>e :UltiSnipsEdit<cr>

let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsListSnippets="<S-Tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ==============
" : NERDTree   :
" ==============

nmap <leader>nt :NERDTree<cr>
nmap ,n :NERDTreeFind<CR>

" ==============
" :     AG     :
" ==============

map // :Ag 

let Tlist_Ctags_Cmd = "/usr/local/Cellar/ctags/5.8/bin/ctags"


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

" Syntastic Config
map <leader>s :SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" Ctrlp Config
" In the above example, the first option tells ctrlp to persist the cache in the configured location, 
" so when you launch vim again, it will read from there and load the cache (much faster).
"The second option configures ctrlp to use ag (the_silver_searcher) instead of vim's native globpath() 
"apis to search for files, this will drastically improve it's scanning speed, if you don't want to use ag, 
"you can even use plain old grep and it still should be significantly faster. Check :h 'g:ctrlp_user_command' 
"for more details.
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

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

let g:PyFlakeMaxLineLength = 100
" Pep-8 checking
"autocmd FileType python map <leader>8 :call Flake8()<CR>
let g:flake8_max_line_length=120
"let g:flake8_ignore="E501,E128" " Ignore lines too long, and continuation line under-indented for visual indent 
"let g:PyFlakeDefaultComplexity=10
"let g:PyFlakeOnWrite = 1 
"let g:PyFlakeSigns = 1

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


" ==============
" : LANGUAGES  :
" ==============
syntax on " syntax highlighting

" ==============
" :   GOLANG   :
" ==============

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
"let g:syntastic_java_javac_executable=['Java']

""""""""""""""""""""""
"     Javascript     "
""""""""""""""""""""""
let g:syntastic_javascript_checkers = ['eslint']

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

nnoremap ,b :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" so vim stops complaining when opening a file that another vim has opened.
" I know vim, just go read only. Obviously.
func CheckSwap()
  swapname
  if v:statusmsg =~ '\.sw[^p]$'
    set ro
  endif
endfunc
if &swf
  set shm+=A
  au BufReadPre * call CheckSwap()
endi

" so a diff between two files does not force a 'press a key to continue prompt'
if &diff
  set cmdheight=2
endi

" Backspace 
set backspace=indent,eol,start

" Commenting blocks of code.
" ,cc to comment a line
" ,cu to uncomment a line
"augroup comment_autocmd 
"    autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
"    autocmd FileType sh,ruby,python   let b:comment_leader = '# '
"    autocmd FileType conf,fstab       let b:comment_leader = '# '
"    autocmd FileType tex              let b:comment_leader = '% '
"    autocmd FileType mail             let b:comment_leader = '> '
"    autocmd FileType vim              let b:comment_leader = '" '
"    noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
    "noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
" augroup END
"
let g:go_fmt_autosave = 0
