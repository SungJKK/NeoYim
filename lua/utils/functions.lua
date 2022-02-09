local M = {}

local exists = function (file)
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
        print('Creating _cache/undo for persistant undo history...')
        vim.fn.system({'mkdir', '-p', UNDO_DIR})
        vim.fn.system({'chmod', '0700', UNDO_DIR})

        -- require('os')
        -- os.execute('mkdir ' .. UNDO_DIR)
        -- os.execute('chmod 0700 ' .. UNDO_DIR)
    end
end

return M
