require("config.set")
require("config.remap")
require("config.lazy_init")

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
