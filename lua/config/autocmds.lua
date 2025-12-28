-- ------------------------------------------------------------------------------
-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- ----------------------------------------------------------------------------
--
-- ----------------------------------
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
-- ----------------------------------
--
-- -----------------------------------------------------------------------
-- Or remove existing autocmds by their group name (which is prefixed with
-- `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- ------------------------------------------------------------------------------

-- --------------------------------------------------
-- Disable spelling errors in Markdown and Text files
-- --------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "txt" },
    callback = function()
        vim.opt_local.spell = false
    end,
})

-- ------------------------------------------------------------------------------
-- https://github.com/LazyVim/LazyVim/discussions/2268
-- https://github.com/LazyVim/LazyVim/discussions/4094#discussioncomment-10178217
-- ------------------------------------------------------------------------------

-- -----------------
-- Highlight on yank
-- -----------------
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 250, -- duration in milliseconds
        })
    end,
})
-- ------------------------------------------------------------------------------
