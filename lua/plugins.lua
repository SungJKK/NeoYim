return {
    -- Packer can manage itself as an optional plugin
    { "wbthomason/packer.nvim" },

    -- Need this until https://github.com/neovim/neovim/issues/12587 is open
    { "antoinemadec/FixCursorHold.nvim" },

    -- Integration with tmux
    { "aserowy/tmux.nvim" },

    -- Faster startup
    { "tweekmonster/startuptime.vim", disable = false },
    {
        "nathom/filetype.nvim",
    },
    { "lewis6991/impatient.nvim" },

    -- disable = true/false, requires = {...}, config = function() require('file.conf') end, events = "..."
    -- LSP
    { "neovim/nvim-lspconfig" },
    { "williamboman/nvim-lsp-installer" },
    { "tamago324/nlsp-settings.nvim" },
    { "folke/lsp-colors.nvim" },
    { "kosayoda/nvim-lightbulb", disable = false },
    { "folke/trouble.nvim" },
    { "jose-elias-alvarez/null-ls.nvim", disable = false },

    -- Completions
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lua" },
    { "saadparwaiz1/cmp_luasnip" },
    { "kdheepak/cmp-latex-symbols" },

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },

    -- Treesitter & Syntax
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "p00f/nvim-ts-rainbow" },
    { "MTDL9/vim-log-highlighting" },

    -- Telescope
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    { "nvim-telescope/telescope-symbols.nvim" },

    { "rudism/telescope-dict.nvim" },
    { "rhysd/vim-grammarous" },

    -- GiT
    { "lewis6991/gitsigns.nvim" },
    { "sindrets/diffview.nvim" },

    -- Coding
    { "stevearc/aerial.nvim" },
    { "windwp/nvim-autopairs" },
    { "windwp/nvim-ts-autotag" },
    { "numToStr/Comment.nvim" },
    { "folke/todo-comments.nvim" },
    { "norcalli/nvim-colorizer.lua" },
    { "akinsho/toggleterm.nvim" },


    -- Productivity
    { "mg979/vim-visual-multi" },
    { 'tpope/vim-surround' },
    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    { "dhruvasagar/vim-table-mode" },

    -- Themes
    { "catppuccin/nvim", as = "catppuccin" },
    -- use 'DavidBachmann/vim-punk-colorscheme'
    -- use 'Mofiqul/vscode.nvim'
    -- use 'shaunsingh/nord.nvim'
    -- use 'shaunsingh/moonlight.nvim'
    -- use 'NvChad/NvChad'
    -- use 'marko-cerovac/material.nvim'
    -- use 'folke/tokyonight.nvim'
    -- use 'EdenEast/nightfox.nvim'
    -- use 'pineapplegiant/spaceduck'

    -- UI
    { "kyazdani42/nvim-tree.lua" },
    { "kyazdani42/nvim-web-devicons" },
    { "romgrk/barbar.nvim" },
    { "nvim-lualine/lualine.nvim" },
    { "glepnir/dashboard-nvim" },
    { "folke/which-key.nvim" },
    { "rcarriga/nvim-notify" },
}
