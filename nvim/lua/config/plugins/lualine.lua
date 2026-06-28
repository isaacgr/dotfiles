return {
    src = 'https://github.com/nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'arkav/lualine-lsp-progress' },
    data = {
        setup = function()
            require('lualine').setup({
                options = {
                    theme = 'auto',
                    section_separators = '',
                    component_separators = '',
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = {},
                    lualine_x = { 'lsp_progress', 'encoding', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' },
                },
            })
        end
    }
}
