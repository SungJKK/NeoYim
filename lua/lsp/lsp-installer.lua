local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

-- LSP servers setup
local lsp_installer_servers = require "nvim-lsp-installer.servers"
local lsp_servers = {
    "jsonls", -- JSON
    "yamlls", -- Yaml
    "dockerls", -- Docker
    "cmake", -- CMake
    "asm_lsp", -- Assembly

    "bashls", -- Bash
    "html", -- HTML
    "cssls", -- CSS
    "tsserver", -- Javscript & Typescript
    "pyright", -- Python
    "hls", -- Haskell
    "clangd", -- C & C++
    "sumneko_lua", -- Lua
    "vimls",         -- VimL

    "texlab",   -- LaTeX
}

-- Automatically install servers if not yet installed & Setup servers
for _, server_name in pairs(lsp_servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    if server_available then
        if not server:is_installed() then
            -- Queue the server to be installed.
            server:install()
        end
    else
        vim.notify("Failed to install LSP server " .. server_name)
    end
end

-- LSP Installer UI setup
lsp_installer.settings {
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗",
        },
        -- Keybindings
        keymaps = {
            toggle_server_expand = "<CR>",
            install_server = "i",
            update_server = "u",
            uninstall_server = "x",
            update_all_servers = "U",
        },
    },
}

-- Register handler for all servers
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("lsp.handlers").on_attach,
        capabilities = require("lsp.handlers").capabilities,
    }

    if server.name == "jsonls" then
        local jsonls_opts = require "lsp.servers.jsonls"
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server.name == "yamlls" then
        local yamlls_opts = require "lsp.servers.yamlls"
        opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
    end

    if server.name == "bashls" then
        local bashls_opts = require "lsp.servers.bashls"
        opts = vim.tbl_deep_extend("force", bashls_opts, opts)
    end

    if server.name == "asm_lsp" then
        local asm_lsp_opts = require "lsp.servers.asm_lsp"
        opts = vim.tbl_deep_extend("force", asm_lsp_opts, opts)
    end

    if server.name == "clangd" then
        local ccls_opts = require "lsp.servers.clangd"
        opts = vim.tbl_deep_extend("force", ccls_opts, opts)
    end

    if server.name == "html" then
        local html_opts = require "lsp.servers.html"
        opts = vim.tbl_deep_extend("force", html_opts, opts)
    end

    if server.name == "cssls" then
        local cssls = require "lsp.servers.cssls"
        opts = vim.tbl_deep_extend("force", cssls, opts)
    end

    if server.name == "tsserver" then
        local tsserver_opts = require "lsp.servers.tsserver"
        opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
    end

    if server.name == "pyright" then
        local pyright_opts = require "lsp.servers.pyright"
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server.name == "hls" then
        local hls_opts = require "lsp.servers.hls"
        opts = vim.tbl_deep_extend("force", hls_opts, opts)
    end

    if server.name == "sumneko_lua" then
        local sumneko_opts = require "lsp.servers.sumneko_lua"
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    server:setup(opts)
end)
