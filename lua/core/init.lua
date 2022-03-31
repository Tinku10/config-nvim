-- vim.cmd("source " .. vim.fn.stdpath("config") .. "/lua/configs/gruvbox.vim")

local configs = {
  "editor",
  "keymaps",
  "lsp",
  "plugins",
  "colors",
  "user-settings",
  "highlights"
}

for _, src in ipairs(configs) do
  local status, err = pcall(require, "core." .. src)
  if not status then
    print("[CORE] Error loading " .. src)
  end
end
