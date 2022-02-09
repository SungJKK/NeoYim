require'nvim-treesitter.install'.compilers = { "clang" }

require'nvim-treesitter.configs'.setup {
    ensure_installed = 'maintained',
    sync_install = false,
    -- Not maintained. Setup later for haskell
    ignore_install = {
        'elm',
        'fortran',
        'hack',
        'markdown',
        'swift'
    },
    highlight = {
        enable = true,
        disable = { '' },
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
        disable = {
            'yaml'
        }
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false
    },
    autopairs = {
        enable = true
    },
    autotag = {
        enable = true,
        filetypes = {
            'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue'
        }
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
    }
}

--[[
    context_commentstring = {
        enable = true,
        javascript = {
            __default = '// %s',
            jsx_element = '{/* %s */}',
            jsx_fragment = '{/* %s */}',
            jsx_attribute = '// %s',
            comment = '// %s'
        }
    }
--]]
