local colors = require("core.colors").colors

local hi_fg = function (group, col)
   vim.cmd("hi " .. group .. " guifg=" .. col)
end

local hi_bg = function (group, col)
   vim.cmd("hi " .. group .. " guibg=" .. col)
end

local hi_fg_bg = function (group, fgcol, bgcol)
   vim.cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

-- hi_fg("NvimTreeEmptyFolderName", colors.bg)
-- hi_fg("NvimTreeEndOfBuffer", colors.bg)
-- hi_fg("NvimTreeFolderIcon", colors.lightblue)
-- hi_fg("NvimTreeFolderName", colors)
-- hi_fg("NvimTreeGitDirty", colors.red)
-- hi_fg("NvimTreeIndentMarker", colors.lightblue)
-- hi_bg("NvimTreeNormal", colors.bg)
-- hi_bg("NvimTreeNormalNC", colors.bg)
-- hi_fg("NvimTreeOpenedFolderName", colors.bg)
-- hi_fg("NvimTreeRootFolder", colors.yellow .. " gui=underline") -- enable underline for root folder in nvim tree
-- hi_fg_bg("NvimTreeStatuslineNc", colors.bg, colors.bg)
-- hi_fg_bg("NvimTreeStatusline", colors.bg, colors.bg)
-- hi_fg("NvimTreeVertSplit", darker_black)
-- hi_bg("NvimTreeVertSplit", darker_black)
-- hi_fg_bg("NvimTreeWindowPicker", red, black2)

-- hi_fg_bg("TelescopeResultsBorder", colors.bg, colors.bg)
-- hi_fg_bg("TelescopePreviewBorder", colors.bg, colors.bg)
-- hi_fg_bg("TelescopePromptBorder", colors.fg, colors.fg)
-- hi_fg_bg("TelescopePromptNormal", colors.lightgreen, colors.fg)
-- hi_fg_bg("TelescopePromptPrefix", colors.lightgreen, colors.fg)
-- hi_bg("TelescopeNormal", colors.bg)
-- hi_fg_bg("TelescopeResultsTitle", colors.bg, colors.bg)
-- hi_fg_bg("TelescopePreviewTitle", colors.bg, colors.bg)
-- hi_fg_bg("TelescopePromptTitle", colors.fg, colors.fg)
-- hi_bg("TelescopeSelection", colors.fg)
-- hi_fg("TelescopeBorder", colors.bg)
