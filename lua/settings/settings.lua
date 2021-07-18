-- vim options (:set)
vim.o.encoding = 'UTF-8'
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
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = '~/.config/nvim/undodir'
vim.o.incsearch = true
vim.o.showtabline = true
vim.o.scrolloff = 8
vim.o.showmode = false
vim.o.linespace = 3
vim.o.showmatch = true
vim.o.cursorline = true
vim.o.cmdheight = 1
vim.o.updatetime = 5
vim.o.wrap = false
vim.o.termguicolors = true
vim.o.pastetoggle = '<F2>'
vim.o.colorcolumn = 80
vim.o.windignore = vim.o.windignore + '~/.config/nvim/undodir/*'
vim.o.shortmess:append({ c = true })

-- vim variables (:let)
vim.g.mapleader = " "
vim.g.move_key_modifier = 'S'

-- vim autocommands (autocmd)
-- vim.cmd("autocmd BufNewFile *.c,*.cc,*.cpp,*.h call Template('~/Documents/dsa/BaseTemplate/template.h')")
vim.cmd('autocmd TermOpen * startinsert')
vim.cmd('autocmd BufLeave term://* stopinsert')

-- custom functions
local M = {}

M.trim_white_space = function()
  local current_view = vim.fn.winsaveview()
  vim.regex("%s[ ]+$//e")
  vim.fn.winrestview(current_view)
end

return M
