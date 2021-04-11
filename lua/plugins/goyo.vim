hi! StatusLine guibg=None
hi! VertSplit guibg=None

noremap <silent> <leader>z <cmd>Goyo<cr>

function! s:goyo_enter()
        " Remove artifacts for NeoVim on true colors transparent background.
        " guifg is the terminal's background color.
        hi! VertSplit gui=NONE guifg=#1b202a guibg=NONE
        hi! StatusLine gui=NONE guifg=#1b202a guibg=NONE
        hi! StatusLineNC gui=NONE guifg=#1b202a guibg=NONE
endfunction

au! User GoyoEnter
au  User GoyoEnter nested call <SID>goyo_enter()
