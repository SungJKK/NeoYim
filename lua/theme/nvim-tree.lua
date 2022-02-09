local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    vim.notify('Nvim-Tree plugin is not found', 'error')
end

vim.g.nvim_tree_show_icons = {git = 1, folders = 1, files = 1, folder_arrows = 0}
vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {unstaged = "✗", staged = "✓", unmerged = "", renamed = "➜", untracked = "★", deleted = "", ignored = "◌"},
    folder = {default = "", open = "", empty = "", empty_open = "", symlink = ""}
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local nvim_tree_bindings = {
    -- Keybindings
    -- { key = "<Tab>", mode = "v", cb = ":lua some_func()<cr>"}
    { key = {"<CR>", "o", "l", "<2-LeftMouse>", "<2-RightMouse>"}, cb = tree_cb('edit') },
    { key = "v", cb = tree_cb('vsplit') },
    { key = "s", cb = tree_cb('split') },
    { key = {"<BS>"}, cb = tree_cb('dir_up') },
    { key = "R", cb = tree_cb('refresh') },
    { key = "a", cb = tree_cb('create') },
    { key = "d", cb = tree_cb('remove') },
    { key = "r", cb = tree_cb('full_rename') },
    { key = "c", cb = tree_cb('copy') },
    { key = "x", cb = tree_cb('cut') },
    { key = "p", cb = tree_cb('paste') },
    { key = "I", cb = tree_cb('toggle_ignored') },
    { key = "H", cb = tree_cb('toggle_dotfiles') },
}

nvim_tree.setup{
    open_on_setup       = false,
    ignore_ft_on_setup  = { 'dashboard' },
    auto_close          = true,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = false,
    update_to_buf_dir   = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
    },
    system_open = {
        cmd  = nil,
        args = {}
    },
    filters = {
        dotfiles = false,
        custom = {}
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 26,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        auto_resize = false,
        mappings = {
            custom_only = true,
            list = nvim_tree_bindings
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes"
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    }
}


