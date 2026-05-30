return {
    'anurag3301/nvim-platformio.lua',
    cond = function()
        return vim.fn.executable('pio') == 1
    end,
    dependencies = {
        { "akinsho/nvim-toggleterm.lua" },
        { "nvim-telescope/telescope.nvim" },
        { "nvim-lua/plenary.nvim" },
    },
}
