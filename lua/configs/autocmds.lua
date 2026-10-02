-- kernel C: enforce tab-based indentation per Documentation/process/coding-style.rst
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        vim.opt_local.tabstop = 8
        vim.opt_local.shiftwidth = 8
        vim.opt_local.expandtab = false
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function(args)
        vim.opt_local.scrolloff = 0
        vim.keymap.set("n", "-", function()
            local up = vim.keycode("<Plug>NetrwBrowseUpDir")
            local center = vim.keycode("<Cmd>normal! zz<CR>")

            vim.api.nvim_feedkeys(up .. center, "m", false)
        end, { buffer = args.buf, silent = true })
    end,
})
