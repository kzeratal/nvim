return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = vim.fn.argc(-1) == 0,
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "lua",
                "python",
                "rust",
                "sql",
            },
        },
    },
}
