require("indent_blankline").setup {
  -- char = "|",
  buftype_exclude = {"terminal", "nofile"},
  context_patterns = {
    "declaration", "expression", "pattern", "primary_expression",
    "statement", "switch_body"
  },
  filetype_exclude = {"dashboard", "packer", "help"},
  -- filetype_include = {"cpp", "html", "jsx", "js", "css", "lua"},
  space_char_blankline = " ",
  show_current_context = true,
}

