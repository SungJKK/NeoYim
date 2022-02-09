local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end

local formatting = null_ls.builtins.formatting

-- Format for c/c++, hs, py, ts/js
null_ls.setup {
    sources = {
        -- lua
        formatting.stylua,

        -- c/c++
        formatting.clang_format,

        -- haskell
        -- formatting.floskell,

        -- python
        formatting.black.with({ extra_args = { "--fast" }}),

        -- typescript & javascript
        formatting.prettier
    },
}

