-- ----------------------------------------
-- NOTE: Modify the code below if you want:
-- 1. Specific order of Linter priority
-- 2. Linters that LazyVim does NOT set up by default
-- --------------------------------------------------
-- Check LazyVim Defaults: https://www.lazyvim.org/extras/lang/angular
-- -------------------------------------------------------------------
-- Linters:
-- --------
return {
    "mfussenegger/nvim-lint",
    optional = true,

    opts = function(_, opts)
        local root_dir = require("lazyvim.util.root").get()

        -- ----------------------------------------------------
        -- NOTE: For Work (Aug 2025), `PHPStan` Customization ↓
        -- ----------------------------------------------------
        local lint_module = require("lint")

        if lint_module and lint_module.linters and lint_module.linters.phpstan then
            local phpstan_linter = lint_module.linters.phpstan

            -- Set cwd relative to the *detected project root*
            if root_dir then
                phpstan_linter.cwd = root_dir .. "/api"
            else
                vim.notify(
                    "nvim-lint override: Project root not found for PHPStan cwd.",
                    vim.log.levels.WARN
                )
                -- Consider if you want a default if root isn't found, e.g.:
                -- phpstan_linter.cwd = vim.fn.getcwd() -- might cause the error again
            end

            phpstan_linter.args = { "analyse", "--error-format=raw", "--no-progress" }
            phpstan_linter.stdin = false
        else
            vim.notify(
                "nvim-lint override: Could not find phpstan linter definition",
                vim.log.levels.WARN
            )
        end

        opts.linters_by_ft = opts.linters_by_ft or {}

        opts.linters_by_ft.php = { "phpstan" } --> For Work (Aug 2025)
        -- opts.linters_by_ft.php = { "phpcs" } --> LazyVim Default
        -- opts.linters_by_ft.php = {} --> Ignore all PHP Linters
        -- ----------------------------------------------------
        -- NOTE: For Work (Aug 2025), `PHPStan` Customization ↑
        -- ----------------------------------------------------

        -- -----------------
        -- Other Formatters:
        -- -----------------
        opts.linters_by_ft.markdown = { "markdownlint-cli2" }
        -- opts.linters_by_ft.markdown = { "proselint", "markdownlint-cli2" }

        opts.linters_by_ft.zsh = { "zsh" }
        -- opts.linters_by_ft.zsh = { "shellharden" }
        -- zsh = { "shellharden" },
        opts.linters_by_ft.bash = { "shellcheck" } --> LazyVim Default, I suspect, from what I've read in the LazyVim docs
        -- opts.linters_by_ft.sh = { "" } --> Hmmm, I'm not sure what Linter `sh` uses, so I'll just leave to to LazyVim, for now

        -- opts.linters_by_ft.sql = { "sqlfluff" } --> LazyVim Default
        opts.linters_by_ft.sql = { "" } --> Ignore all SQL Linters

        return opts
    end,
}
