local lsp = require("feline.providers.lsp")
local colors = require("core.colors").colors
local helpers = require("core.helpers")

-- colors for different vim modes
local mode_color = {
	n = colors.green,
	i = colors.yellow,
	v = colors.lightblue,
	[""] = colors.lightblue,
	[""] = colors.white,
	V = colors.lightblue,
	c = colors.orange,
	no = colors.magenta,
	s = colors.orange,
	S = colors.orange,
	-- [""] = colors.orange,
	ic = colors.yellow,
	R = colors.purple,
	Rv = colors.purple,
	cv = colors.orange,
	ce = colors.orange,
	r = colors.cyan,
	rm = colors.cyan,
	["r?"] = colors.cyan,
	["!"] = colors.cyan,
	t = colors.cyan,
}

local modes = {
	["__"] = "------",
	["c"] = "COMMAND",
	["i"] = "INSERT",
	["ic"] = "INSERT COMPL",
	["ix"] = "INSERT COMPL",
	["multi"] = "MULTI",
	["n"] = "NORMAL",
	["ni"] = "(INSERT)",
	["no"] = "OP PENDING",
	["R"] = "REPLACE",
	["Rv"] = "V REPLACE",
	["s"] = "SELECT",
	["S"] = "S-LINE",
	[""] = "S-BLOCK",
	["t"] = "TERMINAL",
	["v"] = "VISUAL",
	["V"] = "V-LINE",
	[""] = "V-BLOCK",
}

local properties = {
	force_inactive = {
		filetypes = {},
		buftypes = {},
		bufnames = {},
	},
}

properties.force_inactive.filetypes = {
	"NvimTree",
	"dbui",
	"packer",
	"startify",
	"fugitive",
	"fugitiveblame",
}

properties.force_inactive.buftypes = {
	"terminal",
}

local components = {
	active = {},
	inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

table.insert(components.active[1], {
	provider = " ",
	hl = {
		fg = colors["bg"],
		bg = colors["bg"],
	},
})

table.insert(components.active[1], {
	provider = function()
		return modes[vim.fn.mode()]
	end,
	hl = function()
		local val = {}
		val.fg = mode_color[vim.fn.mode()]
		val.bg = colors["bg"]
		val.style = "bold"

		return val
	end,
	right_sep = {
		str = "  " .. "" .. "  ",
		hl = function()
			local val = {}
			val.fg = mode_color[vim.fn.mode()]
			val.bg = colors["bg"]
			val.style = "bold"

			return val
		end,
	},
})

table.insert(components.active[1], {
	provider = {
		name = "file_info",
		opts = {
			type = "base-only",
			file_modified_icon = "M",
		},
	},
	hl = {
		-- name = colors['yellow'],
		fg = colors["yellow"],
		bg = colors["bg"],
		style = "bold",
	},
	right_sep = {
		str = "  " .. "" .. "  ",
		hl = {
			fg = colors["yellow"],
			bg = colors["bg"],
		},
	},
	icon = "",
})

table.insert(components.active[1], {
	name = "diagnostic_errors",
	provider = function()
		local next_loc = nil
		local errors = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })

		if #errors > 0 then
			local curr_line = vim.api.nvim_win_get_cursor(0)[1]
			next_loc = helpers.upper_bound(errors, curr_line)

			if not next_loc then
				next_loc = errors[1]["lnum"]
			end

			vim.keymap.set(
				"n",
				"<leader>ne",
				":" .. tostring(next_loc + 1) .. "<CR>",
				{ silent = true, noremap = true, buffer = true }
			)

			return tostring(#errors) .. " (" .. tostring(next_loc + 1) .. ")"
		end
		return tostring(#errors)
	end,
	icon = "",
	hl = {
		fg = colors["red"],
		bg = colors["bg"],
	},
	right_sep = {
		str = "" .. "," .. " ",
		hl = {
			fg = colors["gray"],
			bg = colors["bg"],
		},
	},
})

table.insert(components.active[1], {
	name = "diagnostic_warnings",
	provider = function()
		local next_loc = nil
		local warnings = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

		if #warnings > 0 then
			local curr_line = vim.api.nvim_win_get_cursor(0)[1]
			next_loc = helpers.upper_bound(warnings, curr_line)

			if not next_loc then
				next_loc = warnings[1]["lnum"]
			end

			vim.keymap.set(
				"n",
				"<leader>nw",
				":" .. tostring(next_loc + 1) .. "<CR>",
				{ silent = true, noremap = true, buffer = true }
			)

			return tostring(#warnings) .. " (" .. tostring(next_loc + 1) .. ")"
		end
		return tostring(#warnings)
	end,
	icon = "",
	hl = {
		fg = colors["yellow"],
		bg = colors["bg"],
	},
	right_sep = {
		str = "" .. "," .. " ",
		hl = {
			fg = colors["gray"],
			bg = colors["bg"],
		},
	},
})

table.insert(components.active[1], {
	name = "diagnostic_hint",
	provider = function()
		local next_loc = nil
		local hints = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

		if #hints > 0 then
			local curr_line = vim.api.nvim_win_get_cursor(0)[1]
			next_loc = helpers.upper_bound(hints, curr_line)

			if not next_loc then
				next_loc = hints[1]["lnum"]
			end

			vim.keymap.set(
				"n",
				"<leader>nh",
				":" .. tostring(next_loc + 1) .. "<CR>",
				{ silent = true, noremap = true, buffer = true }
			)

			return tostring(#hints) .. " (" .. tostring(next_loc + 1) .. ")"
		end
		return tostring(#hints)
	end,
	icon = "",
	hl = {
		fg = colors["cyan"],
		bg = colors["bg"],
	},
	right_sep = {
		str = "" .. "" .. "",
		hl = {
			fg = colors["gray"],
			bg = colors["bg"],
		},
	},
})

table.insert(components.active[3], {
	-- Component info here
	provider = "git_branch",
	icon = " ",
	hl = {
		fg = colors["green"],
		bg = colors["bg"],
		style = "bold",
	},
	left_sep = {
		str = "",
		hl = {
			fg = colors["green"],
			bg = colors["bg"],
		},
	},
})

table.insert(components.active[3], {
	provider = {
		name = "position",
		opts = {
			format = "↓ {line}, → {col}",
		},
	},
	hl = {
		fg = colors["lightgreen"],
		bg = colors["bg"],
	},
	left_sep = {
		str = "  " .. "" .. "  ",
		hl = {
			fg = colors["lightgreen"],
			bg = colors["bg"],
		},
	},
})

table.insert(components.active[3], {
	provider = "file_type",
	hl = {
		fg = colors["lightblue"],
		bg = colors["bg"],
		-- style = 'bold'
	},
	left_sep = {
		str = "  " .. "" .. "  ",
		hl = {
			fg = colors["lightblue"],
			bg = colors["bg"],
		},
	},
})

table.insert(components.active[3], {
	provider = " ",
	hl = {
		fg = colors["bg"],
		bg = colors["bg"],
	},
})

require("feline").setup({
	colors = colors,
	vi_mode_colors = mode_color,
	components = components,
	properties = properties,
})
