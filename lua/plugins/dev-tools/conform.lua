-- local zsh = require("lint.linters.zsh")
-- ----------------------------------------
-- NOTE: Modify the code below if you want:
-- 1. Specific order of Formatter priority
-- 2. Formatters that LazyVim does NOT set up by default
-- -----------------------------------------------------
-- Check LazyVim Defaults: https://www.lazyvim.org/extras/lang/angular
-- -------------------------------------------------------------------
-- Formatters:
-- -----------
return {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },

            -- ------------------------------------------------------------------
            -- NOTE: `pint` is built on top of `php-cs-fixer` by the Laravel Team
            -- If you want to set Laravel Pint as the default PHP Formatter
            -- with PHP CS Fixer as a fall back, uncomment the following:
            -- php = { "pint", "php_cs_fixer" },
            -- ---------------------------------

            -- --------------------------------------
            -- At work (Aug 2025), I just use:
            php = { "php_cs_fixer" },
            -- ----------------------

            -- ----------------------------------------------------------------
            -- For `Bash` and `sh`, LazyVim chooses `shfmt` as the Formatter
            -- I can't find a working Formatter for `Zsh`, so I give up for now
            -- (╯°□°）╯︵ ┻━┻
            -- ----------------------------------------------------------------

            markdown = { "prettierd", "prettier", "markdownlint-cli2", stop_after_first = true },
            md = { "prettierd", "prettier", "markdownlint-cli2", stop_after_first = true },
            txt = { "prettierd", "prettier", stop_after_first = true },

            javascript = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },

            css = { "prettierd", "prettier", stop_after_first = true },
            scss = { "prettierd", "prettier", stop_after_first = true },
            html = { "prettierd", "prettier", stop_after_first = true },

            json = { "prettierd", "prettier", stop_after_first = true },
            yaml = { "prettierd", "prettier", stop_after_first = true },
            graphql = { "prettierd", "prettier", stop_after_first = true },

            sql = { "sleek" },
        },

        -- --------------------------------------------
        -- Specify how Formatters should behave below ↓
        -- --------------------------------------------
        formatters = {
            stylua = {
                args = { "--indent-width", "4", "--indent-type", "Spaces", "-" },
            },

            -- --------------------------
            -- NOTE: For Work (Aug 2025):
            -- If you ever switch to `PHP 8.4`
            -- or need to ignore version mismatch, uncomment the code below ↓
            -- --------------------------------------------------------------
            -- php_cs_fixer = {
            --     env = {
            --         PHP_CS_FIXER_IGNORE_ENV = "1",
            --     },
            -- },
            -- --------------------------------------
        },
    },
}
