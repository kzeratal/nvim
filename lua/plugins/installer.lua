return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
        ensure_installed = {
            "clang-format",
            "isort",
            "shfmt",
            "sql-formatter",
            "stylua",
        },
    },
    config = function(_, opts)
        require("mason-tool-installer").setup(opts)
    end,
}
