local filetypes = { "markdown", "Avante" }

return {
    {
        -- -------------------------------------------
        -- Plugin Configuration `obsidian.nvim`
        -- -------------------------------------------
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
            "nvim-telescope/telescope.nvim",
        },

        -- -----------------------------------------------------------------------------------
        -- NOTE: This loads obsidian.nvim only on markdown files in your vault, supposedly ...
        -- -----------------------------------------------------------------------------------
        event = {
            "BufReadPre " .. vim.fn.expand("~") .. "/Obsidian/Notes/*.md",
            "BufNewFile " .. vim.fn.expand("~") .. "/Obsidian/Notes/*.md",
        },

        config = function()
            require("obsidian").setup({
                workspaces = {
                    {
                        -- -------------------------------------------------------------------------
                        -- NOTE: Adjust directory `name` and `path` according to your Obsidian setup
                        -- -------------------------------------------------------------------------
                        name = "Notes",
                        path = function()
                            if vim.fn.has("win32") == 1 or os.getenv("WSL_DISTRO_NAME") then
                                -- NOTE: Update this path to match your Windows username
                                return "/mnt/c/Users/YOUR_USERNAME/Obsidian/Notes"
                            else
                                return vim.fn.expand("~") .. "/Obsidian/Notes"
                            end
                        end,
                    },
                },

                -- ---------------------------------------------------
                -- NOTE: Uncomment if you want to toggle `daily_notes`
                -- ---------------------------------------------------
                daily_notes = {
                    folder = "5-daily-notes",
                    default_tags = { "daily-notes" },
                    date_format = "%Y-%m-%d-%a",
                    alias_format = "%A, %B %-d, %Y",
                    -- template = "template-files.md",
                },

                templates = {
                    folder = "6-templates",
                    date_format = "%Y-%m-%d-%a",
                    time_format = "%H:%M",
                },

                ---@diagnostic disable-next-line: missing-fields
                attachments = {
                    img_folder = "3-resources/attachments",
                },

                ---@diagnostic disable-next-line: missing-fields
                picker = {
                    name = "telescope.nvim",
                },

                -- --------------------------------------------------------
                -- I can't get `completion` to work. Pausing on it, for now
                -- --------------------------------------------------------
                -- completion = {
                --     nvim_cmp = true,
                --     min_chars = 2,
                -- },

                sort_by = "modified",
                sort_reversed = true,

                -- -------------------------------
                -- Obsidian Keymaps (smart_action)
                -- -------------------------------
                mappings = {
                    ["<cr>"] = {
                        action = function()
                            return require("obsidian").util.smart_action()
                        end,
                        opts = { buffer = true, expr = true },
                    },
                    ["<leader>oc"] = {
                        action = function()
                            return require("obsidian").util.toggle_checkbox()
                        end,
                        opts = { buffer = true },
                    },
                    ["gf"] = {
                        action = function()
                            return require("obsidian").util.gf_passthrough()
                        end,
                        opts = { noremap = false, expr = true, buffer = true },
                    },
                },
            })

            -- -------------------
            -- Finding & Searching
            -- -------------------
            vim.keymap.set(
                "n",
                "<leader>oq",
                "<cmd>ObsidianQuickSwitch<CR>",
                { desc = "Quick Switch" }
            )
            vim.keymap.set(
                "n",
                "<leader>os",
                "<cmd>ObsidianSearch<CR>",
                { desc = "Search Obsidian" }
            )
            vim.keymap.set("n", "<leader>og", "<cmd>ObsidianTags<CR>", { desc = "Search Tags" })

            -- ---------------
            -- Note Management
            -- ---------------
            vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
            vim.keymap.set("n", "<leader>or", "<cmd>ObsidianRename<CR>", { desc = "Rename Note" })
            vim.keymap.set(
                "n",
                "<leader>od",
                "<cmd>ObsidianToday<CR>",
                { desc = "Today's Daily Note" }
            )
            vim.keymap.set(
                "n",
                "<leader>ot",
                "<cmd>ObsidianTemplate<CR>",
                { desc = "Insert Obsidian Template" }
            )
            vim.keymap.set(
                "n",
                "<leader>oT",
                "<cmd>ObsidianNewFromTemplate<CR>",
                { desc = "New Note from Template" }
            )

            -- ------------------
            -- Navigation & Links
            -- ------------------
            vim.keymap.set(
                "n",
                "<leader>ob",
                "<cmd>ObsidianBacklinks<CR>",
                { desc = "Show ObsidianBacklinks" }
            )
            vim.keymap.set(
                "n",
                "<leader>ol",
                "<cmd>ObsidianLinks<CR>",
                { desc = "Show ObsidianLinks" }
            )
            vim.keymap.set(
                "n",
                "<leader>oC",
                "<cmd>ObsidianTOC<CR>",
                { desc = "Show Table of Contents" }
            )

            -- -------------------------
            -- Editing & App Integration
            -- -------------------------
            vim.keymap.set(
                "n",
                "<leader>om",
                "i[]()<Esc>hhi",
                { desc = "Insert markdown link format" }
            )
            vim.keymap.set("n", "<leader>op", "<cmd>ObsidianPasteImg<CR>", { desc = "Paste Image" })
            vim.keymap.set(
                "n",
                "<leader>oo",
                "<cmd>ObsidianOpen<CR>",
                { desc = "Open in Obsidian App" }
            )
        end,
    },
    {
        -- -------------------------------------------
        -- Plugin Configuration `render-markdown.nvim`
        -- -------------------------------------------
        "MeanderingProgrammer/render-markdown.nvim",
        ft = filetypes,
        opts = {
            file_types = filetypes,
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
            "epwalsh/obsidian.nvim",
        },

        config = function()
            require("obsidian").get_client().opts.ui.enable = false
            vim.api.nvim_buf_clear_namespace(0, vim.api.nvim_get_namespaces()["ObsidianUI"], 0, -1)
            require("render-markdown").setup({
                -- heading = {
                --     enabled = false,
                -- },
            })
        end,
    },
}
