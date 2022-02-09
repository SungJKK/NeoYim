local status_ok, ft = pcall(require, 'filetype')
if not status_ok then
    return
end

ft.setup {
    extensions = {
        nix = "nix",
        tex = "tex"
    },
    complex = {
        ["tsconfig.json"] = "jsonc"
    }
}

