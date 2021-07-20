------------------------------- Sourcing ---------------------------------------

-- This file executes all the plugins. This file itself will be executed from
-- the init.lua file. This file serves as the entrypoint to the plugins folder
-- under lua (/lua/plugins/). Executing plugins will execute this file which
-- in turn execute the specific plugin mentioned.
--
-- NOTE: names must begin with plugins followed by the name of the folder the
-- plugin is placed in.

require "plugins.colorscheme"
require "plugins.file-tree"
require "plugins.finder"
require "plugins.parser"
require "plugins.auto-completion"
-- require "plugins.term"
require "plugins.undo-tree"
require "plugins.diff-view"
require "plugins.icons"
require "plugins.statusline"
require "plugins.whichkey"
require "plugins.launch-screen"
require "plugins.auto-pairs"
require "plugins.etc"
require "plugins.tabline"
require "plugins.git"
