vim.cmd [[ packadd dashboard-nvim ]]

vim.g.dashboard_custom_header = {

  -- ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  -- ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  -- ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  -- ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  -- ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  -- ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  -- '   _____   __          ___    ______            ',
  -- '   ___  | / /____________ |  / /__(_)______ ___ ',
  -- '   __   |/ /_  _ \\  __ \\_ | / /__  /__  __ `__ \\ ',
  -- '   _  /|  / /  __/ /_/ /_ |/ / _  / _  / / / / /',
  -- '   /_/ |_/  \\___/\\____/_____/  /_/  /_/ /_/ /_/ ',
  -- '                                                '
  -- '    _  __________ _   ________  ___  ',
  -- '   / |/ / __/ __ \\ | / /  _/  |/  /  ',
  -- '  /    / _// /_/ / |/ // // /|_/ /   ',
  -- ' /_/|_/___/\\____/|___/___/_/  /_/    '
  --
  -- ' ┌─┐ ┌──┐┌──┐┌┐┌┐┌┐┌┐┌┐ ',
  -- ' │┌┐┐││─┤│┌┐││└┘│├┤│└┘│ ',
  -- ' ││││││─┤│└┘│└┐┌┘││││││ ',
  -- ' └┘└┘└──┘└──┘ └┘ └┘└┴┴┘ ',
  -- '       N E O V I M      '
  -- ' ┌┐┌┐ ┌┐┌┐┌─┬┬┐ ┌┬┐    ',
  -- ' ││├┼─┤└┤└┤│││└┬┘├┼──┐ ',
  -- ' │└┤│┼│││┌┤││├┐│┌┤││││ ',
  -- ' └─┴┼┐├┴┴─┴┴─┘└─┘└┴┴┴┘ ',
  -- '    └─┘    N E O V I M ',
  ' ┌┐┌┐ ┌┐┌┐┌─┬┐   ┌┐    ',
  ' ││├┼─┤└┤└┤││├─┬─┼┼──┐ ',
  ' │└┤│┼│││┌┤││├┐│┌┤││││ ',
  ' └─┴┼┐├┴┴─┴┴─┘└─┘└┴┴┴┘ ',
  '    └─┘    N E O V I M ',
}

vim.g.dashboard_default_executive = 'telescope'

-- vim.g.dashboard_custom_shortcut = {
--   last_session       = 'SPC s l',
--   find_history       = 'SPC f h',
--   find_file          = 'SPC f f',
--   new_file           = 'SPC c n',
--   change_colorscheme = 'SPC t c',
--   find_word          = 'SPC f a',
--   book_marks         = 'SPC f b',
-- }

vim.g.dashboard_custom_section = {
    a = {description = {'  Find File                              SPC f f'}, command = 'Telescope find_files'},
    b = {description = {'  Recently Used Files                    SPC f h'}, command = 'Telescope oldfiles'},
    c = {description = {'  Load Last Session                      SPC s l'}, command = 'SessionLoad'},
    d = {description = {'  Grep Word                              SPC f g'}, command = 'Telescope live_grep'},
    e = {description = {'  Configuration                          SPC f d'}, command = 'lua require("plugins.finder.setup").dotfiles()'}
}

-- vim.g.dashboard_custom_shortcut_icon['last_session'] = ' '
-- vim.g.dashboard_custom_shortcut_icon['find_history'] = 'ﭯ '
-- vim.g.dashboard_custom_shortcut_icon['find_file'] = ' '
-- vim.g.dashboard_custom_shortcut_icon['new_file'] = ' '
-- vim.g.dashboard_custom_shortcut_icon['change_colorscheme'] = ' '
-- vim.g.dashboard_custom_shortcut_icon['find_word'] = ' '
-- vim.g.dashboard_custom_shortcut_icon['book_marks'] = ' '

-- custom function
-- let g:dashboard_custom_section={
--   \ 'buffer_list': {
--       \ 'description': [' Recently lase session                 SPC b b'],
--       \ 'command': 'Some Command' or function('your funciton name') }
--   \ }

vim.api.nvim_set_keymap('n', '<leader>ss', ':<C-u>SessionSave<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sl', ':<C-u>SessionLoad<CR>', { noremap = true })

-- vim.g.dashboard_custom_footer =  {'Super-charged by neovim. Super-powered by you.'}
