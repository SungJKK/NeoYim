local M = {
    -- Startup
    {
        "nathom/filetype.nvim",
        config = function()
            require "plugins.filetype"
        end,
    },

    -- Treesitter & Syntax
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require "plugins.treesitter"
        end,
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        event = "BufReadPost",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    { "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter/nvim-treesitter" },
    {
        "p00f/nvim-ts-rainbow",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    {
        "windwp/nvim-autopairs",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require "plugins.autopairs"
        end,
    },
    { "MTDL9/vim-log-highlighting" },
    { "tpope/vim-surround" },

    -- Telescope
    { "nvim-lua/plenary.nvim" },
    { "nvim-lua/popup.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
        },
        config = function()
            require "plugins.telescope"
        end,
    },
    { "nvim-telescope/telescope-symbols.nvim", dependencies = "nvim-telescope/telescope.nvim" },
    { "rudism/telescope-dict.nvim", dependencies = "nvim-telescope/telescope.nvim" },

    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",
    {
        "stevearc/aerial.nvim",
        config = function()
            require "plugins.aerial"
        end,
    },

    "tamago324/nlsp-settings.nvim",
    {
        "folke/lsp-colors.nvim",
        dependencies = "neovim/nvim-lspconfig",
    },
    {
        "folke/trouble.nvim",
        config = function()
            require "plugins.trouble"
        end,
    },

    -- Completions & Snippets
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require "plugins.cmp"
        end,
        dependencies = {
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },
    },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lua" },
    { "kdheepak/cmp-latex-symbols" },
    { "uga-rosa/cmp-dictionary" },
    { "saadparwaiz1/cmp_luasnip" },
    {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
    },
    { "rafamadriz/friendly-snippets" },

    -- Github Copilot
    { "github/copilot.vim" },

    -- Git
    {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = function()
            require "plugins.git-signs"
        end,
    },
    {
        "sindrets/diffview.nvim",
        event = "BufWinEnter",
        config = function()
            require "plugins.git-diffview"
        end,
    },

    -- General
    {
        "aserowy/tmux.nvim",
        event = "BufWinEnter",
        config = function()
            require "plugins.tmux"
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        event = "BufWinEnter",
        config = function()
            require "plugins.toggleterm"
        end,
    },
    {
        "folke/which-key.nvim",
        event = "BufWinEnter",
        config = function()
            require "plugins.which-key"
        end,
    },

    {
        "numToStr/Comment.nvim",
        config = function()
            require "plugins.comment"
        end,
    },
    {
        "folke/todo-comments.nvim",
        config = function()
            require "plugins.todo-comments"
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require "plugins.colorizer"
        end,
    },

    {
        "iamcco/markdown-preview.nvim",
        ft = { "markdown" },
        build = "cd app && npm install",
        config = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_auto_close = 0
            vim.g.mkdp_browser = "firefox"
            vim.g.mkdp_markdown_css = ""
        end,
    },

    { "rcarriga/nvim-notify" },
    {
        "Tastyep/structlog.nvim",
        config = function()
            require "plugins.logger"
        end,
    },
    {
        'epwalsh/obsidian.nvim',
        config = function()
            require('obsidian').setup({
                dir = '~/Desktop/Obsidian/Notes',
                completion = {
                    nvim_cmp = true,
                },
            })
        end,
    },

    -- Themes & UI
    { "folke/tokyonight.nvim" },
    { "EdenEast/nightfox.nvim" },
    { "kartikp10/noctis.nvim", dependencies = { "rktjmp/lush.nvim" } },
    { "shaunsingh/oxocarbon.nvim", build = "./install.sh" },

    { "kyazdani42/nvim-web-devicons" },
    {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        dependencies = {
            "kyazdani42/nvim-web-devicons",
        },
        config = function()
            require "theme.nvim-tree"
        end,
    },
    {
        "romgrk/barbar.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            require "theme.barbar"
        end,
    },
    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig",
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "BufWinEnter",
        config = function()
            require "theme.lualine"
        end,
    },
    {
        "glepnir/dashboard-nvim",
        event = "BufWinEnter",
        config = function()
            require "theme.dashboard"
        end,
    },
}

return M
