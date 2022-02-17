local status_ok, ft = pcall(require, "filetype")
if not status_ok then
    return
end

ft.setup {
    extensions = {
        nix = "nix",
        tex = "tex",
    },
    complex = {
        ["tsconfig.json"] = "jsonc",
    },
    function_extensions = {
        ["markdown"] = {
            -- vim-table-mode plugin
            vim.cmd [[
            function! s:isAtStartOfLine(mapping)
            let text_before_cursor = getline('.')[0 : col('.')-1]
            let mapping_pattern = '\V' . escape(a:mapping, '\')
            let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
            return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
            endfunction

            inoreabbrev <expr> <bar><bar>
            \ <SID>isAtStartOfLine('\|\|') ?
            \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
            ]]
        }
    }
}
