require"toggleterm".setup{
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  persist_size = true,
  direction = 'vertical' | 'horizontal' | 'window' | 'float',
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_win_open'
    -- see :h nvim_win_open for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    -- width = <value>,
    -- height = <value>,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
-- " set
-- let g:toggleterm_terminal_mapping = '<C-t>'
-- " or manually...
-- autocmd TermEnter term://*toggleterm#*
--       \ tnoremap <silent><c-t> <C-\><C-n>:exe v:count1 . "ToggleTerm"<CR>

-- " By applying the mappings this way you can pass a count to your
-- " mapping to open a specific window.
-- " For example: 2<C-t> will open terminal 2
-- nnoremap <silent><c-t> :<c-u>exe v:count1 . "ToggleTerm"<CR>
-- inoremap <silent><c-t> <Esc>:<c-u>exe v:count1 . "ToggleTerm"<CR>
