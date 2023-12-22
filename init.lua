-- Set editor flags
require("flags")

-- Load default keymaps
-- Lazy keymaps will be setup by the plugin
-- Event keymaps will be setup by the autocmds
require("keymaps").create_default_keymaps()

-- Install and configure plugins
require("plugins")

-- Set up autocmds
require("autocmds")
