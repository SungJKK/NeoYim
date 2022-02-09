return {
    cmd = { 'pyright-langserver', '--stdio' },
    settings = {
        python = {
            analysis = {
                typeCheckingMode = false,
                autoSearchPaths = true,
                useLibraryCodeForTypes = true
            }
        }
    },
    single_file_support = true
}
