-- Open netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {})

-- move highlighted line/block up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Join the current line with the next but keep the cursor in place
vim.keymap.set("n", "J", "mzJ`z")

-- Half-page jump up/down keeping cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search next/previous result and center on the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste over selection without overwriting the default register
-- This one is very good
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank whole line to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

-- Delete without affecting the default register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Disable annoying Ex mode key
vim.keymap.set("n", "Q", "<nop>")

-- Launch tmux-sessionizer in a new tmux window
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format buffer using LSP
vim.keymap.set("n", "<leader>f", function()
    local conform = require('conform')
    local bufnr = vim.api.nvim_get_current_buf()
    local available = conform.list_formatters(bufnr)
    if #available > 0 then
        conform.format({ async = true })
    else
        vim.lsp.buf.format({ async = true })
    end
end
)

-- Jump to next/previous quickfix item and keep centered on screen
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Jump to next/previous location list item and keep centered on screen
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace word under the cursor globally, with confirmation
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Remove windows style carriage returns (^M)
vim.keymap.set("n", "<leader>rm", ":%s/\\r//g<CR>", {
    desc = "Remove ^M carriage returns",
})

-- Pretty print JSON file in current buffer using python
vim.keymap.set("n", "<leader>J", ":%!python3 -m json.tool<CR>")

-- Recursive grep for exact word under cursor (wrapped in \< \>)
vim.keymap.set('n', '<C-g>',
    [[:grep! -rn --exclude-dir=site-packages --exclude-dir=build --exclude=pylint.txt --exclude-dir=.mypy_cache --exclude-dir=.git --exclude-dir=node_modules '\<<C-r><C-w>\>' .<CR>:copen<CR>]],
    { desc = "Grep exact word under cursor" })

-- Recursive grep for partial symbol under cursor
vim.keymap.set('n', '<C-h>',
    [[:grep! -rn --exclude-dir=site-packages --exclude-dir=build --exclude=pylint.txt --exclude-dir=.mypy_cache --exclude-dir=.git --exclude-dir=node_modules  '<C-r><C-w>' .<CR>:copen<CR>]],
    { desc = "Grep symbol under cursor" })

-- Disable arrow keys in normal, insert, and visual modes
local opts = { noremap = true, silent = true }
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<NOP>", opts)
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<NOP>", opts)
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<NOP>", opts)
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<NOP>", opts)

-- Open a terminal
vim.keymap.set("n", "<leader>ft", function()
    local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    local target_dir = (vim.v.shell_error == 0 and git_root ~= "") and git_root or vim.fn.getcwd()
    vim.cmd("terminal")
    vim.cmd("startinsert")
    vim.fn.chansend(vim.b.terminal_job_id, "cd " .. vim.fn.shellescape(target_dir) .. "\n")
end, { desc = "Terminal (project root)" })
vim.keymap.set("n", "<leader>fT", ":terminal<CR>", { desc = "Terminal (current buffer)" })

-- Execute shell commands
vim.keymap.set("n", "<leader>sh", function()
    local cmd = vim.fn.input("Command: ")
    if cmd ~= "" then
        vim.fn.system(cmd)
    end
end, { desc = "Execute shell command" })

--[[
--
Map Ctrl+j to move the cursor to the window below
Map Ctrl+k to move the cursor to the window above
Map Ctrl+h to move the cursor to the window left
Map Ctrl+l to move the cursor to the window right

vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l")
--]]
