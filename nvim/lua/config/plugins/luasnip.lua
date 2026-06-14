return {
    src = "https://github.com/L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp",
    data = {
        setup = function()
            require("luasnip").setup({})
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    }
}
