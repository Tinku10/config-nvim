require "settings.plugins"
require "settings.utils"
vim.cmd('source ~/.config/nvim/lua/settings/settings.vim')

local fn = vim.fn
local execute = vim.api.nvim_command

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
