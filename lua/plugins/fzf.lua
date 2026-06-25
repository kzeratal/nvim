return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        winopts = { preview = { default = "bat" } },
        grep = {
            rg_opts = "--color=never --no-heading --with-filename --line-number --column --smart-case --hidden --glob=!.git/",
        },
    },
    keys = {
        {
            "<leader>ps",
            function()
                require("fzf-lua").grep({ search = vim.fn.input("jimmy>") })
            end,
        },
        {
            "<leader>pf",
            function()
                require("fzf-lua").files()
            end,
        },
        {
            "<leader>fg",
            function()
                require("fzf-lua").live_grep()
            end,
        },
        {
            "<leader>fb",
            function()
                require("fzf-lua").buffers()
            end,
        },
        {
            "<leader>fh",
            function()
                require("fzf-lua").help_tags()
            end,
        },
        {
            "<leader>pc",
            function()
                require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
            end,
        },
    },
}
