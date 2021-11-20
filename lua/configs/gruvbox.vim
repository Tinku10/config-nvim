let g:gruvbox_italic ='1' 
" let g:gruvbox_italicize_strings ='1' 
colorscheme gruvbox
set background=dark

" using highlight group after inseting the colorscheme
" otherwise colorscheme can overwrite this setting
highlight Comment cterm=italic gui=italic

let g:gruvbox_contrast_dark = 'medium'

" allow Vim to have a transparent background of the terminal
" hi! Normal ctermbg=NONE guibg=NONE

" 1 -> inverted selection on
let g:gruvbox_invert_selection='1'

" using highlight group after inseting the colorscheme
" otherwise colorscheme can overwrite this setting
highlight Comment cterm=italic gui=italic
