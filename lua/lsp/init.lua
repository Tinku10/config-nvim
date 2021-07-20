------------------------------- Sourcing ---------------------------------------

-- This file executes all the LSPs. This file itself will be executed from
-- the init.lua file. This file serves as the entrypoint to the lsp folder
-- under lua (/lua/lsp/).
--
-- For convinience lsp folder is divided into two subfolders:
--    - lang: this will contain all the language specific servers
--    - lib: this will contain all the frameworks and libraries LSPs
--
-- NOTE: names must begin with lsp followed by the name of the folder the
-- plugin is placed in.

-- include all libraries/frameworks
require "lsp.lib"

-- include all languages
require "lsp.lang"

-- include common setup for all
require "lsp.common"
