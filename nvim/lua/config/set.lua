-- Enable faster startup by caching compiled Lua modules
vim.loader.enable()

vim.g.mapleader = ";"
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Disable swap file creation (for fewer temporary files)
vim.opt.swapfile = false

-- Directory to store undo history files for larger history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Enable undo/redo changes even after closing and reopening a file
vim.opt.undofile = true

-- Do not highlight matches after search
vim.opt.hlsearch = false

-- Show matches while typing a search query
vim.opt.incsearch = true

-- True color support in the terminal
vim.opt.termguicolors = true

-- Keep 8 lines of context above and below the cursor when scrolling
vim.opt.scrolloff = 10

-- Always show the sign column (for git signs etc.)
vim.opt.signcolumn = "yes"

-- Allow '@' as a valid character in filenames
vim.opt.isfname:append("@-@")

-- If this many milliseconds nothing is typed the swap file will be
-- written to disk
vim.opt.updatetime = 50

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 50

-- Enable break indent
vim.o.breakindent = true

vim.opt.colorcolumn = "80"

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Dont immediately jump to 'next' match when searching word matches
vim.keymap.set('n', '*', '*N')
vim.keymap.set('n', '#', '#N')

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-guide-options`
--  vim.o.list = true
--  vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Need to be able to copy and paste from registers to windows keyboard when in wsl
local in_wsl = function()
    local ok, output = pcall(function()
        return vim.fn.readfile("/proc/version")
    end)
    return ok and output[1] and output[1]:match("Microsoft") ~= nil
end

if in_wsl() then
    vim.g.clipboard = {
        name = "WslClipboard",
        copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe",
        },
        paste = {
            ["+"] = [[powershell.exe -NoLogo -NoProfile -Command Get-Clipboard]],
            ["*"] = [[powershell.exe -NoLogo -NoProfile -Command Get-Clipboard]],
        },
        cache_enabled = 0,
    }
end
