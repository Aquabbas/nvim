return {
    {
        "folke/snacks.nvim",

        keys = {
            -- ----------------------------------
            -- `LazyVim` Default Keymap:
            -- ---------------------------------------------------------------------------------------------
            -- { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
            -- ---------------------------------------------------------------------------------------------
            -- Turn Off:
            -- ---------
            { "<leader>n", false },
            -- ---------------------------------------------------------------------------------------------

            -- ----------------
            -- Keymap Override:
            -- ---------------------------------------------------------------------------------------------
            {
                "<leader>N",
                function()
                    Snacks.picker.notifications()
                end,
                desc = "Notification History",
            },
            -- ---------------------------------------------------------------------------------------------
        },
        opts = {
            bigfile = { enabled = true },
            image = { enabled = true, backends = { "kitty" } },
            dashboard = {
                enabled = true,
                preset = {
                    -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
                    ---@type fun(cmd:string, opts:table)|nil
                    pick = nil,
                    -- Used by the `keys` section to show keymaps.
                    -- Set your custom keymaps here.
                    -- When using a function, the `items` argument are the default keymaps.
                    ---@type snacks.dashboard.Item[]
                    keys = {
                        {
                            -- hidden = true,
                            icon = " ",
                            key = "SPC SPC",
                            desc = "Find File",
                            action = ":lua Snacks.dashboard.pick('files')",
                        },
                        {
                            icon = " ",
                            key = "SPC fr",
                            desc = "Find Recent",
                            action = ":lua Snacks.dashboard.pick('oldfiles')",
                        },
                        {
                            icon = " ",
                            key = "SPC /",
                            desc = "Grep Search",
                            action = ":lua Snacks.dashboard.pick('live_grep')",
                        },
                        {
                            icon = "󰒲 ",
                            key = "l",
                            desc = "Lazy",
                            action = ":Lazy",
                        },
                        {
                            icon = "󰒲 ",
                            key = "e",
                            desc = "Lazy Extras",
                            action = ":LazyExtras",
                        },
                        {
                            icon = " ",
                            key = "m",
                            desc = "Mason",
                            action = ":Mason",
                        },
                        {
                            icon = " ",
                            key = "h",
                            desc = "Health",
                            action = ":checkhealth",
                        },
                        {
                            icon = " ",
                            key = "q",
                            desc = "Quit",
                            action = ":qa",
                        },
                    },
                    header = [[
AquaVim]],
                },
                sections = {
                    { section = "header" },
                    { section = "keys", gap = 1, padding = 1 },
                },
            },
        },
    },
}
