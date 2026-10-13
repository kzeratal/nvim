vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "j", "v:count == 0 ? 'gjzz' : 'jzz'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gkzz' : 'kzz'", { expr = true, silent = true })

vim.keymap.set("n", "G", "Gzz", { silent = true })
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })
vim.keymap.set("n", "*", "*zzzv", { silent = true })
vim.keymap.set("n", "#", "#zzzv", { silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })

vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")
vim.keymap.set("x", "J", ":m '>+1<CR>gv")
vim.keymap.set("x", "K", ":m '<-2<CR>gv")

local function goto_enclosing(types)
    local node = vim.treesitter.get_node()

    while node do
        if types[node:type()] then
            local row, col = node:range()
            vim.cmd("normal! m'")
            vim.api.nvim_win_set_cursor(0, { row + 1, col })
            vim.cmd("normal! zz")
            return
        end
        node = node:parent()
    end

    vim.notify("No enclosing definition found")
end

vim.keymap.set("n", "<leader>fh", function()
    goto_enclosing({ function_definition = true })
end)

vim.keymap.set("n", "<leader>ch", function()
    goto_enclosing({
        class_definition = true,
        class_specifier = true,
        struct_specifier = true,
    })
end)
