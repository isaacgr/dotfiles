require("config.set")
require("config.remap")

-- Netrw settings (deferred until netrw is actually needed)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        vim.g.netrw_browse_split = 0
        vim.g.netrw_winsize = 25
        vim.g.netrw_list_style = 3
        vim.g.netrw_altv = 1
    end,
    once = true,
})

vim.g.splitjoin_python_brackets_on_separate_lines = 1
vim.g.splitjoin_trailing_comma = 1

-- ============================================================================
-- Plugins NOT yet migrated from lazy.nvim (still in config.lazy/):
--   - fugitive.lua
--   - harpoon.lua
--   - trouble.lua
--   - undotree.lua
-- ============================================================================

-- Single-spec plugins
local gitsigns = require('config.plugins.gitsigns')
local plenary = require('config.plugins.plenary')
local telescope_fzf = require('config.plugins.telescope-fzf')
local telescope_ui = require('config.plugins.telescope-ui')
local telescope = require('config.plugins.telescope')
local alpha = require('config.plugins.alpha')
local autopairs = require('config.plugins.autopairs')
local splitjoin = require('config.plugins.splitjoin')
local lazygit = require('config.plugins.lazygit')
local markview = require('config.plugins.markview')
local pio = require('config.plugins.pio')
local nvim_devicons = require('config.plugins.nvim-web-devicons')
local nvim_toggleterm = require('config.plugins.nvim-toggleterm')
local todo_comments = require('config.plugins.todo-comments')
local which_key = require('config.plugins.which-key')
local bufferline = require('config.plugins.bufferline')
local luasnip = require('config.plugins.luasnip')
local lualine = require('config.plugins.lualine')

-- List-spec plugins (return tables of multiple specs)
local colors = require('config.plugins.colors')
local treesitter = require('config.plugins.treesitter')
local lsp = require('config.plugins.lsp')
local nvim_colorizer = require('config.plugins.nvim-colorizer')
local markdown_toc = require('config.plugins.markdown-toc')
local indent_blankline = require('config.plugins.indent-blankline')

local plugins = {
    gitsigns,
    plenary,
    telescope_fzf, -- nil if make not installed
    telescope_ui,
    telescope,
    alpha,
    autopairs,
    splitjoin,
    lazygit, -- nil if lazygit not installed
    markview,    -- nil if deno not installed
    pio,     -- nil if pio not installed
    nvim_devicons,
    nvim_toggleterm,
    todo_comments,
    which_key,
    bufferline,
    luasnip,
    lualine
}

-- Merge list-spec plugins
-- These return a list of multiple plugins, so extending the list is easier
vim.list_extend(plugins, colors)
vim.list_extend(plugins, treesitter)
vim.list_extend(plugins, lsp)
vim.list_extend(plugins, nvim_colorizer)
vim.list_extend(plugins, markdown_toc)
vim.list_extend(plugins, indent_blankline)

-- There is no way to prevent vim.pack from attempting to load a plugin
-- once called. So we were getting errors like 'spec: expected table, got boolean'
-- when just returning 'nil' from some of the plugins. This loop builds a list
-- of active plugins based on those return values and only passes those to
-- vim.pack.add
local active_plugins = {}
for _, plug in ipairs(plugins) do
    -- Check if the spec is a table AND has a valid source string defined
    if type(plug) == 'table' and (type(plug[1]) == 'string' or type(plug.src) == 'string') then
        table.insert(active_plugins, plug)
    end
end

vim.pack.add(active_plugins)

for _, plug in ipairs(active_plugins) do
    local data = plug.data or {}
    local setup = data.setup
    if setup ~= nil and type(setup) == 'function' then
        local ok, err = pcall(setup)
        if not ok then
            vim.notify("Error setting up plugin: " .. tostring(err), vim.log.levels.ERROR)
        end
    end
end
