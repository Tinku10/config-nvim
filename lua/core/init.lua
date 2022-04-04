-- vim.cmd("source " .. vim.fn.stdpath("config") .. "/lua/configs/gruvbox.vim")

local configs = {
  "editor",
  "keymaps",
  "lsp",
  "plugins",
  "colors",
  "user",
  "highlights",
  "autocommands"
}

for _, src in ipairs(configs) do
  local status, err = pcall(require, "core." .. src)
  if not status then
    print("[CORE] Error loading " .. src)
  end
end
