-- Moonlight
-- vim.g.moonlight_italic_comments = true
-- vim.g.moonlight_italic_keywords = true
-- vim.g.moonlight_italic_functions = true
-- vim.g.moonlight_italic_variables = false
-- vim.g.moonlight_contrast = true
-- vim.g.moonlight_borders = false
-- vim.g.moonlight_disable_background = false
-- require('moonlight').set()
--
-- Material
vim.g.material_style = "deep ocean" -- deep ocean, darker, lighter, palenight, oceanic
require("material").setup {
    contrast = {
        sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = true, -- Enable contrast for floating windows
        line_numbers = false, -- Enable contrast background for line numbers
        sign_column = false, -- Enable contrast background for the sign column
        cursor_line = false, -- Enable darker background for the cursor line
        non_current_windows = true, -- Enable darker background for non-current windows
        popup_menu = true, -- Enable lighter background for the popup menu
    },
    italics = {
        comments = true, -- Enable italic comments
        keywords = true, -- Enable italic keywords
        functions = true, -- Enable italic functions
        strings = false, -- Enable italic strings
        variables = false, -- Enable italic variables
    },
    contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
        "terminal", -- Darker terminal background
        "packer", -- Darker packer background
        "qf", -- Darker qf list background
    },
    high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false, -- Enable higher contrast text for darker style
    },
    disable = {
        borders = true, -- Disable borders between verticaly split windows
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false, -- Hide the end-of-buffer lines
    },
    lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
    async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
    custom_highlights = {}, -- Overwrite highlights with your own
}
vim.cmd "colorscheme material"
