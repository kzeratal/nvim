vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.clipboard = "unnamedplus"

vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.undodir"

vim.filetype.add({
    extension = {
        slint = "slint",
    },
})

require("configs.lazy")
