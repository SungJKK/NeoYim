local fn = vim.fn
local install_path = DATA_PATH .. "/site/pack/packer/start/packer.nvim"

-- Check if packer is installed
local status_ok, _ = pcall(require, "packer")
if not status_ok then
    fn.delete(install_path, "rf")
    print "Cloning packer.."
    fn.system {
        "git",
        "clone",
        "https://github.com/wbthomason/packer.nvim",
        "--depth",
        "20",
        install_path,
    }

    vim.cmd "packadd packer.nvim"
end

-- Check again
local installed, packer = pcall(require, "packer")
if not installed then
    error("Could not clone packer !\nPacker path: " .. install_path)
    return
end

-- Packer popup window
packer.init {
    profile = {
        enable = true,
        threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },
    log = { level = "warn" }, -- Print log level: "trace", "debug", "info", "warn", "error", "fatal".
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
        prompt_border = "rounded",
    },
    git = {
        clone_timeout = 300,
        subcommands = {
            -- this is more efficient than what Packer is using
            fetch = "fetch --no-tags --no-recurse-submodules --update-shallow --progress",
        },
    },
    max_jobs = 50,
}

-- Always use most recent version of packer
vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('pluginsList').install()]]
vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('pluginsList').update()]]
vim.cmd [[command! PackerSync packadd packer.nvim | lua require('pluginsList').sync()]]
vim.cmd [[command! PackerClean packadd packer.nvim | lua require('pluginsList').clean()]]
vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('pluginsList').compile()]]
