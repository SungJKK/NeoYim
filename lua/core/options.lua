-- Disable built-in neovim plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit",
}
for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- If filetype.nvim exists, use that instead of builtin ft
local ft_status_ok, _ = pcall(require, "filetype")
if ft_status_ok then
    vim.g.did_load_filetypes = 1
end

-- Stop newline continuation of comments
-- TODO: in lua??
vim.cmd "autocmd BufEnter * set formatoptions-=cro"
vim.cmd "autocmd BufEnter * setlocal formatoptions-=cro"

-- Use ripgrep as default vimgrep if it exists
if vim.fn.executable "rg" then
    vim.o.grepprg = "rg -H --no-heading --smart-case --hidden --follow --vimgrep"
    vim.o.grepformat = "%f:%l:%c:%m"
end

-- Built-in options
local options = {
    shell = "/opt/homebrew/bin/fish",
    encoding = "utf-8",
    fileencoding = "utf-8",
    spelllang = "en_us",
    spell = true,

    backup = false,
    writebackup = true,
    backupext = '.bak',
    backupcopy = "auto", -- 'yes': more detailed but slower. 'no': less detailed but faster.
    -- backupdir = require("core.utils"):create_dir(BASE_DIR .. "/_cache/backups"),

    swapfile = false,
    undofile = false,

    timeoutlen = 300, -- By default timeoutlen is 1000 ms
    pumheight = 10,
    cmdheight = 2,
    conceallevel = 0, -- So that I can see `` in markdown files

    expandtab = true,
    smarttab = true,
    tabstop = 4,
    shiftwidth = 4,

    laststatus = 2,
    showtabline = 2, -- always show tabs
    updatetime = 300, -- faster completion
    scrolloff = 5,
    textwidth = 100,
    hidden = true, -- required to keep multiple buffers open
    wrap = true,
    ruler = true,
    splitbelow = true,
    splitright = true,
    smartindent = true,
    autoindent = true,
    smartcase = true,
    ignorecase = true,
    showmode = false, -- we do not need to see things like --INSERT-- anymore
    incsearch = true,
    hlsearch = true,
    lazyredraw = true, -- Don't draw the screen when running macros / regexes to speed up nvim

    mouse = "a",
    clipboard = "unnamedplus", -- Copy paste between vim and everything else
    -- errorbells = false  -- Disable audible & visual bells
    titlestring = "%<%F%=%l/%L - nvim",
    title = true,
    number = true, -- set numbered lines
    relativenumber = false, -- set relative number
    cursorline = false, -- Enable highlighting of the current line
    background = "dark",
    signcolumn = "yes",
    shadafile = "NONE",
    -- colorcolumn = '80',
    termguicolors = true,
    guifont = "FiraCodeMono",
    completeopt = { "menuone", "noselect" }, -- needed for nvim-compe
}
vim.opt.shortmess:append "c" -- Don't pass messages to |ins-completion-menu|.
vim.opt.whichwrap:append "<,>,[,],h,l"
vim.opt.iskeyword:append "-" -- treat dash separated words as a word text object"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.o.ls = 0 -- laststatus height 0
vim.o.ch = 0 -- cmd height 0

