return {
    "itchyny/lightline.vim",
    config = function()
        vim.g.lightline = {
            colorscheme = "one",
            active = {
                left = { { "mode", "paste" }, { "gitbranch", "readonly", "filename", "modified" } },
            },
        }
    end,
}
