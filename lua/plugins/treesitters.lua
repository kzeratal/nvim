return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "rust",
                "sql",
            },
        },
        config = function(_, opts)
            require("nvim-treesitter").install(opts.ensure_installed):wait(300000)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "*",
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },
}
