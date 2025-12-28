return {
    "neovim/nvim-lspconfig",
    opts = {
        -- ---------------------------------------------------------
        -- Configure LSPs that LazyVim has NOT configured by default
        -- ---------------------------------------------------------
        servers = {
            bashls = {
                filetypes = { "sh", "zsh" },
            },
            marksman = {
                enabled = false,
            },

            -- I don't remember why I wrote the specification below
            -- But I'm keeping it, just in case
            intelephense = {
                files = {
                    maxSize = 1000000,
                },
            },
            -- ---------------------------------------------------------------------------
            -- https://writewithharper.com/docs/integrations/neovim#Optional-Configuration
            -- ---------------------------------------------------------------------------
            harper_ls = {
                enabled = false,
            },
        },
    },
}
