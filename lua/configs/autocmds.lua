-- kernel C: enforce tab-based indentation per Documentation/process/coding-style.rst
vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
        vim.opt_local.tabstop = 8
        vim.opt_local.shiftwidth = 8
        vim.opt_local.expandtab = false
    end,
})
