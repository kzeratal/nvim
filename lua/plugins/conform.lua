return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            c = { "clang_format" },
            cpp = { "clang_format" },
            lua = { "stylua" },
            python = { "isort", "ruff_format" },
            sql = { "sql_formatter" },
        },
        formatters = {
            stylua = {
                args = {
                    "--config-path",
                    vim.fn.stdpath("config") .. "/style/.stylua.toml",
                    "-",
                },
            },
        },
    },
    config = function(_, opts)
        require("conform").setup(opts)
        vim.keymap.set("n", "<leader>f", function()
            require("conform").format({ timeout_ms = 500, lsp_format = "fallback" })
        end, { desc = "Format buffer" })
    end,
}
