" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/tinku/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/tinku/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/tinku/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/tinku/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/tinku/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["FTerm.nvim"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/FTerm.nvim"
  },
  Tabtastic = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/Tabtastic"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["completion-nvim"] = {
    after = { "vim-vsnip", "vim-vsnip-integ" },
    loaded = false,
    needs_bufread = false,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/opt/completion-nvim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  nerdtree = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/nerdtree"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-colorschemes"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/vim-colorschemes"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-man"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/vim-man"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-ripgrep"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/vim-ripgrep"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-vsnip"] = {
    load_after = {
      ["completion-nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    after_files = { "/home/tinku/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ/after/plugin/vsnip_integ.vim" },
    load_after = {
      ["completion-nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tinku/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
