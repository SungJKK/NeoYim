local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Keybindings
-- keymap('', '<Space>', '<NOP>', opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--      normal mode = 'n'
--      insert mode = 'i'
--      visual mode = 'v'
--      visual block mode = 'x'
--      term mode = 't'
--      command mode = 'c'

-- Normal mode --
-- Better window movement
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- TODO: change to ctrl-arrows instead of shift
keymap("n", "<S-Up>", ":resize +2<CR>", opts)
keymap("n", "<S-Down>", ":resize -2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize -2<CR>", opts)

-- Tab to switch between buffers
keymap("n", "<TAB>", ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprev<CR>", opts)
keymap("n", "<S-c>", ":bdelete<CR>", opts)

-- Better window splitting
keymap("n", "<Leader>v", ":vsp<CR>", opts)
keymap("n", "<Leader>h", ":sp<CR>", opts)
keymap("n", "<Leader>o", ":only<CR>", opts)

-- Insert mode --
-- jk, kj instead of escape
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual mode --
-- Continuous movement
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "<S-j>", ":m '>+1<CR>gv-gv", opts)
keymap("v", "<S-k>", ":m '<-2<CR>gv-gv", opts)

-- Folding
-- keymap('x', '', 'zf', opts)  -- code fold
-- keymap('x', '', 'zo', opts)  -- open fold
-- keymap('x', '', 'zc', opts)  -- close fold
