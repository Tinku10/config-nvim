local cmd = vim.api.nvim_command
local fn = vim.fn
local gl = require('galaxyline')
local section = gl.section
gl.short_line_list = {"NerdTree", "packager", "Floaterm", "coc-eplorer"}

-- color palette
local colors = {
  bg = "#3c3836",
  fg = "#81A1C1",
  line_bg = "#3c3836",
  lbg = "#3c3836",
  fg_green = "#8FBCBB",
  yellow = "#fabd2f",
  cyan = "#A3BE8C",
  darkblue = "#81A1C1",
  green = "#689d6a",
  orange = "#fe8019",
  purple = "#d3869b",
  magenta = "#BF616A",
  gray = "#616E88",
  blue = "#83a598",
  red = "#cc241d",
  white = "#d5a4c1",
  black = "#282828"
}

-- colors for different vim modes
local mode_color = {
  n = colors.green,
  i = colors.yellow,
  v = colors.white,
  [''] = colors.white,
  [''] = colors.white,
  V = colors.white,
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
  ['r?'] = colors.cyan,
  ['!'] = colors.cyan,
  t = colors.cyan
}

local buffer_not_empty = function()
  if fn.empty(fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

-- section.left[0] = {
--   RainbowRed = {
--     provider = function()
--       cmd("hi GalaxyViMode guifg=" .. mode_color[fn.mode()])
--       return '▊ '
--     end,
--     highlight = {colors.blue,colors.bg}
--   },
-- }

section.left[1] = {
  FirstElement = {
    -- provider = function() return '▊ ' end,
    provider = function()
      return "  "
    end,
    highlight = {colors.blue, colors.line_bg}
  }
}
section.left[2] = {
  ViMode = {
    provider = function()
      cmd("hi GalaxyViMode guifg=" .. mode_color[fn.mode()])
      --   ҟαĺ          
      return "     "
    end,
    highlight = {colors.red, colors.line_bg, "bold"}
  }
}
-- section.left[3] = {
--   FileIcon = {
--     provider = "FileIcon",
--     condition = buffer_not_empty,
--     highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.line_bg}
--   }
-- }
section.left[4] = {
  FileName = {
    -- provider = "FileName",
    provider = function()
      return fn.expand("%:f")
    end,
    condition = buffer_not_empty,
    separator = " ",
    separator_highlight = {colors.purple, colors.bg},
    highlight = {colors.yellow, colors.line_bg, "bold"}
  }
}

section.right[1] = {
  GitIcon = {
    condition = require("galaxyline.condition").check_git_workspace,
    provider = function()
      -- return "  "
      return "  "
    end,
    highlight = {colors.green, colors.line_bg}
  }
}
section.right[2] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    separator = "",
    separator_highlight = {colors.purple, colors.bg},
    highlight = {colors.green, colors.line_bg, "bold"}
  }
}

local checkwidth = function()
  local squeeze_width = fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

section.right[3] = {
  FileFormat = {
    provider = "FileFormat",
    condition = checkwidth,
    separator = "  ",
    separator_highlight = {colors.blue, colors.line_bg},
    highlight = {colors.blue, colors.line_bg}
  }
}

section.right[4] = {
  FileEncode = {
    provider = "FileEncode",
    condition = checkwidth,
    separator = " ",
    separator_highlight = {colors.blue, colors.line_bg},
    highlight = {colors.blue, colors.line_bg}
  }
}
section.right[7] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    separator = "  ",
    icon = " ",
    separator_highlight = {colors.blue, colors.line_bg},
    highlight = {colors.green, colors.line_bg}
  }
}

section.right[8] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = "柳",
    highlight = {colors.yellow, colors.line_bg}
  }
}

section.right[9] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = " ",
    highlight = {colors.orange, colors.line_bg}
  }
}

section.right[10] = {
  LineInfo = {
    provider = "LineColumn",
    condition = checkwidth,
    separator = " ",
    separator_highlight = {colors.blue, colors.line_bg},
    highlight = {colors.green, colors.line_bg}
  }
}
-- section.right[19] = {
--   PerCent = {
--     provider = 'LinePercent',
--     separator = ' ',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.fg,colors.bg,'bold'},
--   }
-- }

-- section.right[16] = {
--     ShowLspClient = {
--         provider = 'GetLspClient',
--         condition = function()
--             local tbl = {['dashboard'] = true, [' '] = true}
--             if tbl[vim.bo.filetype] then return false end
--             return true
--         end,
--         icon = ' ',
--         highlight = {colors.grey, colors.bg}
--     }
-- }


-- section.right[7] = {
--   FileSize = {
--    provider = "FileSize",
--     separator = " ",
--     condition = buffer_not_empty,
--     separator_highlight = {colors.blue, colors.line_bg},
--     highlight = {colors.fg, colors.line_bg}
--   }
-- }

section.right[11] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    separator = " ",
    icon = " ",
    highlight = {colors.orange, colors.line_bg},
    separator_highlight = {colors.bg, colors.bg}
  }
}
section.right[12] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    separator = " ",
    icon = " ",
    highlight = {colors.yellow, colors.line_bg},
    separator_highlight = {colors.bg, colors.bg}
  }
}

section.right[13] = {
  DiagnosticInfo = {
    -- separator = " ",
    provider = "DiagnosticInfo",
    -- icon = " ",
    icon = "ﯧ ",
    highlight = {colors.green, colors.line_bg},
    separator_highlight = {colors.bg, colors.bg}
  }
}

section.right[14] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    separator = " ",
    icon = " ",
    highlight = {colors.blue, colors.line_bg},
    separator_highlight = {colors.bg, colors.bg}
  }
}

-- section.short_line_left[1] = {
--   BufferType = {
--     provider = "FileIcon",
--     separator = " ",
--     separator_highlight = {"NONE", colors.lbg},
--     highlight = {colors.blue, colors.lbg, "bold"}
--   }
-- }

-- section.short_line_left[2] = {
--   SFileName = {
--     provider = function()
--       local fileinfo = require("galaxyline.provider_fileinfo")
--       local fname = fileinfo.get_current_file_name()
--       for _, v in ipairs(gl.short_line_list) do
--         if v == vim.bo.filetype then
--           return ""
--         end
--       end
--       return fname
--     end,
--     condition = buffer_not_empty,
--     seperator = "  ",
--     highlight = {colors.white, colors.lbg, "bold"}
--   }
-- }

section.short_line_left[1] = {
  Space = {
    provider = function()
      return ' '
    end,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.orange, colors.bg}
  }
}

section.short_line_left[2] = {
  SFileName = {
    provider = 'SFileName',
    condition = require('galaxyline.condition').buffer_not_empty,
    highlight = {colors.grey, colors.bg}
  }
}
section.short_line_right[1] = {
  BufferIcon = {
    provider = "BufferIcon",
    highlight = {colors.fg, colors.lbg}
  }
}
