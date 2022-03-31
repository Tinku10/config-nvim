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


-- include all the core settings (editor sepecific)
require "core"

-- include all the plugins config (plugins specific)
require "configs"
