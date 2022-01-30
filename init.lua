-- ┌┐┌┐ ┌┐┌┐┌─┬┐   ┌┐
-- ││├┼─┤└┤└┤││├─┬─┼┼──┐
-- │└┤│┼│││┌┤││├┐│┌┤││││
-- └─┴┼┐├┴┴─┴┴─┘└─┘└┴┴┴┘
--    └─┘    N E O V I M


-- This file is the entry point for the configuration.
--
-- NOTE: sourcing this file may not re-execute the entire configuration
-- as modules are imported using require instead of sourcing. So if a module
-- is already required, re-executing will not re-require everything but just
-- the files it didn't load before.
--
-- Of course this can be taken care of using (:so[urce] filename) or
-- (:luafile filename). Read more about them using (:h so[urce]) or
-- (:h luafile).


-- include all the settings (editor sepecific)
require "editor"
require "keymaps"
require "plugins"
require "lsp"
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/lua/settings.vim')

-- include all the plugins (plugins specific)
require "configs"
require "highlights"


-- automatically ensure that packer.nvim is installed
-- on any machine you clone your configuration to
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

-- vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost configs.lua PackerCompile'

