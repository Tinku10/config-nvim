" Move to previous/next
nnoremap <silent>    <leader>bp :BufferPrevious<CR>
nnoremap <silent>    <leader>bn :BufferNext<CR>
" Re-order to previous/next
" nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
" nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
" nnoremap <silent>    <A-1> :BufferGoto 1<CR>
" nnoremap <silent>    <A-2> :BufferGoto 2<CR>
" nnoremap <silent>    <A-3> :BufferGoto 3<CR>
" nnoremap <silent>    <A-4> :BufferGoto 4<CR>
" nnoremap <silent>    <A-5> :BufferGoto 5<CR>
" nnoremap <silent>    <A-6> :BufferGoto 6<CR>
" nnoremap <silent>    <A-7> :BufferGoto 7<CR>
" nnoremap <silent>    <A-8> :BufferGoto 8<CR>
" nnoremap <silent>    <A-9> :BufferLast<CR>
" Close buffer
nnoremap <silent>    <leader>bc :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used

" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" Enable/disable animations
let bufferline.animation = v:true

" Enable/disable auto-hiding the tab bar when there is a single buffer
let bufferline.auto_hide = v:true

" Enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:false

" Enable/disable close button
let bufferline.closable = v:false

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:false

" Enable/disable icons
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
let bufferline.icons = v:false

" Sets the icon's highlight group.
" If false, will use nvim-web-devicons colors
let bufferline.icon_custom_colors = v:false

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = ''
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'

" Sets the maximum padding width with which to surround each tab
let bufferline.maximum_padding = 2

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
  \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the name of unnamed buffers. By default format is "[Buffer X]"
" where X is the buffer number. But only a static string is accepted here.
let bufferline.no_name_title = v:null

" let fg_target = 'red'

" let fg_current  = s:fg(['Normal'], '#efefef')
" let fg_visible  = s:fg(['TabLineSel'], '#efefef')
" let fg_inactive = s:fg(['TabLineFill'], '#888888')

" let fg_modified  = s:fg(['WarningMsg'], '#E5AB0E')
" let fg_special  = s:fg(['Special'], '#599eff')
" let fg_subtle  = s:fg(['NonText', 'Comment'], '#555555')

" let bg_current  = s:bg(['Normal'], '#000000')
" let bg_visible  = s:bg(['TabLineSel', 'Normal'], '#000000')
" let bg_inactive = s:bg(['TabLineFill', 'StatusLine'], '#000000')

" Meaning of terms:
"
" format: "Buffer" + status + part
"
" status:
"     *Current: current buffer
"     *Visible: visible but not current buffer
"    *Inactive: invisible but not current buffer
"
" part:
"        *Icon: filetype icon
"       *Index: buffer index
"         *Mod: when modified
"        *Sign: the separator between buffers
"      *Target: letter in buffer-picking mode
"
" BufferTabpages: tabpage indicator
" BufferTabpageFill: filler after the buffer section

" call s:hi_all([
" \ ['BufferCurrent',        fg_current,  bg_current],
" \ ['BufferCurrentIndex',   fg_special,  bg_current],
" \ ['BufferCurrentMod',     fg_modified, bg_current],
" \ ['BufferCurrentSign',    fg_special,  bg_current],
" \ ['BufferCurrentTarget',  fg_target,   bg_current,   'bold'],
" \ ['BufferVisible',        fg_visible,  bg_visible],
" \ ['BufferVisibleIndex',   fg_visible,  bg_visible],
" \ ['BufferVisibleMod',     fg_modified, bg_visible],
" \ ['BufferVisibleSign',    fg_visible,  bg_visible],
" \ ['BufferVisibleTarget',  fg_target,   bg_visible,   'bold'],
" \ ['BufferInactive',       fg_inactive, bg_inactive],
" \ ['BufferInactiveIndex',  fg_subtle,   bg_inactive],
" \ ['BufferInactiveMod',    fg_modified, bg_inactive],
" \ ['BufferInactiveSign',   fg_subtle,   bg_inactive],
" \ ['BufferInactiveTarget', fg_target,   bg_inactive,  'bold'],
" \ ['BufferTabpages',       fg_special,  bg_inactive, 'bold'],
" \ ['BufferTabpageFill',    fg_inactive, bg_inactive],
" \ ])

" call s:hi_link([
" \ ['BufferCurrentIcon',  'BufferCurrent'],
" \ ['BufferVisibleIcon',  'BufferVisible'],
" \ ['BufferInactiveIcon', 'BufferInactive'],
" \ ])

" NOTE: this is an example taken from the source, implementation of
" s:fg(), s:bg(), s:hi_all() and s:hi_link() is left as an exercise
" for the reader.
