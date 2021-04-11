" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" turn off auto popup for completion
" let g:completion_enable_auto_popup = 0

"map <c-p> to manually trigger completion
" imap <silent> <c-p> <Plug>(completion_trigger)

" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
" let g:completion_enable_snippet = 'UltiSnips'

let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

" disable auto hover popup
" let g:completion_enable_auto_hover = 0

" disable auto signature popup
" let g:completion_enable_auto_signature = 0

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

let g:completion_matching_ignore_case = 1

let g:completion_matching_smart_case = 1

let g:completion_trigger_character = ['.', '::']

" augroup CompletionTriggerCharacter
"     autocmd!
"     autocmd BufEnter * let g:completion_trigger_character = ['.']
"     autocmd BufEnter *.c,*.cpp let g:completion_trigger_character = ['.', '::']
" augroup end

" let g:completion_trigger_keyword_length = 3 " default = 1
" let g:completion_trigger_on_delete = 1
" let g:completion_timer_cycle = 200 "default value is 80
