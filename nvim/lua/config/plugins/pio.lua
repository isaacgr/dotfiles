-- Dependencies: akinsho/nvim-toggleterm.lua, nvim-telescope/telescope.nvim, nvim-lua/plenary.nvim
-- Note: original lazy.nvim spec used ft = { "c", "cpp" } for lazy loading

if vim.fn.executable('pio') ~= 1 then
    return nil
end

return {
    src = 'https://github.com/anurag3301/nvim-platformio.lua',
}
