local status_ok, db = pcall(require, "dashboard")
if not status_ok then
    return
end

custom_header = {
    "                       ....:..........                       ",
    "                   ......            ......                  ",
    "                .:..                      .::.               ",
    "              ...                           .::.             ",
    "            ^:!!:...........~!~!!^...........^!7~:           ",
    "           :^ .~:^::...    ^JJ!7?7.    ...:::^:..^.          ",
    "          :.::.   .:..::::.:?J777~.:::^:.::.  ..::..         ",
    "         :. ^~~:^:...:^^^~^.^.:..::~:^^:.::::~~~~: ..        ",
    "        .:  :      ..   ..:!^::^:^~..   ....    .:  :        ",
    "        ^.  :              .:...::.             .:  ::       ",
    "        ~   :              .:.:..:              .:  .^       ",
    "        ^   :              :.. .:^.             .:   ^       ",
    "        :.  :             :^ :^~:::             .:  .:       ",
    "        .:  :            ::: .^~.:.:            .:  ^.       ",
    "         .. :           .:.~..^.:::::            : :.        ",
    "          :.:          .^:::.:~:.^:.:.           :.:         ",
    "           .^        .: ^: :^:^::..^::          .^.          ",
    "            ^:.      ^.:.  :.:::^  ::.:.       .::           ",
    "            : ...   :^:    :.^:::   .^::     ..  :           ",
    "            :    ..^^^     :::^:.     ::^:^:.    :           ",
    "            :      .::....  ::^^:......:::.      :           ",
    "            :............::::^^^:::::.............           ",
}
custom_header2 = {
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡖⠁⠀⠀⠀⠀⠀⠀⠈⢲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⠀⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣧⠀⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⣸⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣇⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⢀⣀⣤⣤⣤⣤⣀⡀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣔⢿⡿⠟⠛⠛⠻⢿⡿⣢⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣷⣤⣀⡀⢀⣀⣤⣾⣿⣿⣿⣷⣶⣤⡀⠀⠀⠀⠀ ',
    '⠀⠀⢠⣾⣿⡿⠿⠿⠿⣿⣿⣿⣿⡿⠏⠻⢿⣿⣿⣿⣿⠿⠿⠿⢿⣿⣷⡀⠀⠀ ',
    '⠀⢠⡿⠋⠁⠀⠀⢸⣿⡇⠉⠻⣿⠇⠀⠀⠸⣿⡿⠋⢰⣿⡇⠀⠀⠈⠙⢿⡄⠀ ',
    '⠀⡿⠁⠀⠀⠀⠀⠘⣿⣷⡀⠀⠰⣿⣶⣶⣿⡎⠀⢀⣾⣿⠇⠀⠀⠀⠀⠈⢿⠀ ',
    '⠀⡇⠀⠀⠀⠀⠀⠀⠹⣿⣷⣄⠀⣿⣿⣿⣿⠀⣠⣾⣿⠏⠀⠀⠀⠀⠀⠀⢸⠀ ',
    '⠀⠁⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⢇⣿⣿⣿⣿⡸⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠈⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠐⢤⣀⣀⢀⣀⣠⣴⣿⣿⠿⠋⠙⠿⣿⣿⣦⣄⣀⠀⠀⣀⡠⠂⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠉⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀ ',
}
custom_header3 = {
     '⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣴⣦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
     '⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀ ',
     '⠀⠀⠀⠀⣠⣾⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣶⡀⠀⠀⠀⠀ ',
     '⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀ ',
     '⠀⠀⣼⣿⣿⠋⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀ ',
     '⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡇⠀ ',
     '⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀ ',
     '⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⠀ ',
     '⠀⣿⣿⣷⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀ ',
     '⠀⢸⣿⣿⡆⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀⣰⣿⣿⠇⠀ ',
     '⠀⠀⢻⣿⣿⣄⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⣰⣿⣿⡟⠀⠀ ',
     '⠀⠀⠀⠻⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⠀⠀⠀ ',
     '⠀⠀⠀⠀⠈⠻⣿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀ ',
     '⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀ ',
     '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
}

-- footer
db.setup({
    theme = 'hyper',
    config = {
        header = custom_header3,
        -- center = {
        --     {
        --         icon = "🗌   ",
        --         icon_hl = 'Title',
        --         desc = "New File",
        --         desc_hl = 'String',
        --         key = 'a',
        --         keymap = 'SPC t t',
        --         key_hl = 'Number',
        --         action = "DashboardNewFile",
        --     },
        --     {
        --         icon = "   ",
        --         icon_hl = 'Title',
        --         desc = "Find Files",
        --         desc_hl = 'String',
        --         key = 'b',
        --         keymap = 'SPC f f',
        --         key_hl = 'Number',
        --         action = "Telescope find_files",
        --     },
        --     {
        --         icon = "   ",
        --         icon_hl = 'Title',
        --         desc = "Find Words",
        --         desc_hl = 'String',
        --         key = 'c',
        --         keymap = 'SPC f t',
        --         key_hl = 'Number',
        --         action = "Telescope live_grep",
        --     },
        --     {
        --         icon = "   ",
        --         icon_hl = 'Title',
        --         desc = "Load Last Session",
        --         desc_hl = 'String',
        --         key = 'd',
        --         keymap = 'SPC s l',
        --         key_hl = 'Number',
        --         action = "SessionLoad",
        --     },
        --     {
        --         icon = "   ",
        --         icon_hl = 'Title',
        --         desc = "Marks",
        --         desc_hl = 'String',
        --         key = 'e',
        --         keymap = 'SPC f m',
        --         key_hl = 'Number',
        --         action = "Telescope marks",
        --     },
        --     {
        --         icon = "   ",
        --         icon_hl = 'Title',
        --         desc = "Settings",
        --         desc_hl = 'String',
        --         key = 'f',
        --         keymap = 'SPC t b',
        --         key_hl = 'Number',
        --         action = ":e " .. BASE_DIR .. "/init.lua",
        --     },
        -- },
        shortcut = {
            {
                desc = 'New File',
                group = 'Title',
                key = 'n',
                action = 'DashboardNewFile',
            },
            {
                desc = 'Find File',
                group = 'title',
                key = 'f',
                action = 'Telescope find_files',
            },
            {
                desc = 'Find string',
                group = 'Title',
                key = 't',
                action = 'Telescope live_grep',
            },
            {
                desc = 'Find mark',
                group = 'Title',
                key = 'm',
                action = 'Telescope marks',
            },
            {
                desc = 'Settings',
                group = 'Title',
                key = 's',
                action = ':e ' .. BASE_DIR .. '/init.lua',
            }
        },
        packages = { enable = true },
        project = {
            limit = 8,
            icon = '  ',
            label = 'Recent Projects',
            action = 'Telescope find_files cwd=',
        },
        mru = { 
            limit = 10,
            icon = '  ',
            label = 'Recent Files'
        },
        footer = {},
    },
    hide = {
        statusline = false,
        tabline = true,
        winbar = true,
    },
    preview = {
        command = '',
        file_path = '',
        file_height = '',
        file_width = '',
    }
})


