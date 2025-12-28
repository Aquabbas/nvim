-- ------------------------------------------------------------------------------
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- ------------------------------------------------------------------------------

-- ---------------
-- `Paste in Word`
-- ---------------
vim.keymap.set("n", "<leader>p", "viwp")

-- ----------
-- `oil.nvim`
-- ----------
vim.keymap.set("n", "-", require("oil").toggle_float, {})

-- -------------------
-- `no-neck-pain.nvim`
-- -------------------
vim.keymap.set("n", "<leader>nn", ":NoNeckPain<CR>", {})
vim.keymap.set("n", "<leader>nh", ":NoNeckPainToggleLeftSide<CR>", {})
vim.keymap.set("n", "<leader>nl", ":NoNeckPainToggleRightSide<CR>", {})

-- ---------------
-- `gitsigns.nvim`
-- ---------------
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})

-- -----------------------
-- `markdown-preview.nvim`
-- -----------------------
vim.api.nvim_set_keymap(
    "n",
    "<leader>mp",
    ":MarkdownPreviewToggle<CR>",
    { noremap = true, silent = true }
)

-- ----------------------
-- `nvim-tmux-navigation`
-- ----------------------
vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", {})
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", {})
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", {})
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", {})
-- ------------------------------------------------------------------------------
