return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
        auto_update = true,
        ensure_installed = {
            "clang-format",
            "shfmt",
            "stylua",
        },
    },
    config = function(_, opts)
        require("mason-tool-installer").setup(opts)
    end,
}
