" basic settings done in vim
" this will be replaced by a lua based settings file
syntax on
set guicursor=
set encoding=UTF-8
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set hlsearch
set showtabline =1
set scrolloff=8
set noshowmode
set linespace=3
set completeopt=menuone,noinsert,noselect
set showmatch
set cursorline
" Give more space for displaying messages.
set cmdheight=1
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=5
filetype plugin on
set nocompatible
set nowrap
set termguicolors
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" set rtp+=~/.nvim/bundle/nerdtree
set pastetoggle=<F2>
set colorcolumn=80

set wildignore+=~/.config/nvim/undodir/*

let mapleader = " "
let g:move_key_modifier = 'S'
" nnoremap <silent> <F3> :NERDTreeToggle<CR>

" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"

" prepopulate the file with a template
function Template(tmpl_file)
    exe "0read " . a:tmpl_file
    let substDict = {}
    let substDict["name"] = "pasnger" 
    let substDict["date"] = strftime("%Y %b %d %X")
    " exe '%s/<<\([^>]*\)>>/\=substDict[submatch(1)]/g'
    set nomodified
    normal G
endfunction

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

command! TrimWhitespace call TrimWhitespace()

autocmd BufNewFile *.c,*.cc,*.cpp,*.h call Template("~/Desktop/codes/dsa/BaseTemplate/template.h")
" hi MatchParen cterm=bold ctermbg=none ctermfg=229
" kind of autosave 
" autocmd TextChanged,TextChangedI <buffer> silent write
" augroup autosave
"     autocmd!
"     autocmd BufRead * if &filetype == "" | setlocal ft=text | endif
"     autocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 | silent write | endif
" augroup END
"

" autocmd InsertLeave * write
autocmd TermOpen * startinsert
" autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
map <F8> :w <CR> :term  g++ -Wall -Wextra -pedantic -std=c++17 -O2 -Wformat=2 -Wfloat-equal -Wconversion -Wcast-qual -Wunused-variable -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -fsanitize=address -fsanitize=undefined -fno-sanitize-recover=all -fstack-protector %; if [ -f a.out  ]; then time ./a.out; rm a.out; fi <CR>
nnoremap <C-c> :w <CR> :!g++ -o  %:r % -std=c++17 -Wall -fsanitize=address -fsanitize=undefined -Wshift-overflow <CR>
" nnoremap <C-c> :w <CR> :!clear; makef %:r <CR>
nnoremap <C-x> :term ./%:r <Enter>
