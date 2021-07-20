------------------------------- Sourcing ---------------------------------------

-- This file executes all the library/framework LSPs. This file itself will be
-- executed from the init.lua file in the lsp folder (/lua/lsp/). This file
-- serves as the entrypoint to the library/framework specific LSPs.
--
-- NOTE: names must begin with lsp.lib followed by the name of the folder the
-- server will be located in.

require "lsp.lib.deno"
require "lsp.lib.groovy"
require "lsp.lib.tailwind"
require "lsp.lib.vue"
require "lsp.lib.efm"
