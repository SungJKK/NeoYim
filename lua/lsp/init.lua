-- Install LSP servers automatically with Mason
require "lsp.mason"

-- LSP config
local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
    return
end

local function lsp_keymaps(bufnr)
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
end
local function lsp_formatting(client)
    -- So that it doesn't clash with null-ls
    if client.server_capabilities.document_formatting then
        client.server_capabilities.document_formatting = false
    end
    if client.server_capabilities.document_range_formatting then
        client.server_capabilities.document_range_formatting = false
    end
end
local function lsp_highlight_document(client)
    -- Set autocommands conditional on server capabilities
    if client.server_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
        augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup end
        ]],
            false
        )
    end
end


-- For Aerial & Navic
local on_attach = function(client, bufnr)
    local status_ok, navic = pcall(require, 'nvim-navic')
    if status_ok and client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end

    local status_ok, aerial = pcall(require, "aerial")
    if status_ok then
        aerial.on_attach(client, bufnr)
    end

    lsp_keymaps(bufnr)
    lsp_formatting(client)
    -- lsp_highlight_document(client)
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
local jsonls_opts = require "lsp.servers.jsonls"
lsp['jsonls'].setup(vim.tbl_deep_extend("force", jsonls_opts, opts))

local yamlls_opts = require "lsp.servers.yamlls"
lsp['yamlls'].setup(vim.tbl_deep_extend("force", yamlls_opts, opts))

local bashls_opts = require "lsp.servers.bashls"
lsp['bashls'].setup(vim.tbl_deep_extend("force", bashls_opts, opts))

local asm_lsp_opts = require "lsp.servers.asm_lsp"
lsp['asm_lsp'].setup(vim.tbl_deep_extend("force", asm_lsp_opts, opts))

local ccls_opts = require "lsp.servers.clangd"
lsp['ccls'].setup(vim.tbl_deep_extend("force", ccls_opts, opts))

local html_opts = require "lsp.servers.html"
lsp['html'].setup(vim.tbl_deep_extend("force", html_opts, opts))

local cssls_opts = require "lsp.servers.cssls"
lsp['cssls'].setup(vim.tbl_deep_extend("force", cssls_opts, opts))

local tsserver_opts = require "lsp.servers.tsserver"
lsp['tsserver'].setup(vim.tbl_deep_extend("force", tsserver_opts, opts))

local pyright_opts = require "lsp.servers.pyright"
lsp['pyright'].setup(vim.tbl_deep_extend("force", pyright_opts, opts))

local hls_opts = require "lsp.servers.hls"
lsp['hls'].setup(vim.tbl_deep_extend("force", hls_opts, opts))

local sumneko_opts = require "lsp.servers.sumneko_lua"
lsp['sumneko_lua'].setup(vim.tbl_deep_extend("force", sumneko_opts, opts))

local texlab_opts = require "lsp.servers.texlab"
lsp['texlab'].setup(vim.tbl_deep_extend("force", texlab_opts, opts))


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


require "lsp.null-ls"
