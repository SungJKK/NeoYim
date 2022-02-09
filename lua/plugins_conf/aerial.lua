local status_ok, aerial = pcall(require, 'aerial')
if not status_ok then
    return
end

aerial.setup({
    backends = { "lsp"  },
    -- When jumping to a symbol, highlight the line for this many ms. Set to false to disable
    highlight_on_jump = false,
    -- When you fold code with za, zo, or zc, update the aerial tree as well. Only works when manage_folds = true
    link_folds_to_tree = false,
    -- Fold code when you open/collapse symbols in the tree. Only works when manage_folds = true
    link_tree_to_folds = true,
    -- Use symbol tree for folding. Set to true or false to enable/disable
    -- 'auto' will manage folds if your previous foldmethod was 'manual'
    manage_folds = true,
    -- The maximum width of the aerial window
    max_width = 60,
    min_width = 25,
    -- Call this function when aerial attaches to a buffer.
    -- Useful for setting keymaps. Takes a single `bufnr` argument.
    on_attach = nil,
    -- Run this command after jumping to a symbol (false will disable)
    post_jump_cmd = false,
    -- Show box drawing characters for the tree hierarchy
    show_guides = false,
})
