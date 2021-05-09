require'lspconfig'.groovyls.setup{
    -- Unix
    cmd = { "java", "-jar", "~/Downloads/groovy-language-server/build/libs/groovy-language-server-all.jar" },
    on_attach=require('lsp/common').on_attach,
    filetypes = {"groovy"},
    -- root_dir = root_pattern(".git") or vim.loop.os_homedir()
}
