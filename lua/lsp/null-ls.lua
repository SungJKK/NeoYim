local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover
local completion = null_ls.builtins.completion

-- Format for lua, c/c++, hs, py, ts/js
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
        formatting.stylua,

        -- c/c++
        formatting.clang_format.with {
            filetypes = { "c", "cpp", "objc", "objcpp" },
        },

        -- python
        formatting.black.with { extra_args = { "--fast" } },

        -- typescript & javascript
        formatting.prettier.with {
            extra_args = { "--config", BASE_DIR .. "/utils/formats/prettier.json" },
        },
    },
}
