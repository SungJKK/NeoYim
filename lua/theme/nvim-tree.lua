local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    vim.notify("Nvim-Tree plugin is not found", "error")
end

local tree_cb = require("nvim-tree.config").nvim_tree_callback
local nvim_tree_bindings = {
    -- Keybindings
    -- { key = "<Tab>", mode = "v", cb = ":lua some_func()<cr>"}
    { key = { "<CR>", "o", "l", "<2-LeftMouse>", "<2-RightMouse>" }, cb = tree_cb "edit" },
    { key = "v", cb = tree_cb "vsplit" },
    { key = "s", cb = tree_cb "split" },
    { key = { "<BS>" }, cb = tree_cb "dir_up" },
    { key = "R", cb = tree_cb "refresh" },
    { key = "a", cb = tree_cb "create" },
    { key = "d", cb = tree_cb "remove" },
    { key = "r", cb = tree_cb "full_rename" },
    { key = "c", cb = tree_cb "copy" },
    { key = "x", cb = tree_cb "cut" },
    { key = "p", cb = tree_cb "paste" },
    { key = "I", cb = tree_cb "toggle_ignored" },
    { key = "H", cb = tree_cb "toggle_dotfiles" },
}

nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = { "dashboard" },
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {},
    },
    system_open = {
        cmd = nil,
        args = {},
    },
    sort_by = "case_sensitive",
    renderer = {
        icons = {
            show = {
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
                folder = { default = "", open = "", empty = "", empty_open = "", symlink = "" },
            },
        },
    },
    filters = {
        dotfiles = false,
        custom = {},
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    view = {
        width = 25,
        adaptive_size = true,
        hide_root_folder = false,
        side = "left",
        mappings = {
            custom_only = true,
            list = nvim_tree_bindings,
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes",
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
}

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})
