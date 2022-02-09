local M = {}

M.setup = function()
    local signs = {
        { name = 'DiagnosticsSignError', text = '' },
        { name = 'DiagnosticsSignWarn', text = '' },
        { name = 'DiagnosticsSignHint', text = '' },
        { name = 'DiagnosticsSignInfo', text = '' }
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
    end

    local config = {
        -- virtual_text = false,
        virtual_text = {
            prefix = "",
            spacing = 5,
        },
        signs = {
            active = signs
        },
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = 'minimal',
            border = 'rounded',
            source = 'always',
            header = '',
            prefix = ''
        }
    }
    vim.diagnostic.config(config)

    -- Shift + k
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = 'rounded'
    })

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
        border = 'rounded'
    })

    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = false,
    })
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
        [[
        augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup end
        ]], false)
    end
end

local function lsp_keymaps(bufnr)
    -- Keybindings
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true }
    local keymap = vim.api.nvim_buf_set_keymap
    keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

    keymap(bufnr, 'n', '<S-f>', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    keymap(bufnr, 'n', '<S-k>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    keymap(bufnr, 'n', '<S-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    keymap(bufnr, 'n', '<S-t>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

M.on_attach = function(client, bufnr)
    local aerial_status_ok, aerial = pcall(require, 'aerial')
    if aerial_status_ok then
        aerial.on_attach(client, bufnr)
    end

    if not (client.name == 'hls') then
        -- So that it doesn't clash with null-ls
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end

    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- For cmp-lsp
local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
    return
end
M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M