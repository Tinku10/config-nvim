-- vim.g.nvim_tree_side = 'right' --left by default
-- vim.g.nvim_tree_width = 40 --"30 by default
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' } --"empty by default
vim.g.nvim_tree_gitignore = 1 --"0 by default
vim.g.nvim_tree_auto_open = 1 --"0 by default, opens the tree when typing `vim $DIR` or `vim`
vim.g.nvim_tree_auto_close = 1 --"0 by default, closes the tree when it's the last window
vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } --"empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_quit_on_open = 1 --"0 by default, closes the tree when you open a file
vim.g.nvim_tree_follow = 1 --"0 by default, this option allows the cursor to be updated when entering a buffer
-- vim.g.nvim_tree_indent_markers = 1 --"0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_hide_dotfiles = 0 --"0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_git_hl = 1 --"0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_root_folder_modifier = ':~' --"This is the default. See :help filename-modifiers for more options
vim.g.nvim_tree_tab_open = 1 --"0 by default, will open the tree when entering a new tab and the tree was previously open
vim.g.nvim_tree_width_allow_resize  = 1 --"0 by default, will not resize the tree when opening a file
-- vim.g.nvim_tree_disable_netrw = 0 --"1 by default, disables netrw
-- vim.g.nvim_tree_hijack_netrw = 1 --"1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
vim.g.nvim_tree_add_trailing = 1 --"0 by default, append a trailing slash to folder names
vim.g.nvim_tree_group_empty = 1 --" 0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_lsp_diagnostics = 0 --"0 by default, will show lsp diagnostics in the tree. See :help nvim_tree_lsp_diagnostics
vim.g.nvim_tree_show_icons = {
   ['git']= 1,
   ['folders']= 1,
   ['files']= 0
}
-- "If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- "1 by default, notice that if 'files' is 1, it will only display
-- "if nvim-web-devicons is installed and on your runtimepath

-- " default will show icon by default if no icon is provided
-- " default shows no icon by default
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_bindings = {
    -- mappings
    ["<CR>"] = tree_cb("edit"),
    ["l"] = tree_cb("edit"),
    ["o"] = tree_cb("edit"),
    ["<2-LeftMouse>"] = tree_cb("edit"),
    ["<2-RightMouse>"] = tree_cb("cd"),
    ["<C-]>"] = tree_cb("cd"),
    ["v"] = tree_cb("vsplit"),
    ["s"] = tree_cb("split"),
    ["<C-t>"] = tree_cb("tabnew"),
    ["h"] = tree_cb("close_node"),
    ["<BS>"] = tree_cb("close_node"),
    ["<S-CR>"] = tree_cb("close_node"),
    ["<Tab>"] = tree_cb("preview"),
    ["I"] = tree_cb("toggle_ignored"),
    ["H"] = tree_cb("toggle_dotfiles"),
    ["R"] = tree_cb("refresh"),
    ["a"] = tree_cb("create"),
    ["d"] = tree_cb("remove"),
    ["r"] = tree_cb("rename"),
    ["<C-r>"] = tree_cb("full_rename"),
    ["x"] = tree_cb("cut"),
    ["c"] = tree_cb("copy"),
    ["p"] = tree_cb("paste"),
    ["[c"] = tree_cb("prev_git_item"),
    ["]c"] = tree_cb("next_git_item"),
    ["-"] = tree_cb("dir_up"),
    ["q"] = tree_cb("close")
}

vim.g.nvim_tree_icons = {
  -- default = " ",
  -- default = ' ',
  -- symlink = ' ',
  git = {
    unstaged = " ",
    -- unstaged = " ",
    -- staged = " ",
    -- renamed = "➜ ",
    staged = " ",
    unmerged = " ",
    renamed = " ",
    -- untracked = " ",
    untracked = " ",
    -- ignored = "◌"
    ignored = " "
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = ""
    -- default = " ",
    -- open = " ",
    -- empty = " ",
    -- empty_open = " ",
    -- symlink = " "
  }
}

-------------------------------- Mappings ---------------------------------------

local utils = require('settings/utils')

vim.api.nvim_set_keymap('n', '<F3>', ':NvimTreeToggle<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>v', ':NvimTreeFind<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<cr>', { noremap = true, silent = true })
