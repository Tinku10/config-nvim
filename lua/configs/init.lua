------------------------------- Sourcing ---------------------------------------

-- This file executes all the plugins. This file itself will be executed from
-- the init.lua file. This file serves as the entrypoint to the plugins folder
-- under lua (/lua/plugins/). Executing plugins will execute this file which
-- in turn execute the specific plugin mentioned.
--
-- NOTE: names must begin with plugins followed by the name of the folder the
-- plugin is placed in.

vim.cmd('source ' .. vim.fn.stdpath('config') .. '/lua/configs/gruvbox.vim')
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/lua/configs/undotree.vim')

require "configs.lspinstall"
require "configs.nvimtree"
require "configs.telescope"
require "configs.treesitter"
require "configs.completion"
require "configs.diffview"
require "configs.icons"
require "configs.statusline"
require "configs.whichkey"
require "configs.dashboard"
require "configs.autopairs"
require "configs.git"
