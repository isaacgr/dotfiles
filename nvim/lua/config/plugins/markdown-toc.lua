return {
    {
        src = 'https://github.com/hedyhli/markdown-toc.nvim',
        data = {
            setup = function()
                require('mtoc').setup({
                    -- NOTE: 'cmd' and 'main' are lazy.nvim fields; they have no vim.pack equivalent
                    auto_update = false,
                })
            end
        }
    }
}
