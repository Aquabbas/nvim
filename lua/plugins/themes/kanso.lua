return {
    -- https://github.com/webhooked/kanso.nvim
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = {},
        typeStyle = {},
        disableItalics = false,
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        colors = {
            palette = {
                yellow3 = "#9EADC8", --> For Dark Kanso
                pearlYellow2 = "#9EADC8", --> For Light Kanso
            },
            theme = {
                -- change specific usages for a certain theme, or for all of them
                zen = {
                    ui = {
                        float = {
                            bg = "none",
                        },
                    },
                },
                ink = {
                    syn = {
                        -- parameter = "#9EADC8",
                    },
                },
                all = {
                    ui = {
                        -- cursor_line_nr_active_foreground = "#C4746E",
                    },
                },
            },
        },

        -- overrides = function(colors)
        --     return {}
        -- end,

        theme = "zen",
        background = {
            dark = "zen",
            light = "pearl",
        },
    },
}
