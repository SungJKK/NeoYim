-- Check neovim version
if vim.fn.has "nvim-0.6" ~= 1 then
  vim.notify("Upgrade neovim to v0.6+", vim.log.levels.WARN)
  vim.wait(3000, function()
    return false
  end)
  vim.cmd "cquit"
end

-- Import globals & default settings
require "utils.globals"
require "core.options"
require "core.keybindings"

-- Initialize packer plugin manager
require('plugin_loader').init()



