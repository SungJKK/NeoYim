local lsp_servers = {
        "jsonls", -- JSON
        "yamlls", -- Yaml
        "dockerls", -- Docker

        "texlab", -- LaTeX
        "bashls", -- Bash

        "html", -- HTML
        "cssls", -- CSS
        "tsserver", -- Javscript & Typescript
        "sqls", -- SQL

        "pyright", -- Python
        "hls", -- Haskell

        "cmake", -- CMake
        "clangd", -- C & C++
        "asm_lsp", -- assembly

        "lua_ls", -- Lua
        "vimls", -- VimL
}

-- Setup mason & mason-lspconfig
local status_ok, mason = pcall(require, 'mason')
if not status_ok then return end
mason.setup()

local status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok then return end
mason_lspconfig.setup({
    ensure_installed = lsp_servers,
    automatic_installation = true,
})

-- Setup lspconfig
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then return end

local on_attach = function(client, bufnr)
    -- Keybindings
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap

    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap(bufnr, "n", "gf", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

    keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

    keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    keymap(bufnr, "n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

    -- To check complete server capabilities, open a file, and run below command
    -- :lua =vim.lsp.get_active_clients()[1].server_capabilities

    -- So that formatting doesn't clash with null-ls
    if client.server_capabilities.documentFormattingProvider then
        client.server_capabilities.documentFormattingProvider = false
    end
    if client.server_capabilities.documentRangeFormattingProvider then
        client.server_capabilities.documentRangeFormattingProvider = false
    end

    -- For Navic
    local status_ok, navic = pcall(require, 'nvim-navic')
    if status_ok and client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

-- For cmp-lsp
local capabilities = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    }
    capabilities.offsetEncoding = { 'utf-16' }

    -- Required for cmp
    local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if status_ok then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    return capabilities
end

local opts = {
    on_attach = on_attach,
    capabilities = capabilities(),
}


-- Setup lsp servers with lspconfig
local jsonls_opts = require "lsp.servers.jsonls"
lspconfig['jsonls'].setup(vim.tbl_deep_extend("force", jsonls_opts, opts))

local yamlls_opts = require "lsp.servers.yamlls"
lspconfig['yamlls'].setup(vim.tbl_deep_extend("force", yamlls_opts, opts))

local bashls_opts = require "lsp.servers.bashls"
lspconfig['bashls'].setup(vim.tbl_deep_extend("force", bashls_opts, opts))

local asm_lsp_opts = require "lsp.servers.asm_lsp"
lspconfig['asm_lsp'].setup(vim.tbl_deep_extend("force", asm_lsp_opts, opts))

local ccls_opts = require "lsp.servers.clangd"
lspconfig['ccls'].setup(vim.tbl_deep_extend("force", ccls_opts, opts))

local html_opts = require "lsp.servers.html"
lspconfig['html'].setup(vim.tbl_deep_extend("force", html_opts, opts))

local cssls_opts = require "lsp.servers.cssls"
lspconfig['cssls'].setup(vim.tbl_deep_extend("force", cssls_opts, opts))

local tsserver_opts = require "lsp.servers.tsserver"
lspconfig['tsserver'].setup(vim.tbl_deep_extend("force", tsserver_opts, opts))

local pyright_opts = require "lsp.servers.pyright"
lspconfig['pyright'].setup(vim.tbl_deep_extend("force", pyright_opts, opts))

local hls_opts = require "lsp.servers.hls"
lspconfig['hls'].setup(vim.tbl_deep_extend("force", hls_opts, opts))

local sumneko_opts = require "lsp.servers.lua_ls"
lspconfig['lua_ls'].setup(vim.tbl_deep_extend("force", sumneko_opts, opts))

local texlab_opts = require "lsp.servers.texlab"
lspconfig['texlab'].setup(vim.tbl_deep_extend("force", texlab_opts, opts))


-- Setup UI for LSP
local setup = function()
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local config = {
        virtual_text = true,
        signs = {
            active = signs,
        },
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }
    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
        border = "rounded",
    })
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {
            prefix = "",
            spacing = 5,
            severity_limit = "Warning",
        },
        update_in_insert = false,
    })
end
setup()


-- Setup Linter and Formatter with null-ls.nvim
require "lsp.null-ls"


