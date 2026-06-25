return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
        ensure_installed = {
            "clang-format",
            "shfmt",
            "sql-formatter",
            "stylua",
        },
    },
    config = function(_, opts)
        require("mason-tool-installer").setup(opts)
    end,
}
