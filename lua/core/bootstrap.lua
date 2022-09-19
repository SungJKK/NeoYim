-- Check neovim version
if vim.fn.has "nvim-0.7" ~= 1 then
    vim.notify("Upgrade neovim to v0.7+", vim.log.levels.WARN)
    vim.wait(3000, function()
        return false
    end)
    vim.cmd "cquit"
end

-- Global variables
BASE_DIR = vim.fn.stdpath "config" -- ~/.config/nvim
DATA_PATH = vim.fn.stdpath "data" -- ~/.local/share/nvim
CACHE_PATH = vim.fn.stdpath "cache" -- ~/.cache/nvim

-- Load impatient first
local status_ok, impatient = pcall(require, "impatient")
if status_ok then
    impatient.enable_profile()
end

-- Core settings
require "core.options"
require "core.keybindings"

-- Packer setup
require "core.packer"
