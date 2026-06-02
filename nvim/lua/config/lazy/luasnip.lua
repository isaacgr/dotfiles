return {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp",
    lazy = true,
    config = function()
        require("luasnip").setup({})
        require("luasnip.loaders.from_vscode").lazy_load()
    end
}
