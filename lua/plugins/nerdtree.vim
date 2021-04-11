let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:DTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize =30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

nnoremap <silent><leader>nf :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <silent><F3> :NERDTreeToggle<CR>
nnoremap <leader>v :NERDTreeFind<CR>
