require("nvim-treesitter.install").compilers = { "clang" }

require("nvim-treesitter.configs").setup {
    ensure_installed = "all",
    sync_install = false,
    -- Not maintained. Setup later for haskell
    ignore_install = {
        "elm",
        "fortran",
        "hack",
        "markdown",
        "swift",
        "phpdoc", 
        "tree-sitter-phpdoc"
    },
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = { 'markdown' },
    },
    indent = {
        enable = true,
        disable = { "python", "cpp" }
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    autopairs = {
        enable = true,
    },
    autotag = {
        enable = true,
        filetypes = {
            "html",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "svelte",
            "vue",
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
    },
}
