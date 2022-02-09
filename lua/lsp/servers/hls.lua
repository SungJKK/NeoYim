
-- TODO: check regularly if stylish-haskell is compatible with ghc 9.2.1
-- ghcup set ghc 9.2.0
-- stack config set resolver ghc-9.2.0

return {
    cmd = { "haskell-language-server-wrapper", "--lsp" },
    filetypes = { "haskell", "lhaskell" },
    root_dir = require('lspconfig/util').root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml"),
    settings = {
        haskell = {
            formattingProvider = "floskell",
            checkProject = false,
        }
    },
    single_file_support = true,
}

