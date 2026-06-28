-- Treesitter: syntax highlighting, indentation, and context
-- Neovim 0.12+ has native treesitter support; nvim-treesitter just manages parser installs.
-- Run :TSUpdate after install to compile parsers.

return {
    {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter',
        version = 'main',
        data = {
            setup = function()
                -- Ensure parsers are installed (nvim-treesitter CLI commands)
                local ensure_installed = {
                    "vimdoc", "javascript", "typescript", "c", "lua", "rust",
                    "jsdoc", "bash", "go", "python", "markdown", "markdown_inline"
                }

                -- Auto-install missing parsers when entering a buffer
                vim.api.nvim_create_autocmd("FileType", {
                    group = vim.api.nvim_create_augroup("treesitter-auto-install", { clear = true }),
                    callback = function()
                        local buf = vim.api.nvim_get_current_buf()
                        local ft = vim.bo[buf].filetype

                        -- Disable treesitter for large files
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            vim.notify(
                                "File larger than 100KB treesitter disabled for performance",
                                vim.log.levels.WARN,
                                { title = "Treesitter" }
                            )
                            vim.treesitter.stop(buf)
                            return
                        end

                        -- Disable treesitter highlighting for html
                        if ft == "html" then
                            vim.treesitter.stop(buf)
                            return
                        end

                        -- Try to start treesitter highlighting
                        local lang_ok, lang = pcall(vim.treesitter.language.get_lang, ft)
                        if lang_ok and lang then
                            pcall(vim.treesitter.start, buf, lang)
                        end
                    end,
                })

                -- Install any missing parsers from ensure_installed list
                vim.api.nvim_create_autocmd("VimEnter", {
                    group = vim.api.nvim_create_augroup("treesitter-ensure-installed", { clear = true }),
                    once = true,
                    callback = function()
                        for _, parser in ipairs(ensure_installed) do
                            local installed, _ = pcall(vim.treesitter.language.inspect, parser)
                            if not installed then
                                vim.cmd("TSInstall " .. parser)
                            end
                        end
                    end,
                })

                -- Register templ filetype
                vim.treesitter.language.register("templ", "templ")
            end
        }
    },

    {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter-context',
        -- NOTE: depends on nvim-treesitter (loaded above)
        data = {
            setup = function()
                require'treesitter-context'.setup{
                    enable = true,
                    multiwindow = false,
                    max_lines = 0,
                    min_window_height = 0,
                    line_numbers = true,
                    multiline_threshold = 20,
                    trim_scope = 'outer',
                    mode = 'cursor',
                    separator = nil,
                    zindex = 20,
                    on_attach = nil,
                }
            end
        }
    },
}
