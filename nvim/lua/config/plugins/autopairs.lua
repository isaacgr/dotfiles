-- NOTE: lazy.nvim used event = 'InsertEnter' for lazy loading
return {
    src = 'https://github.com/windwp/nvim-autopairs',
    data = {
        setup = function()
            require('nvim-autopairs').setup({})
        end
    }
}
