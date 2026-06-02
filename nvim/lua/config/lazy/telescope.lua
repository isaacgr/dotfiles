return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    cmd = { "Telescope" },
    keys = {
        { '<leader>pf', function() require('telescope.builtin').find_files() end, desc = "Find files" },
        { '<C-p>', function() require('telescope.builtin').git_files() end, desc = "Find git files" },
        { '<leader>pb', function() require('telescope.builtin').buffers() end, desc = "Buffers" },
        { '<leader>pws', function() require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") }) end, desc = "Grep word" },
        { '<leader>pWs', function() require('telescope.builtin').grep_string({ search = vim.fn.expand("<cWORD>") }) end, desc = "Grep WORD" },
        { '<leader>ps', function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }) end, desc = "Grep prompt" },
        { '<leader>vh', function() require('telescope.builtin').help_tags() end, desc = "Help tags" },
    },

    config = function()
        require('telescope').setup({})
    end
}
