return {
    "nvim-telescope/telescope.nvim",
    tags = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {},
    keys = {
        {
            "<leader>ps",
            function()
                require("telescope.builtin").grep_string({
                    search = vim.fn.input("jimmy>"),
                })
            end,
        },
        {
            "<leader>pf",
            function()
                require("telescope.builtin").find_files()
            end,
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
        },
        {
            "<leader>fb",
            function()
                require("telescope.builtin").buffers()
            end,
        },
        {
            "<leader>fh",
            function()
                require("telescope.builtin").help_tags()
            end,
        },
        {
            "<leader>pc",
            function()
                require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
            end,
        },
    },
}
