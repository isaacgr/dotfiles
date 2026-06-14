return {
    src = "https://github.com/OXY2DEV/markview.nvim",
    data = {
        setup = function()
            require('markview').setup({
                preview = {
                    enable = false,
                    icon_provider = "devicons"
                }
            })
            vim.api.nvim_set_keymap("n", "<leader>m", "<CMD>Markview<CR>",
                { desc = "Toggles `markview` previews globally." });
        end
    }
}
