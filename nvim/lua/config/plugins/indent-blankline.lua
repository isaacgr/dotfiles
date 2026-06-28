return {
    { -- Add indentation guides even on blank lines
        src = 'https://github.com/lukas-reineke/indent-blankline.nvim',
        data = {
            setup = function()
                require('ibl').setup({
                    scope = {
                        enabled = false
                    }
                })
            end
        }
    },
}
