-- these are mappings related to the editor and not plugins
-- settings.vim and mappings.lua will be combined to one file to have editor only settings

local utils = require('settings/utils')

-- most important mapping
utils.map('i', 'jj', '<Esc>')
