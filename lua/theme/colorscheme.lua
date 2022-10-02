-- Moonlight
-- vim.g.moonlight_italic_comments = true
-- vim.g.moonlight_italic_keywords = true
-- vim.g.moonlight_italic_functions = true
-- vim.g.moonlight_italic_variables = false
-- vim.g.moonlight_contrast = true
-- vim.g.moonlight_borders = false
-- vim.g.moonlight_disable_background = false
-- require('moonlight').set()

-- vscode
-- vim.o.background = 'dark' -- 'light' for light theme
-- local c = require('vscode.colors')
-- require('vscode').setup({
--     -- Enable transparent background
--     transparent = false,
--
--     -- Enable italic comment
--     italic_comments = true,
--
--     -- Disable nvim-tree background color
--     disable_nvimtree_bg = true,
--
--     -- Override colors (see ./lua/vscode/colors.lua)
--     color_overrides = {
--         vscLineNumber = '#FFFFFF',
--     },
--
--     -- Override highlight groups (see ./lua/vscode/theme.lua)
--     group_overrides = {
--         -- this supports the same val table as vim.api.nvim_set_hl
--         -- use colors from this colorscheme by requiring vscode.colors!
--         Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
--     }
-- })
--

-- Material
-- vim.g.material_style = "deep ocean" -- deep ocean, darker, lighter, palenight, oceanic
-- require("material").setup {
--     contrast = {
--         sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
--         floating_windows = true, -- Enable contrast for floating windows
--         line_numbers = false, -- Enable contrast background for line numbers
--         sign_column = false, -- Enable contrast background for the sign column
--         cursor_line = false, -- Enable darker background for the cursor line
--         non_current_windows = true, -- Enable darker background for non-current windows
--         popup_menu = true, -- Enable lighter background for the popup menu
--     },
--     italics = {
--         comments = true, -- Enable italic comments
--         keywords = true, -- Enable italic keywords
--         functions = true, -- Enable italic functions
--         strings = false, -- Enable italic strings
--         variables = false, -- Enable italic variables
--     },
--     contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
--         "terminal", -- Darker terminal background
--         "packer", -- Darker packer background
--         "qf", -- Darker qf list background
--     },
--     high_visibility = {
--         lighter = false, -- Enable higher contrast text for lighter style
--         darker = false, -- Enable higher contrast text for darker style
--     },
--     disable = {
--         borders = true, -- Disable borders between verticaly split windows
--         background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
--         term_colors = false, -- Prevent the theme from setting terminal colors
--         eob_lines = false, -- Hide the end-of-buffer lines
--     },
--     lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
--     async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
--     custom_highlights = {}, -- Overwrite highlights with your own
-- }
-- vim.cmd "colorscheme material"

-- tokyonight
require("tokyonight").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "storm", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
    transparent = false, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
    },
    sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = false, -- dims inactive windows
    lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

    --- You can override specific color groups to use other groups or a hex color
    --- function will be called with a ColorScheme table
    ---@param colors ColorScheme
    -- on_colors = function(colors) end,

    --- You can override specific highlights to use other groups or a hex color
    --- function will be called with a Highlights and ColorScheme table
    ---@param highlights Highlights
    ---@param colors ColorScheme
    -- on_highlights = function(highlights, colors) end,

}
vim.cmd "colorscheme tokyonight-night"

-- horizon.nvim
-- vim.cmd "colorscheme horizon"
