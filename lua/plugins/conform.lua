return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            sql = { "sql_formatter" },
            typescript = { "prettierd" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
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
}
