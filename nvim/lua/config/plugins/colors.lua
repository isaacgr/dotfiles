-- Colorscheme plugins migrated from lazy.nvim to vim.pack format
-- Returns a list of specs (use vim.list_extend to merge into vim.pack.add)

function ColorMyPencils(color)
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    -- Primary colorscheme (loaded on startup)
    {
        src = 'https://github.com/folke/tokyonight.nvim',
        data = {
            setup = function()
                require("tokyonight").setup({
                    style = "storm",
                    transparent = true,
                    terminal_colors = true,
                    styles = {
                        comments = { italic = false },
                        keywords = { italic = false },
                        sidebars = "dark",
                        floats = "dark",
                    },
                })
                ColorMyPencils("tokyonight")
            end
        }
    },

    {
        src = 'https://github.com/ellisonleao/gruvbox.nvim',
        data = {
            setup = function()
                require("gruvbox").setup({
                    terminal_colors = true,
                    undercurl = true,
                    underline = false,
                    bold = true,
                    italic = {
                        strings = false,
                        emphasis = false,
                        comments = false,
                        operators = false,
                        folds = false,
                    },
                    strikethrough = true,
                    invert_selection = false,
                    invert_signs = false,
                    invert_tabline = false,
                    invert_intend_guides = false,
                    inverse = true,
                    contrast = "",
                    palette_overrides = {},
                    overrides = {},
                    dim_inactive = false,
                    transparent_mode = false,
                })
            end,
        }
    },

    {
        src = 'https://github.com/rose-pine/neovim',
        data = {
            setup = function()
                require('rose-pine').setup({
                    styles = {
                        italic = false,
                    },
                })
            end
        }
    },

    {
        src = 'https://github.com/navarasu/onedark.nvim',
        data = {
            setup = function()
                require('onedark').setup {
                    style = 'darker',
                    italic = false
                }
            end
        }
    },

    {
        src = 'https://github.com/sainnhe/everforest',
        data = {
            setup = function()
                vim.g.everforest_enable_italic = 0
                vim.g.everforest_background = 'hard'
                vim.g.everforest_disable_italic_comment = 1
            end
        }
    },
    {
        src = 'https://github.com/idr4n/andromeda.nvim',
        data = {}
    },

    {
        src = 'https://github.com/ikelaiah/nebula-drift-omega',
        data = {}
    },
    {
        src = 'https://github.com/catppuccin/nvim',
        data = {}
    },
    {
        src = 'https://github.com/shaunsingh/nord.nvim',
        data = {
            setup = function ()
                vim.g.nord_italic = false
            end
        }
    },
}
