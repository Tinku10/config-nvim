local cmd = vim.api.nvim_command
local fn = vim.fn
-- local gl = require('galaxyline')
local section = require('galaxyline').section

require('galaxyline').short_line_list = {"NerdTree", "packager", "Floaterm", "coc-eplorer", "NvimTree", "packer", "Goyo", "Undotree", "dashboard", "LspTrouble"}

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

local modes = {
   ['__'] = '------',
   ['c']  = 'COMMAND',
   ['i']  = 'INSERT',
   ['ic'] = 'INSERT COMPL',
   ['ix'] = 'INSERT COMPL',
   ['multi'] = 'MULTI',
   ['n']  = 'NORMAL',
   ['ni'] = '(INSERT)',
   ['no'] = 'OP PENDING',
   ['R']  = 'REPLACE',
   ['Rv'] = 'V REPLACE',
   ['s']  = 'SELECT',
   ['S']  = 'S-LINE',
   [''] = 'S-BLOCK',
   ['t']  = 'TERMINAL',
   ['v']  = 'VISUAL',
   ['V']  = 'V-LINE',
   [''] = 'V-BLOCK',
}

local buffer_not_empty = function()
  if fn.empty(fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

local checkwidth = function()
  local squeeze_width = fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

local whichmode = function()
  local mode = fn.mode()
  return modes[mode];
end

local get_diagnostics = function(type)
  if next(vim.lsp.buf_get_clients(0)) == nil then return 0 end
  local clients = vim.lsp.get_active_clients()

  local count = 0

  if clients then
    for _, client in ipairs(clients) do
      count = count + vim.lsp.diagnostic.get_count(vim.api.nvim_get_current_buf(), type, client.id)
    end
  end

  return count
end

local diagnostics_exist = function(type)
  return get_diagnostics(type) > 0
end

section.left[1] = {
  Space = {
    provider = function() return " " end,
    -- provider = " ",
    highlight = {colors.line_bg, colors.line_bg},
    separator_highlight = {colors.purple, colors.bg},
  }
}

section.left[2] = {
  ViMode = {
    provider = function()
      cmd("hi GalaxyViMode guifg=" .. mode_color[fn.mode()])
      --   ҟαĺ           
      return '[ ' .. whichmode() .. ' ]'
    end,
    separator = "  ",
    separator_highlight = {colors.purple, colors.bg},
    highlight = {colors.red, colors.line_bg, "bold"}
  }
}

section.left[3] = {
  FileName = {
    -- provider = "FileName",
    provider = function()
      return fn.expand("%:f")
    end,
    separator = "  ",
    condition = buffer_not_empty,
    separator_highlight = {colors.purple, colors.bg},
    highlight = {colors.yellow, colors.line_bg, "bold"}
  }
}

section.right[1] = {
  FileType = {
    provider = function()
      return '[ ' ..  require('galaxyline.provider_buffer').get_buffer_filetype() .. ' ]'
    end,
    -- condition = require("galaxyline.condition").check_git_workspace,
    separator = "  ",
    separator_highlight = {colors['yellow'], colors.bg},
    highlight = {colors.blue, colors.line_bg}
  }
}

section.right[2] = {
  GitIcon = {
    condition = require("galaxyline.condition").check_git_workspace,
    provider = function()
      -- return "  "
      return ""
    end,
    separator = "  ",
    separator_highlight = {colors['yellow'], colors.bg},
    highlight = {colors.green, colors.line_bg}
  }
}

section.right[3] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = require("galaxyline.condition").check_git_workspace,
    separator = " ",
    separator_highlight = {colors['yellow'], colors.bg},
    highlight = {colors.green, colors.line_bg, "bold"}
  }
}

section.right[4] = {
  FileFormat = {
    provider = "FileFormat",
    condition = checkwidth,
    separator = "  ",
    separator_highlight = {colors['yellow'], colors.bg},
    highlight = {colors.blue, colors.line_bg}
  }
}

section.right[5] = {
  FileEncode = {
    provider = function()
      local encode = vim.bo.fenc ~= '' and vim.bo.fenc or vim.o.enc
      return encode:upper()
    end,
    -- provider = "FileEncode",
    condition = checkwidth,
    -- extra space present in the provider name
    separator = "  ",
    separator_highlight = {colors.yellow, colors.line_bg},
    highlight = {colors.blue, colors.line_bg}
  }
}

section.right[6] = {
  DiffAdd = {
    -- provider = "DiffAdd",
    provider = function()
      local add = vim.fn['sy#repo#get_stats']()[1]
      return add
    end,
    condition = require("galaxyline.condition").check_git_workspace,
    separator = "  ",
    icon = " ",
    separator_highlight = {colors.blue, colors.line_bg},
    highlight = {colors.green, colors.line_bg}
  }
}

section.right[7] = {
  DiffModified = {
    -- provider = "DiffModified",
    provider = function()
      local mod = vim.fn['sy#repo#get_stats']()[2]
      return mod
    end,
    condition = require("galaxyline.condition").check_git_workspace,
    separator = "  ",
    icon = "柳",
    highlight = {colors.yellow, colors.line_bg},
    separator_highlight = {colors.yellow, colors.bg}
  }
}

section.right[8] = {
  DiffRemove = {
    -- provider = "DiffRemove",
    provider = function()
      local rem = vim.fn['sy#repo#get_stats']()[3]
      return rem
    end,
    condition = require("galaxyline.condition").check_git_workspace,
    separator = "  ",
    icon = " ",
    highlight = {colors.orange, colors.line_bg},
    separator_highlight = {colors.yellow, colors.bg}
  }
}

section.right[10] = {
  DiagnosticError = {
    provider = function()
      local s = require('galaxyline.provider_diagnostic').get_diagnostic_error()
      if s ~= nil then
        s = s:sub(1, -2)
      end
      return s
    end,
    -- provider = function()
    --   return get_diagnostics('Error')
    -- end,
    -- condition = diagnostics_exist('Error'),
    icon = "    ",
    -- separator = "  ",
    highlight = {colors.orange, colors.line_bg},
    separator_highlight = {colors.bg, colors.bg}
  }
}

section.right[11] = {
  DiagnosticWarn = {
    -- provider = "DiagnosticWarn",
    provider = function()
      local s = require('galaxyline.provider_diagnostic').get_diagnostic_warn()
      if s ~= nil then
        s = s:sub(1, -2)
      end
      return s
    end,
    -- condition = get_diagnostics('Warning') and get_diagnostics('Warning') > 0 ,
    -- separator = "  ",
    icon = "    ",
    highlight = {colors.yellow, colors.line_bg},
    separator_highlight = {colors.bg, colors.bg}
  }
}

section.right[12] = {
  DiagnosticHint = {
    -- provider = "DiagnosticHint",
    provider = function()
      local s = require('galaxyline.provider_diagnostic').get_diagnostic_hint()
      if s ~= nil then
        s = s:sub(1, -2)
      end
      return s
    end,
    -- condition = get_diagnostics('Hint') and get_diagnostics('Hint') > 0 ,
    -- icon = " ",
    icon = "    ",
    -- separator = "  ",
    separator_highlight = {colors.yellow, colors.bg},
    highlight = {colors.blue, colors.line_bg},
  }
}

section.right[13] = {
  DiagnosticInfo = {
    -- provider = "DiagnosticInfo",
    provider = function()
      local s = require('galaxyline.provider_diagnostic').get_diagnostic_info()
      if s ~= nil then
        s = s:sub(1, -2)
      end
      return s
    end,
    -- condition = get_diagnostics('Information') and get_diagnostics('Information') > 0 ,
    -- separator = "  ",
    -- icon = " ",
    icon = "    ",
    highlight = {colors.green, colors.line_bg},
    separator_highlight = {colors.bg, colors.bg}
  }
}

section.right[14] = {
  LineInfo = {
    -- provider = "LineColumn",
    provider = function()
      local cursor = vim.api.nvim_win_get_cursor(0)
      return '[ ' .. cursor[1] .. ' : ' .. cursor[2] .. ' ]'
    end,
    -- condition = checkwidth,
    separator = "  ",
    separator_highlight = {colors.blue, colors.line_bg},
    highlight = {colors.green, colors.line_bg}
  }
}

section.right[15] = {
  Space = {
    provider = function() return " " end,
    -- provider = " ",
    highlight = {colors.line_bg, colors.line_bg},
    separator_highlight = {colors.purple, colors.bg},
  }
}

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
