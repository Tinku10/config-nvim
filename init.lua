-- Set editor flags
require("flags")

-- Load default keymaps
-- Lazyloaded keymaps will be setup by the plugins
-- Event-based keymaps will be setup by the autocmds
require("keymaps")

-- Install and configure plugins
require("plugins")

-- Set up autocmds
require("autocmds")

require("lsp")
