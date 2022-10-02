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
        cmd = "StartupTime",
    }
    use { "lewis6991/impatient.nvim" }
    use {
        "nathom/filetype.nvim",
        config = function()
            require "plugins.filetype"
        end,
    }

    -- Treesitter & Syntax
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require "plugins.treesitter"
        end,
    }
    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
        after = "nvim-treesitter",
        event = "BufReadPost",
    }
    use { "windwp/nvim-ts-autotag", after = "nvim-treesitter" }
    use { "p00f/nvim-ts-rainbow", after = "nvim-treesitter" }
    use { "MTDL9/vim-log-highlighting" }
    use {
        "windwp/nvim-autopairs",
        after = { "nvim-treesitter", "nvim-cmp" },
        config = function()
            require "plugins.autopairs"
        end,
    }
    use { "tpope/vim-surround" }

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
        config = function()
            require "plugins.telescope"
        end,
    }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" }
    use { "rudism/telescope-dict.nvim", after = "telescope.nvim" }

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use { "tamago324/nlsp-settings.nvim" }
    use {
        "folke/lsp-colors.nvim",
        after = "nvim-lspconfig",
    }
    use {
        "folke/trouble.nvim",
        config = function()
            require "plugins.trouble"
        end,
    }
    use {
        "jose-elias-alvarez/null-ls.nvim",
    }
    use {
        "stevearc/aerial.nvim",
        config = function()
            require "plugins.aerial"
        end,
    }

    -- Completions & Snippets
    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require "plugins.cmp"
        end,
        requires = {
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },
    }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-nvim-lua" }
    use { "kdheepak/cmp-latex-symbols" }
    use { "uga-rosa/cmp-dictionary" }
    use { "saadparwaiz1/cmp_luasnip" }
    use {
        "L3MON4D3/LuaSnip",
        wants = "friendly-snippets",
    }
    use { "rafamadriz/friendly-snippets" }

    -- Git
    use {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = function()
            require "plugins.git-signs"
        end,
    }
    use {
        "sindrets/diffview.nvim",
        event = "BufWinEnter",
        config = function()
            require "plugins.git-diffview"
        end,
    }

    -- General
    use {
        "aserowy/tmux.nvim",
        event = "BufWinEnter",
        config = function()
            require "plugins.tmux"
        end,
    }
    use {
        "akinsho/toggleterm.nvim",
        event = "BufWinEnter",
        config = function()
            require "plugins.toggleterm"
        end,
    }
    use {
        "folke/which-key.nvim",
        event = "BufWinEnter",
        config = function()
            require "plugins.which-key"
        end,
    }

    use {
        "numToStr/Comment.nvim",
        config = function()
            require "plugins.comment"
        end,
    }
    use {
        "folke/todo-comments.nvim",
        config = function()
            require "plugins.todo-comments"
        end,
    }
    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require "plugins.colorizer"
        end,
    }

    use {
        "iamcco/markdown-preview.nvim",
        ft = { "markdown" },
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_auto_close = 0
            vim.g.mkdp_browser = "firefox"
            vim.g.mkdp_markdown_css = ""
        end,
    }

    use { "rcarriga/nvim-notify" }
    use {
        "Tastyep/structlog.nvim",
        config = function()
            require "plugins.logger"
        end,
    }

    -- Competitive programming
    use {
        "xeluxee/competitest.nvim",
        requires = "MunifTanjim/nui.nvim",
        config = function()
            require "plugins.competitest"
        end,
    }

    -- Themes & UI
    use { "shaunsingh/moonlight.nvim" }
    use { "marko-cerovac/material.nvim" }
    use { "Mofiqul/vscode.nvim" }
    use { "folke/tokyonight.nvim" }
    use { "LunarVim/horizon.nvim" }

    use { "kyazdani42/nvim-web-devicons" }
    use {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
        config = function()
            require "theme.nvim-tree"
        end,
    }
    use {
        "romgrk/barbar.nvim",
        event = "BufWinEnter",
        config = function()
            require "theme.barbar"
        end,
    }
    use {
        "nvim-lualine/lualine.nvim",
        event = "BufWinEnter",
        config = function()
            require "theme.lualine"
        end,
    }
    use {
        "glepnir/dashboard-nvim",
        event = "BufWinEnter",
        config = function()
            require "theme.dashboard"
        end,
    }
end)
