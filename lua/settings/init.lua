------------------------------- Sourcing ----------------------------------------

-- automatically ensure that packer.nvim is installed
-- on any machine you clone your configuration to

local fn = vim.fn
local execute = vim.api.nvim_command

-- local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

require "settings.plugins"
-- require "settings.utils"
require "settings.common"
vim.cmd('source ~/.config/nvim/lua/settings/settings.vim')


-- vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
