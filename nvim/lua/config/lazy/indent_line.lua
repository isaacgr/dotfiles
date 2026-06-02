local highlight = {
    "CursorColumn",
    "Whitespace"
}
return {
    { -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        event = { "BufReadPost", "BufNewFile" },
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = 'ibl',
        opts = {
            scope = {
                enabled = false
            }
        },
    },
}
