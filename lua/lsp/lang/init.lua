------------------------------- Sourcing ---------------------------------------

-- This file executes all the language LSPs. This file itself will be executed
-- from the init.lua file in the lsp folder (/lua/lsp). This file serves as the
-- entrypoint to the language specific LSPs.
--
-- NOTE: names must begin with lsp.lang followed by the name of the folder the
-- server will be located in.

require "lsp.lang.clang"
require "lsp.lang.lua"
require "lsp.lang.typescript"
require "lsp.lang.python"
require "lsp.lang.viml"
require "lsp.lang.html"
require "lsp.lang.css"
require "lsp.lang.bashls"
