-- Initialize
require("core.bootstrap")

-- Plugins
local plugins = require('plugins')
require("plugin_loader").load(plugins)



-- LSP settings
require "lsp"

-- Theme settings
require "theme.colorscheme"
require "theme.barbar"
require "theme.lualine"
require "theme.nvim-tree"
require "theme.dashboard"

require "plugins_conf.filetype"

-- Plugins
require "plugins_conf.cmp"
require "plugins_conf.trouble"
require "plugins_conf.treesitter"
require "plugins_conf.telescope"

require "plugins_conf.git-signs"
require "plugins_conf.git-diffview"

require "plugins_conf.aerial"
require "plugins_conf.autopairs"

require "plugins_conf.comment"
require "plugins_conf.todo-comments"
require "plugins_conf.colorizer"

require "plugins_conf.toggleterm"

require "plugins_conf.which-key"

require "plugins_conf.tmux"
