local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local status_ok, navic = pcall(require, 'nvim-navic')
if not status_ok then
    return
end

local colors = {
    bg = "#0F111A",
    fg = "#A6ACCD",
    yellow = "#ECBE7B",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#98be65",
    orange = "#FF8800",
    violet = "#a9a1e1",
    magenta = "#c678dd",
    blue = "#51afef",
    red = "#ec5f67",
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand "%:t") ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 50
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand "%:p:h"
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Config
local config = {
    options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        theme = 'auto',
        globalstatus = true,
        disabled_filetypes = {
            statusline = {"dashboard", "NvimTree", "toggleterm"},
            winbar = {"dashboard", "NvimTree", "toggleterm"},
        },
        refresh = {
            statusline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
    tabline = nil,
    winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { navic.get_location, cond = navic.is_available } },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
    },
    inactive_winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
    },
    extensions = {}
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left {
    function()
        local mode_color = {
            n = colors.blue,
            i = colors.green,
            v = colors.magenta,
            [""] = colors.blue,
            V = colors.magenta,
            c = colors.orange,

            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [""] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ["r?"] = colors.cyan,
            ["!"] = colors.red,
            t = colors.red,
        }
        vim.api.nvim_command("hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg)
        return "▊"
    end,
    color = "LualineMode", -- Sets highlighting of component
    padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
    "b:gitsigns_head",
    icon = "",
    color = { gui = "bold" },
    cond = conditions.hide_in_width,
}

ins_left {
    "filename",
    cond = conditions.buffer_not_empty,
    color = {},
}

ins_left {
    "diff",
    -- Is it me or the symbol for modified us really weird
    symbols = { added = " ", modified = " ", removed = " " },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
    function()
        return "%="
    end,
}

ins_right {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = " " },
}

ins_right {
    function()
        local b = vim.api.nvim_get_current_buf()
        if next(vim.treesitter.highlighter.active[b]) then
            return ""
        end
        return ""
    end,
    color = { fg = colors.green },
    cond = conditions.hide_in_width,
}

ins_right {
    -- Lsp server name .
    function()
        msg = "No Active LSP"
        local buf_clients = vim.lsp.get_active_clients()
        if next(buf_clients) == nil then
            return msg
        end

        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local buf_client_names = {}
        -- add client
        for _, client in pairs(buf_clients) do
            local filetypes = client.config.filetypes

            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                table.insert(buf_client_names, client.name)
            end
        end

        return table.concat(buf_client_names, ", ")
    end,
    icon = " ",
    color = {},
    cond = conditions.hide_in_width,
}

ins_right {
    "filetype",
    cond = conditions.hide_in_width,
    color = {},
}

ins_right {
    function()
        local current_line = vim.fn.line "."
        local total_lines = vim.fn.line "$"
        local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
        local line_ratio = current_line / total_lines
        local index = math.ceil(line_ratio * #chars)
        return chars[index]
    end,
    padding = { left = 0, right = 1 },
    color = { fg = colors.yellow, bg = colors.bg },
    cond = conditions.hide_in_width,
}

-- Initialize lualine
lualine.setup(config)

-- Set one statusline on all buffers
vim.opt.laststatus = 3
