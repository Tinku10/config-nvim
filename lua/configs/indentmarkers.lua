require("indent_blankline").setup {
    -- char = "|",
    buftype_exclude = {"terminal"},
    filetype_exclude = {"dashboard", "packer.nvim"},
    filetype = {"cpp", "html", "jsx", "js", "css"},
    space_char_blankline = " ",
    show_current_context = true,
}

