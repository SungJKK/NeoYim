local status_ok, tterm = pcall(require, 'toggleterm')
if not status_ok then
    return
end

tterm.setup({
    -- size can be a number or function which is passed the current terminal
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '2',
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    direction = 'float',
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    float_opts = {
        border =  'curved',
        -- width = 2,
        -- height = 2,
        winblend = 1,
        highlights = {
            border = "Normal",
            background = "Normal",
        }
    }
})

function _G.set_terminal_keymaps()
    -- Keybindings
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
    -- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    -- vim.api.nvim_buf_set_keymap(0, 't', 'kj', [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')


-- Example custom terminal
    -- :lua _LAZYGIT_TOGGLE()<CR>
    -- :ToggleTerm direction=horizontal size=10 ...
local Term = require('toggleterm.terminal').Terminal
local lazygit = Term:new({
    cmd = 'lazygit',
    hidden = true
})
function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

local htop = Term:new({
    cmd = 'htop',
    hidden = true
})
function _HTOP_TOGGLE()
    htop:toggle()
end


