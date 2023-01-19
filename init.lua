-- Check neovim version
if vim.fn.has "nvim-0.8" ~= 1 then
    vim.notify("Upgrade neovim to v0.8+", vim.log.levels.WARN)
    vim.wait(3000, function()
        return false
    end)
    vim.cmd "cquit"
end

-- Global variables
BASE_DIR = vim.fn.stdpath "config" -- ~/.config/nvim
DATA_PATH = vim.fn.stdpath "data" -- ~/.local/share/nvim
CACHE_PATH = vim.fn.stdpath "cache" -- ~/.cache/nvim

-- Core settings
require "core.options"
require "core.keybindings"

require "core.pluginsManager"

require "lsp"
vim.cmd("highlight CopilotSuggestion guifg=#555555 ctermfg=8")

require "theme.colorscheme"

