
" Needed for pathogen must be off when you run certain commands
call pathogen#infect()
filetype off
call pathogen#helptags()
syntax on " syntax highlighting
filetype plugin indent on

" ==============
" : Whitespace :
" ==============
"
set autoindent
"
set expandtab               " insert space instead of tab
set shiftround              " rounds indent to a multiple of shiftwidth
set shiftwidth=4            " makes # of spaces = 4 for new tab
set softtabstop=4           " makes the spaces feel like tab
set tabstop=4               " makes # of spaces = 8 for preexisitng tab
"

au! BufRead,BufNewFile *.json set filetype=json 


autocmd BufWritePre *.py :%s/\s\+$//e " remove trailing white space on save
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


map <leader>td <Plug>TaskList

"Syntax Highligting and Validation

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
colorscheme vividchalk
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

let g:syntastic_python_checkers=['pylint', 'flake8']

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
