-- Check for lspconfig
local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("lsp.handlers"):setup()
local opts = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities(),
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

require "lsp.mason"
require "lsp.null-ls"
