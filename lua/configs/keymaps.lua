vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "j", "v:count == 0 ? 'gjzz' : 'jzz'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gkzz' : 'kzz'", { expr = true, silent = true })

vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })
vim.keymap.set("n", "*", "*zzzv", { silent = true })
vim.keymap.set("n", "#", "#zzzv", { silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })
