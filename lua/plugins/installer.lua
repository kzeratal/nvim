return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
        ensure_installed = {
            { "bash-language-server" },
            { "clangd" },
            { "lua-language-server" },
            { "prettierd" },
            { "ruff" },
            { "rust-analyzer" },
            { "shfmt" },
            { "slint-lsp" },
            { "sql-formatter" },
            { "stylua" },
            { "typescript-language-server" },
        },
    },
    config = function(_, opts)
        require("mason-tool-installer").setup(opts)
    end,
}
