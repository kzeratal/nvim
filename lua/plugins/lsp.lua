return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-tool-installer.nvim" },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local on_attach = function(_, bufnr)
                local function map(...)
                    vim.api.nvim_buf_set_keymap(bufnr, ...)
                end
                local args = { noremap = true, silent = true }
                map("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", args)
                map("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", args)
                map("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", args)
                map("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", args)
                map("n", "rn", "<CMD>lua vim.lsp.buf.rename()<CR>", args)
                map("i", "<C-h>", "<CMD>lua vim.lsp.buf.signature_help()<CR>", args)
            end

            local servers = {
                bashls = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                            workspace = {
                                library = {
                                    vim.env.VIMRUNTIME,
                                },
                            },
                        },
                    },
                },
                pyright = {},
                ruff = {},
                rust_analyzer = {},
                slint_lsp = {},
                ts_ls = {},
            }

            for server, config in pairs(servers) do
                lspconfig[server].setup(vim.tbl_extend("force", {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }, config))
            end
        end,
    },
}
