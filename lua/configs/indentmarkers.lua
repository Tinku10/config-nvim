require("indent_blankline").setup {
  -- char = "|",
  buftype_exclude = {"terminal", "nofile"},
  -- filetype_exclude = {"dashboard", "packer", "help"},
  filetype = {"cpp", "html", "jsx", "js", "css", "lua"},
  context_patterns = {
    "declaration", "expression", "pattern", "primary_expression",
    "statement", "switch_body"
  },
  space_char_blankline = " ",
  show_current_context = true,
}

