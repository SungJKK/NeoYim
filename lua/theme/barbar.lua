-- Settings
-- TODO: In lua config?
vim.cmd('let bufferline = get(g:, \'bufferline\', {})')
vim.cmd('let bufferline.animation = v:false')
vim.cmd('let bufferline.icon_separator_active = \'▎\'')
vim.cmd('let bufferline.icon_separator_inactive = \'▎\'')
vim.cmd('let bufferline.icon_close_tab = \'\'')
vim.cmd('let bufferline.icon_close_tab_modified = \'●\'')

-- Keybindings
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<TAB>', ':BufferNext<CR>', opts)
keymap('n', '<S-TAB>', ':BufferPrevious<CR>', opts)
keymap('n', '<S-c>', ':BufferClose<CR>', opts)
keymap('n', '<S-h>', ':BufferMovePrev<cr>', opts)
keymap('n', '<S-l>', ':BufferMoveNext<cr>', opts)

