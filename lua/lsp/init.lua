-- Check for lspconfig
local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
    return
end

require('lsp.lsp-installer')
require('lsp.handlers')
require('lsp.lightbulb')
require('lsp.null-ls')
