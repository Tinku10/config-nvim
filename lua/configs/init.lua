------------------------------- Sourcing ---------------------------------------

-- This file executes all the plugins. This file itself will be executed from
-- the init.lua file. This file serves as the entrypoint to the plugins folder
-- under lua (/lua/plugins/). Executing plugins will execute this file which
-- in turn execute the specific plugin mentioned.
--
-- NOTE: names must begin with configs followed by the name of the folder the
-- plugin is placed in.

vim.cmd("source " .. vim.fn.stdpath("config") .. "/lua/configs/gruvbox.vim")
vim.cmd("source " .. vim.fn.stdpath("config") .. "/lua/configs/undotree.vim")

local configs = {
	"lspinstall",
	"nvimtree",
	"telescope",
	"treesitter",
	"completion",
  "motion",
	-- "diffview",
	"icons",
	"statusline",
	"whichkey",
	"autopairs",
	"colorizer",
	"git",
	-- "gitsigns",
	"indentmarkers",
	"org",
  -- "dashboard",
  -- "trouble",
  -- "zenmode",
  -- "dim",
  -- "godbolt"
}

for _, src in ipairs(configs) do
  local status, err = pcall(require, "configs." .. src)
  if not status then
    print("[CONFIG] Error loading " .. src)
  end
end
