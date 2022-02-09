local M = {}

function M.init()
    -- Automatically install packer if not installed
    local fn = vim.fn
    local install_path = DATA_PATH ..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        print("Cloning packer..")
        packer_bootstrap = fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", "--depth", "20", install_path })
    end

    -- Check again if installed
    local status_ok, packer = pcall(require, 'packer')
    if not status_ok then
        return
    end

    -- Automatically run :PackerCompile whenever plugins.lua is updated
    vim.cmd([[
      augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerCompile
      augroup end
    ]])

    -- Packer popup window
    packer.init {
        git = {
            clone_timeout = 300,
            subcommands = {
                -- this is more efficient than what Packer is using
                fetch = "fetch --no-tags --no-recurse-submodules --update-shallow --progress",
            },
        },
        max_jobs = 50,
        display = {
            open_fn = function()
                return require('packer.util').float { border = 'rounded' }
            end
        }
    }

end


function M.load(plugins)
    local packer_status_ok, packer = pcall(require, 'packer')
    if not packer_status_ok then
        print('Packer is not available. Aborting...')
        return
    end

    packer.startup(function(use)
        for _, plugin in ipairs(plugins) do
            use(plugin)
        end
    end)
end

return M
