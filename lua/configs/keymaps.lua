vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "j", "v:count == 0 ? 'gjzz' : 'jzz'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gkzz' : 'kzz'", { expr = true, silent = true })
