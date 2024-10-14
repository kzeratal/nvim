return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = { ensure_installed = { "lua_ls", "rust_analyzer", "slint_lsp" } },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-lspconfig.nvim" },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            lspconfig.lua_ls.setup({
                on_attach = function(_, bufnr)
                    local function map(...)
                        vim.api.nvim_buf_set_keymap(bufnr, ...)
                    end
                    local args = { noremap = true, silent = true }
                    map("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", args)
                    map("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", args)
                    map("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", args)
                    map("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", args)
                    map("n", "rn", "<CMD>lua vim.lsp.buf.rename()<CR>", args)
                    map("i", "<C-h>", "<CMD>lua vim.lsp.buf.signature_help()<CR>", args)
                end,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {
                                "vim",
                            },
                        },
                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                            },
                        },
                    },
                },
                capabilities = capabilities,
            })
            lspconfig.slint_lsp.setup({
                capabilities = capabilities,
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })
        end,
    },
}
