-- Mason setup
local status_ok, _ = pcall(require, "mason")
if not status_ok then
    return
end

-- Mason-lspconfig setup
local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
    return
end

mason_lspconfig.setup {
    ensure_installed = {
        "bashls", -- Bash

        "html", -- HTML
        "cssls", -- CSS
        "cssmodules_ls", 
        "tailwindcss",
        "tsserver", -- Javscript & Typescript
        "sqls", -- SQL

        "pyright", -- Python
        "hls", -- Haskell

        "cmake", -- CMake
        "clangd", -- C & C++
        "asm_lsp", -- Assembly

        "sumneko_lua", -- Lua
        "vimls", -- VimL

        "jsonls", -- JSON
        "yamlls", -- Yaml
        "dockerls", -- Docker
        "texlab", -- LaTeX
    },
    automatic_installation = true,
}
