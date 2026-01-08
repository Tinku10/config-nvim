local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"neovim/nvim-lspconfig",
			"onsails/lspkind-nvim",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				preselect = "None",
				snippet = {
					expand = function(args)
						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
						-- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
					end,
				},
				mapping = {
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					-- ["<CR>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<C-y>"] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					-- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
					["<Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end,
					["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lua" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					format = require("lspkind").cmp_format({
						with_text = true,
						maxwidth = 50,
						menu = {
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							nvim_lua = "[Lua]",
							latex_symbols = "[Latex]",
						},
					}),
				},
				completion = {
					completeopt = "menuone,noinsert,noselect",
				},
				experimental = {
					ghost_text = true,
					native_menu = false,
				},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-refactor" },
			{ "nvim-treesitter/playground" },
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-context",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"cpp",
					"go",
					"lua",
					"python",
					"rust",
					"tsx",
					"javascript",
					"typescript",
					"vimdoc",
					"vim",
					"bash",
				},
				auto_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
			require("keymaps").create_treesitter_keymaps()
		end,
		build = ":TSUpdate",
	},
	-- {
	-- 	"feline-nvim/feline.nvim",
	-- 	dependencies = {
	-- 		{ "kyazdani42/nvim-web-devicons" },
	-- 	},
	-- },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzy-native.nvim" },
		},
		config = function()
			require("keymaps").create_telescope_keymaps()
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			{ "kyazdani42/nvim-web-devicons" },
		},
		config = function()
			require("nvim-tree").setup({
				view = {
					preserve_window_proportions = true,
				},
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
			})
			require("keymaps").create_nvimtree_keymaps()
		end,
	},
	{
		"mbbill/undotree",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
			-- If you want insert `(` after select function or method item
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	config = function()
	-- 		vim.cmd([[colorscheme gruvbox]])
	-- 	end,
	-- },
	-- {
	-- "rebelot/kanagawa.nvim",
	-- 	config = function()
	-- 		vim.cmd("colorscheme kanagawa")
	-- 	end,
	-- },
	{
		"aktersnurra/no-clown-fiesta.nvim",
		config = function()
			vim.cmd("colorscheme no-clown-fiesta")
		end,
	},
	-- {
	-- 	"mellow-theme/mellow.nvim",
	-- 	config = function()
	-- 		local variants = require("mellow.colors")
	-- 		local cfg = require("mellow.config").config
	-- 		local c = variants[cfg.variant]

	-- 		vim.cmd("colorscheme mellow")

	-- 		-- Default values hides the text
	-- 		vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { fg = c.bg, bg = c.green })
	-- 		vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { fg = c.bg, bg = c.red })
	-- 	end,
	-- },
	-- {
	-- "samharju/serene.nvim",
	-- config = function()
	-- vim.cmd.colorscheme("serene")
	-- end
	-- },
	-- {
	--   "rose-pine/neovim", name = "rose-pine",
	--   config = function()
	--     vim.cmd("colorscheme rose-pine")
	--   end,
	-- },
	{
		"tpope/vim-surround",
	},
	{
		"tpope/vim-commentary",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
				on_attach = require("keymaps").create_gitsigns_keymaps,
			})
		end,
	},
	{
		"sbdchd/neoformat",
	},
	{
		"tpope/vim-fugitive",
		-- opt = true
	},
	{
		"TimUntersberger/neogit",
		opt = true,
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("neogit").setup()
			require("keymaps").create_neogit_keymaps()
		end,
	},
	{
		"folke/which-key.nvim",
		opt = true,
		config = function()
			require("which-key").setup()
		end,
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		opt = true,
		-- load on specific filetypes
		ft = { "html", "css", "javascript", "javascriptreact", "typescriptreact" },
	},
	"lukas-reineke/indent-blankline.nvim",
	-- {
	-- 	"ggandor/leap.nvim",
	-- 	dependencies = "tpope/vim-repeat",
	-- 	opts = {
	-- 		safe_labels = { "s", "f", "n", "u", "t", "/", "F", "L", "N", "H", "G", "M", "U", "T", "?", "Z" },
	-- 	},
	-- 	config = function()
	-- 		require("leap").add_default_mappings()
	-- 	end,
	-- },
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup()
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = { "rcarriga/nvim-dap-ui", 'mfussenegger/nvim-dap-python', "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
			local dap = require("dap")
      dap.adapters.python = {
        type = 'executable',
        command = vim.fn.getcwd() .. "/venv/bin/python",
        args = { '-m', 'debugpy.adapter' },
      }
			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					pythonPath = function()
						return vim.fn.getcwd() .. "/venv/bin/python"
					end,
				},
			}
		end,
	},
})
