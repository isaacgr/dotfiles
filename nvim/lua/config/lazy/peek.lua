return {
    {
        "toppair/peek.nvim",
        cond = function()
            return vim.fn.executable('deno') == 1
        end,
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup({
                filetype = { 'markdown', 'conf' },
                app="browser",
                theme='light'
            })
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end,
    },
}
