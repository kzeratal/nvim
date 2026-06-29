return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local opts = { noremap = true, silent = true, buffer = args.buf }
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
                end,
            })

            local servers = {
                bashls = {},
                clangd = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = { globals = { "vim" } },
                            workspace = { library = { vim.env.VIMRUNTIME } },
                        },
                    },
                },
                pyright = {},
                ruff = {},
                rust_analyzer = {},
            }

            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(servers),
            })

            for server_name, server_config in pairs(servers) do
                vim.lsp.config(server_name, vim.tbl_extend("force", {
                    capabilities = capabilities,
                }, server_config))
                vim.lsp.enable(server_name)
            end
        end,
    },
    {
        "neovim/nvim-lspconfig",
    },
}
