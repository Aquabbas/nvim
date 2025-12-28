-- ------------------------------------------------------------------
-- NOTE: Options are automatically loaded before `lazy.nvim` startup.
-- ------------------------------------------------------------------
-- Default options that are always set:
-- ---------------------------------------------------------------------------
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- ---------------------------------------------------------------------------
-- Add any additional options down below ↓
-- ---------------------------------------

-- ------------------------------
vim.opt.relativenumber = false
-- ------------------------------

-- ----------------------------------------
-- Make Arabic text legible
-- Let Kitty Terminal handle the rendering
-- ----------------------------------------
vim.opt.arabicshape = false
-- ------------------------

-- --------------------------
-- LSP Server to use for PHP
-- Set to "intelephense". Otherwise, LazyVim sets "phpactor" as the default LSP
-- ----------------------------------------------------------------------------
vim.g.lazyvim_php_lsp = "intelephense"
-- -----------------------------------

-- -----------------------------------
-- Set to false to disable auto format
-- ------------------------------------
vim.g.lazyvim_eslint_auto_format = true
-- ------------------------------------

-- -----------------------------------------------
-- Disable highlighting of the current line number
-- -----------------------------------------------
-- vim.opt.cursorlineopt = "number"
-- --------------------------------

-- -----------------------------
-- LazyVim auto format (on save)
-- -----------------------------
vim.g.autoformat = false
-- ---------------------

-- -----------------------------------------------------------------------
-- NOTE: The setup below will automatically configure Database connections
-- without the need for manual input each time. We have three options
-- -----------------------------------------------------------------------

-- Option 1: Basic list of dictionaries (UNSAFE FOR SECRETS)
-- --------------------------------------------------------------------------
-- vim.g.dbs = {
--     { name = "Demo", url = "mysql://root:password@127.0.0.1:3306/myapp" },
-- }
-- --------------------------------------------------------------------------

-- Option 2: Use a local, git-ignored file (GOOD PRACTICE)
-- ---------------------------------------------------------------------------
-- This method uses a separate, local file to define connections.
--
-- 1. Create a file, e.g., `lua/secrets.lua`, inside your Neovim config dir.
--
-- 2. Add your secret connections to that file:
--    -- Inside lua/secrets.lua:
--    vim.g.dbs = {
--        { name = "Development", url = "mysql://user:pass@host/dev_db" },
--        { name = "Staging", url = "mysql://user:pass@host/staging_db" },
--    }
--
-- 3. IMPORTANT: Add `secrets.lua` to your `.gitignore` file.
--
-- 4. Uncomment the following lines to load the file:
-- local secrets_file = vim.fn.stdpath("config") .. "/lua/secrets.lua"
-- if vim.fn.filereadable(secrets_file) == 1 then
--     dofile(secrets_file)
-- end
-- ---------------------------------------------------------------------------

-- Option 3: Use a Dedicated Secrets Manager (SAFEST OPTION)
-- -------------------------------------------------------------------------
-- Fetch secrets dynamically from a tool like `1Password` or `Bitwarden`.
-- This is the most secure method as secrets are never stored in plaintext.
--
-- Replace "your-cli-tool get your-secret-name" with the actual service command.
-- local dev_db_url = vim.fn.trim(vim.fn.system("your-cli-tool get your-secret-name"))
-- if vim.v.shell_error == 0 and dev_db_url ~= "" then
--     vim.g.dbs = {
--         { name = "Secure DB Connection", url = dev_db_url },
--     }
-- end
-- -------------------------------------------------------------------------

-- -------------------------------------------------
-- HACK: For Kitty Terminal ↓ on `Pop!_OS 22.04 LTS`
-- --------------------------------------------------------------------------------
-- Problem: NeoVim (in tmux in Kitty Terminal) couldn't reliably copy to the system
-- clipboard due to conflicting methods between NeoVim, tmux, and Kitty
-- -----------------------------------------------------------------------------
-- Solution: We forced NeoVim to use the xclip command for clipboard actions via
-- configuration, and ensured tmux (using tmux-yank) also used xclip
-- ------------------------------------------------------------------
-- This made both use the same method, resolving the conflict
-- ----------------------------------------------------------
-- vim.g.clipboard = {
--     name = "xclip",
--     copy = {
--         ["+"] = "xclip -selection clipboard -in",
--         ["*"] = "xclip -selection primary -in",
--     },
--     paste = {
--         ["+"] = "xclip -selection clipboard -o",
--         ["*"] = "xclip -selection primary -o",
--     },
--     cache_enabled = 0,
-- }
