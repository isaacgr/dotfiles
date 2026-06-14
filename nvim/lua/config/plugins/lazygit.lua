-- NOTE: depends on nvim-lua/plenary.nvim
-- NOTE: lazy-loaded by cmd: LazyGit, LazyGitConfig, LazyGitCurrentFile, LazyGitFilter, LazyGitFilterCurrentFile

if vim.fn.executable('lazygit') ~= 1 then
    return nil
end

return {
    src = 'https://github.com/kdheepak/lazygit.nvim',
    data = {
        setup = function()
            pcall(vim.cmd.packadd, 'plenary.nvim')

            vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'Open lazy git' })
        end
    }
}
