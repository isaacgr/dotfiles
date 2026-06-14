-- Conditionally return the spec only if make is available
if vim.fn.executable('make') == 1 then
    return {
        src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
        data = {
            setup = function()
                -- Handled by core telescope file or called on packadd
            end
        }
    }
else
    return nil
end
