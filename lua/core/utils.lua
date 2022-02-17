local M = {}

local exists = function(file)
    local ok, err, code = os.rename(file, file)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    return ok, err
end

function M:create_dir(path)
    if not exists(path) then
        print("Creating " .. path .. "...")
        vim.fn.system { "mkdir", "-p", path }
        vim.fn.system { "chmod", "0700", path }
    end

    return path
end

return M
