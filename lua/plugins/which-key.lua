local status_ok, wk = pcall(require, "which-key")
if not status_ok then
    return
end

wk.setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = false, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = false, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

-- Keybindings
local n_opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}
wk.register({
    e = { "<cmd>NvimTreeToggle<cr>", "File explorer" },
    i = { ":set hlsearch!<cr>", "Toggle hlsearch" },
    r = { ":lua vim.lsp.buf.formatting_sync()<cr>", "Format file" },
    n = { ":Notifications<cr>", "Notifications" },
    c = {
        name = "+Competitive Programming",
        a = {":CompetiTestAdd<cr>", "Add testcases"},
        e = {":CompetiTestEdit<cr>", "Edit testcases"},
        d = {":CompetiTestDelete<cr>", "Delete testcases"},
        r = {":CompetiTestRun<cr>", "Run testcases"},
    },
    u = {
        name = "+Packer",
        i = { ":PackerInstall<cr>", "Install" },
        c = { ":PackerCompile profile=true<cr>", "Compile" },
        r = { ":PackerClean<cr>", "Clean" },
        u = { ":PackerSync<cr>", "Update" },
        p = { ":PackerProfile<cr>", "Profiling" },
    },
    s = {
        name = "+Session",
        s = { "<cmd>SessionSave<cr>", "Save session" },
        l = { "<cmd>SessionLoad<cr>", "Load session" },
    },
    d = {
        name = "+TODO",
        c = { "<cmd>TodoLocList<cr>", "view_current_file" },
        t = { "<cmd>TodoTrouble<cr>", "view_trouble" },
        q = { "<cmd>TodoQuickFix<cr>", "view_quickfix" }, -- use after :grep "string"
        f = { "<cmd>TodoTelescope<cr>", "view_telescope" },
    },
    f = {
        name = "+Find",
        s = {
            ":lua require'telescope.builtin'.symbols{sources = {'emoji', 'gitmoji', 'math', 'latex'}}<cr>",
            "Symbols",
        },
        o = { "<cmd>lua require'telescope.builtin'.oldfiles()<cr>", "Recent files" },
        t = { "<cmd>lua require'telescope.builtin'.live_grep()<cr>", "Text" },
        f = { "<cmd>lua require'telescope.builtin'.find_files()<cr>", "Files" },
        c = { "<cmd>lua require'telescope.builtin'.commands()<cr>", "Commands" },
        r = { "<cmd>lua require'telescope.builtin'.registers()<cr>", "Registers" },
        m = { "<cmd>lua require'telescope.builtin'.marks()<cr>", "Marks" },
        p = { "<cmd>lua require'telescope.builtin'.man_pages()<cr>", "Man pages" },
        d = { "<cmd>lua require('telescope').extensions.dict.synonyms()<cr>", "Dictionary" },
        u = { "<cmd>lua require'telescope.builtin'.colorscheme()<cr>", "Colorschemes" },
    },
    l = {
        name = "+LSP",
        i = { ":LspInfo<cr>", "LSP server info" },
        s = { ":Mason<cr>", "All servers" },

        r = { "<cmd>Trouble lsp_references<cr>", "Lsp References" },

        w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace diagnostics" },
        d = { "<cmd>Trouble document_diagnostics<cr>", "Document diagnostics" },

        q = { "<cmd>Trouble quickfix<cr>", "Quick Fix" },
        l = { "<cmd>Trouble loclist<cr>", "Local list" },

        e = { ":lua require'telescope.builtin'.lsp_implementations()<cr>", "Lsp implementations" },
    },
    a = {
        name = "+Aerial",
        t = { "<cmd>AerialToggle<cr>", "Toggle" },
        o = { "<cmd>AerialTreeOpen<cr>", "Open section" },
        c = { "<cmd>AerialTreeClose<cr>", "Close section" },
    },
    g = {
        name = "+Git",
        t = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle blame" },
        l = { ":lua _LAZYGIT_TOGGLE()<cr>", "Lazy git" },

        -- Telesccope
        f = { "<cmd>lua require'telescope.builtin'.git_files()<cr>", "Git files" },
        b = { "<cmd>lua require'telescope.builtin'.git_branches()<cr>", "Git branches" },
        c = { "<cmd>lua require'telescope.builtin'.git_commits()<cr>", "Git commits" },

        -- Git Diffview
        g = { ":DiffviewOpen<cr>", "Open git_diff" },
        d = { ":DiffviewClose<cr>", "Close git_diff" },
    },
    p = {
        name = "+Preview",
        m = { ":MarkdownPreview<cr>", "Markdown Preview" },
    },
    t = {
        name = "+Terminal",
        f = { ":ToggleTerm<cr>", "Toggle terminal" },
        h = { ":ToggleTerm direction=horizontal size=12<cr>", "Horizontal terminal" },
        v = { ":ToggleTerm direction=vertical size=40<cr>", "Vertical terminal" },
        m = { ":lua _HTOP_TOGGLE()<cr>", "Htop" },
    },
}, n_opts)
