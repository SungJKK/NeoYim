local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

-- Formatters for lua, c/c++, hs, py, ts/js
local helpers = require "null-ls.helpers"
local floskell = helpers.make_builtin {
    name = "floskell",
    method = null_ls.methods.FORMATTING,
    filetypes = { "haskell", "lhaskell" },
    generator_opts = {
        command = "floskell",
        args = { "--config", BASE_DIR .. "/utils/formats/floskell.json" },
        to_stdin = true,
    },
    factory = helpers.formatter_factory,
}
null_ls.register(floskell)

null_ls.setup {
    sources = {
        -- lua
        null_ls.builtins.formatting.stylua,

        -- c/c++
        null_ls.builtins.formatting.clang_format.with {
            filetypes = { "c", "cpp", "objc", "objcpp" },
        },

        -- python
        null_ls.builtins.formatting.black.with {
            extra_args = { "--fast" },
        },

        -- typescript & javascript
        null_ls.builtins.formatting.prettier.with {
            extra_args = { "--config", BASE_DIR .. "/utils/formats/prettier.json" },
            filetypes = { "html", "json", "yaml", "markdown" },
        },
    },
}
