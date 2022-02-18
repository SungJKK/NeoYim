local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print "Packer is not installed!"
    return
end

packer.startup(function(use)
    -- Packer can manage itself as an optional plugin
    use { "wbthomason/packer.nvim" }

    -- Need this until https://github.com/neovim/neovim/issues/12587 is open
    use { "antoinemadec/FixCursorHold.nvim" }

    -- Startup optimization
    use {
        "tweekmonster/startuptime.vim",
        disable = false,
        -- cmd = "StartupTime"
    }
    use { "lewis6991/impatient.nvim" }
    use { "nathom/filetype.nvim" }

    -- LSP
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/nvim-lsp-installer" }
    use { "tamago324/nlsp-settings.nvim" }
    use {
        "folke/lsp-colors.nvim",
        after = "nvim-lspconfig",
    }
    use { "folke/trouble.nvim" }
    use { "jose-elias-alvarez/null-ls.nvim", disable = false }

    -- Snippets & Completions
    use {
        "rafamadriz/friendly-snippets",
        -- event = "InsertAfter"
    }
    use {
        "hrsh7th/nvim-cmp",
        -- after = 'friendly-snippets'
    }
    use {
        "L3MON4D3/LuaSnip",
        wants = "friendly-snippets",
        -- after = 'nvim-cmp'
    }
    use {
        "saadparwaiz1/cmp_luasnip",
        -- after = { 'nvim-cmp', 'LuaSnip' }
    }
    use {
        "hrsh7th/cmp-nvim-lsp",
    }
    use {
        "hrsh7th/cmp-buffer",
    }
    use {
        "hrsh7th/cmp-path",
    }
    use {
        "hrsh7th/cmp-nvim-lua",
    }
    use {
        "kdheepak/cmp-latex-symbols",
    }
    use { "uga-rosa/cmp-dictionary" }

    -- Telescope
    use { "nvim-lua/plenary.nvim" }
    use { "nvim-lua/popup.nvim" }
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
        },
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    }
    use {
        "nvim-telescope/telescope-symbols.nvim",
    }
    use { "rudism/telescope-dict.nvim" }

    -- Treesitter & Syntax
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
    }
    use { "windwp/nvim-ts-autotag" }
    use {
        "p00f/nvim-ts-rainbow",
    }
    use {
        "MTDL9/vim-log-highlighting",
    }

    -- Git
    use { "lewis6991/gitsigns.nvim" }
    use { "sindrets/diffview.nvim" }

    -- Coding
    use { "stevearc/aerial.nvim" }
    use {
        "windwp/nvim-autopairs",
    }
    use { "numToStr/Comment.nvim" }
    use { "folke/todo-comments.nvim" }
    use { "norcalli/nvim-colorizer.lua" }
    use { "akinsho/toggleterm.nvim" }

    -- Utils
    use { "aserowy/tmux.nvim" }
    use { "tpope/vim-surround" }
    use { "dhruvasagar/vim-table-mode" }
    use {
        "iamcco/markdown-preview.nvim",
        ft = { "markdown" },
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { 'markdown' }
            vim.g.mkdp_auto_close = 0
            vim.g.mkdp_browser = 'firefox'

            vim.g.mkdp_markdown_css = ''
        end,
    }

    -- Themes
    use { "shaunsingh/moonlight.nvim" }
    use { "marko-cerovac/material.nvim" }

    -- UI
    use { "kyazdani42/nvim-tree.lua" }
    use { "kyazdani42/nvim-web-devicons" }
    use { "romgrk/barbar.nvim" }
    use { "nvim-lualine/lualine.nvim" }
    use { "glepnir/dashboard-nvim" }
    use { "folke/which-key.nvim" }
    use { "rcarriga/nvim-notify" }
end)
