" basic settings done in vim
set guicursor=
set encoding=UTF-8
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
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
" Give more space for displaying messages.
set cmdheight=2
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

let mapleader = " " 

" nnoremap <silent> <F3> :NERDTreeToggle<CR>

" prepopulate the file with a template
function Template(tmpl_file)
    exe "0read " . a:tmpl_file
    let substDict = {}
    let substDict["name"] = "pasnger" 
    let substDict["date"] = strftime("%Y %b %d %X")
    exe '%s/<<\([^>]*\)>>/\=substDict[submatch(1)]/g'
    set nomodified
    normal G
endfunction

autocmd BufNewFile *.c,*.cc,*.cpp,*.h call Template("~/.vim/tmpl.cpp")

" kind of autosave 
" autocmd TextChanged,TextChangedI <buffer> silent write
" augroup autosave
"     autocmd!
"     autocmd BufRead * if &filetype == "" | setlocal ft=text | endif
"     autocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 | silent write | endif
" augroup END
