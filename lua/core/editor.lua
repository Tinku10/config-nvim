-- This file contains
--    - all editor settings including all options and global
--    - vim variables plus some functions
--    - all editor commands and autocommands

-- vim options (:set)
vim.o.encoding = "UTF-8"
vim.o.relativenumber = true
vim.o.hlsearch = true
vim.o.hidden = true
vim.o.errorbells = false
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.nu = true
vim.o.smartcase = true
-- vim.o.ignorecase = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.stdpath("config") .. "/undodir"
vim.o.undofile = true
vim.o.incsearch = true
vim.o.showtabline = 1
vim.o.scrolloff = 8
vim.o.showmode = false
vim.o.linespace = 3
vim.o.showmatch = true
vim.o.cursorline = true
vim.o.cmdheight = 1
vim.o.updatetime = 5
vim.o.wrap = false
vim.o.termguicolors = true
vim.o.pastetoggle = "<F2>"
vim.o.colorcolumn = "80"
vim.o.wildignore = vim.o.wildignore .. vim.fn.stdpath("config") .. "/undodir/*"
vim.opt.shortmess:append({ c = true })
vim.o.laststatus = 3
vim.o.scrolloff = 999

-- vim variables (:let)
vim.g.mapleader = " "
vim.g.move_key_modifier = "S"
