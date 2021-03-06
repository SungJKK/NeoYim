local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    return
end

comment.setup {
    padding = true,
    comment_empty = false,
    -- Keybindings
    opleader = {
        line = "//",
        block = "<M-%>",
    },
    mappings = {
        basic = true,
        extra = false,
        extended = false,
    },
    pre_hook = function(ctx)
        local U = require "Comment.utils"

        local location = nil
        if ctx.ctype == U.ctype.block then
            location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require("ts_context_commentstring.utils").get_visual_start_location()
        end
        return require("ts_context_commentstring.internal").calculate_commentstring {
            key = type,
            location = location,
        }
    end,
}
