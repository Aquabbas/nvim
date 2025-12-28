-- ----------------------------------
-- NOTE: Modify the code below if you want:
-- LSPs, DAPs, Linters, Formatters that LazyVim does install by default
-- --------------------------------------------------------------------
-- Check LazyVim Defaults: https://www.lazyvim.org/extras/lang/angular
-- -------------------------------------------------------------------
-- Mason Installations:
-- --------------------
return {
    "mason-org/mason.nvim", -- Updated path
    -- version = "1.11.0", -- Pinned to last v1.x release
    opts = {
        ensure_installed = {
            -- ------------------------------------------------------------------------------------------------------------

            -- ---
            -- PHP
            -- ---
            "intelephense", --> LSP
            "php-debug-adapter", --> DAP
            "phpstan", --> Linter

            -- ------------------------------------------------------
            -- ↓ From the Laravel Team, so it's gotta be good, right?
            -- ------------------------------------------------------
            -- "pint", --> Formatter,
            -------------------------

            -- ----------------------------------------------
            -- "php-cs-fixer", --> Formatter, LazyVim Default
            -- ----------------------------------------------
            -- "phpcs", --> Linter, LazyVim Default
            -- ------------------------------------

            -- ------------------------------------------------------------------------------------------------------------

            -- ---------
            -- Org Files
            -- ---------
            -- "textlsp",

            -- --------
            -- Markdown
            -- --------
            "markdown-oxide", --> LSP
            "harper-ls", --> Offline-first LSP for English grammar
            -- "proselint", --> Linter

            -- ------------------------------------------------------------------------------------------------------------

            -- ---------------------
            -- TypeScript/JavaScript
            -- ---------------------
            "prettier", --> Formatter
            "prettierd", --> Formatter (Daemon Process)

            -- ------------------------------------------------------------------------------------------------------------

            -- -------------
            -- Zsh, Bash, Sh
            -- -------------
            "bash-language-server", --> LSP
            -- "shellcheck", --> Linter, LazyVim Default
            -- "shfmt", --> Formatter, LazyVim Default, for `Bash` And `Sh`, NOT `Zsh`

            -- ----------------------------------------------------------------
            -- I can't find a working Formatter for `Zsh`, so I give up for now
            -- (╯°□°）╯︵ ┻━┻
            -- ----------------------------------------------------------------

            -- ------------------------------------------------------------------------------------------------------------

            -- ---
            -- SQL
            -- ---
            "sleek",

            -- ------------------------------------------------------------------------------------------------------------

            -- ---
            -- Git
            -- ---
            "commitlint", --> Linter for Conventional Commits
            "gitui", --> TUI

            -- ------------------------------------------------------------------------------------------------------------
        },
    },
}
