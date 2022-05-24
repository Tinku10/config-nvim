vim.cmd [[ packadd nvim-tree.lua ]]

vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } --"empty by default, don't auto open tree on specific filetypes.
-- vim.g.nvim_tree_quit_on_open = 1 --"0 by default, closes the tree when you open a file
vim.g.nvim_tree_git_hl = 1 --"0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_root_folder_modifier = ':~' --"This is the default. See :help filename-modifiers for more options
vim.g.nvim_tree_width_allow_resize  = 1 --"0 by default, will not resize the tree when opening a file
-- vim.g.nvim_tree_disable_netrw = 0 --"1 by default, disables netrw
-- vim.g.nvim_tree_hijack_netrw = 1 --"1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
vim.g.nvim_tree_add_trailing = 1 --"0 by default, append a trailing slash to folder names
vim.g.nvim_tree_group_empty = 1 --" 0 by default, compact folders that only contain a single folder into one node in the file tree
-- vim.g.nvim_tree_disable_window_picker = 1 --"0 by default, will disable the window picker.
-- vim.g.nvim_tree_icon_padding = ' ' --"one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
vim.g.nvim_tree_show_icons = {
   git= 1,
   folders= 1,
   files= 0
}
-- Dictionary of buffer option names mapped to a list of option values that
-- indicates to the window picker that the buffer's window should not be
-- selectable.
-- vim.g.nvim_tree_window_picker_exclude = {
--   filetype = { 'packer', 'qf' },
--   buftype = { 'terminal' }
-- }
vim.g.nvim_tree_special_files = {
  ['README.md']= 1,
  ['Makefile']= 1,
  ['MAKEFILE']= 1,
  ['LICENSE'] = 1
} 

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

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
    untracked = " ",
    -- untracked = " ",
    -- ignored = "◌"
    ignored = " "
  },
  folder = {
    -- default = "",
    -- open = "",
    -- empty = "",
    -- empty_open = ""
    default = " ",
    open = " ",
    empty = " ",
    empty_open = " ",
    symlink = " "
  },
  -- lsp = {
  --   hint= "",
  --   info= "",
  --   warning= "",
  --   error= "",
  -- }
}

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = true,
      resize_window = false,
      window_picker = {
        enable = false,
        exclude = {
          filetype = { 'packer', 'qf' },
          buftype = { 'terminal' }
        },
      }
    }
  },
  view = {
    -- width of the window, can be either a number (columns) or a string in `%`
    width = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
    hide_root_folder = false,
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {
        { key = {"<CR>", "o", "<2-LeftMouse>", "l"},  cb = tree_cb("edit") },
        { key = {"<2-RightMouse>", "<C-]>"},          cb = tree_cb("cd") },
        { key = "<C-v>",                              cb = tree_cb("vsplit") },
        { key = "<C-x>",                              cb = tree_cb("split") },
        { key = "<C-t>",                              cb = tree_cb("tabnew") },
        { key = "<",                                  cb = tree_cb("prev_sibling") },
        { key = ">",                                  cb = tree_cb("next_sibling") },
        { key = "P",                                  cb = tree_cb("parent_node") },
        { key = {"<BS>", "h"},                        cb = tree_cb("close_node") },
        { key = "<S-CR>",                             cb = tree_cb("close_node") },
        { key = "<Tab>",                              cb = tree_cb("preview") },
        { key = "K",                                  cb = tree_cb("first_sibling") },
        { key = "J",                                  cb = tree_cb("last_sibling") },
        { key = "I",                                  cb = tree_cb("toggle_ignored") },
        { key = "H",                                  cb = tree_cb("toggle_dotfiles") },
        { key = "R",                                  cb = tree_cb("refresh") },
        { key = "a",                                  cb = tree_cb("create") },
        { key = "d",                                  cb = tree_cb("remove") },
        { key = "r",                                  cb = tree_cb("rename") },
        { key = "<C-r>",                              cb = tree_cb("full_rename") },
        { key = "x",                                  cb = tree_cb("cut") },
        { key = "c",                                  cb = tree_cb("copy") },
        { key = "p",                                  cb = tree_cb("paste") },
        { key = "y",                                  cb = tree_cb("copy_name") },
        { key = "Y",                                  cb = tree_cb("copy_path") },
        { key = "gy",                                 cb = tree_cb("copy_absolute_path") },
        { key = "[c",                                 cb = tree_cb("prev_git_item") },
        { key = "]c",                                 cb = tree_cb("next_git_item") },
        { key = "-",                                  cb = tree_cb("dir_up") },
        { key = "q",                                  cb = tree_cb("close") },
        { key = "g?",                                 cb = tree_cb("toggle_help") },
      }
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
}
-------------------------------- Mappings ---------------------------------------

-- local utils = require('settings/utils')

vim.api.nvim_set_keymap('n', '<F3>', ':NvimTreeToggle<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>v', ':NvimTreeFindFileToggle<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<cr>', { noremap = true, silent = true })
