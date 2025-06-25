return {
    {
        "hedyhli/markdown-toc.nvim",
        config = function()
            require('mtoc').setup({
                cmd = {"Mtoc"},
                main="mtoc",
                opts={
                    auto_update=false
                }

            })
        end
    }
}

