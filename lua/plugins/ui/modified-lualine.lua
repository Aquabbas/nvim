return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local function lsp_names()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            if not clients or #clients == 0 then
                return "No Active LSP"
            end
            local client_names = {}
            for _, client in ipairs(clients) do
                table.insert(client_names, client.name)
            end
            return table.concat(client_names, ", ")
        end

        local mode_map = {
            ["NORMAL"] = "N",
            ["O-PENDING"] = "N?",
            ["INSERT"] = "I",
            ["VISUAL"] = "V",
            ["V-BLOCK"] = "VB",
            ["V-LINE"] = "VL",
            ["V-REPLACE"] = "VR",
            ["REPLACE"] = "R",
            ["COMMAND"] = "!",
            ["SHELL"] = "SH",
            ["TERMINAL"] = "T",
            ["EX"] = "X",
            ["S-BLOCK"] = "SB",
            ["S-LINE"] = "SL",
            ["SELECT"] = "S",
            ["CONFIRM"] = "Y?",
            ["MORE"] = "M",
        }

        local wordCount = {}
        function wordCount.getWords()
            if
                vim.bo.filetype == "md"
                or vim.bo.filetype == "txt"
                or vim.bo.filetype == "markdown"
            then
                if vim.fn.wordcount().visual_words == 1 then
                    return tostring(vim.fn.wordcount().visual_words) .. " word"
                elseif not (vim.fn.wordcount().visual_words == nil) then
                    return tostring(vim.fn.wordcount().visual_words) .. " words"
                else
                    return tostring(vim.fn.wordcount().words) .. " words"
                end
            else
                return "Not a text file"
            end
        end

        local function place()
            local colPre = "C:"
            local col = "%c"
            local linePre = " L:"
            local line = "%l/%L"
            return string.format("%s%s%s%s", colPre, col, linePre, line)
        end

        local function diff_source()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
                return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                }
            end
        end

        local function window()
            return vim.api.nvim_win_get_number(0)
        end

        local function show_macro_recording()
            local recording_register = vim.fn.reg_recording()
            if recording_register == "" then
                return ""
            else
                return "󰑋  " .. recording_register
            end
        end

        -- Determine the background and foreground colors to match Neovim's Normal highlight
        local normal_hl_group = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
        local desired_bg_color = "#000000" -- Default black background
        local desired_fg_color = "#c5c8c6" -- Default soft white/light grey foreground

        if normal_hl_group then
            if
                normal_hl_group.bg
                and type(normal_hl_group.bg) == "number"
                and normal_hl_group.bg >= 0
            then
                desired_bg_color = string.format("#%06x", normal_hl_group.bg)
            end
            if
                normal_hl_group.fg
                and type(normal_hl_group.fg) == "number"
                and normal_hl_group.fg >= 0
            then
                desired_fg_color = string.format("#%06x", normal_hl_group.fg)
            end
        end

        require("lualine").setup({
            options = {
                icons_enabled = true,
                component_separators = { " ", " " },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {},
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = function(s)
                            return mode_map[s] or s
                        end,
                        color = { bg = desired_bg_color, fg = desired_fg_color }, -- MODIFIED
                    },
                },
                lualine_b = {
                    -- { "branch", icon = "󰘬" },
                    {
                        "diff",
                        colored = true,
                        source = diff_source,
                        diff_color = {
                            color_added = "#a7c080",
                            color_modified = "#ffdf1b",
                            color_removed = "#ff6666",
                        },
                    },
                },
                lualine_c = {
                    { "diagnostics", sources = { "nvim_diagnostic" } },
                    function()
                        return "%="
                    end,
                    {
                        "filename",
                        file_status = true,
                        path = 1,
                        shorting_target = 40,
                        symbols = {
                            modified = "󰐖",
                            readonly = "",
                            unnamed = "[No Name]",
                            newfile = "[New]",
                        },
                    },
                    {
                        wordCount.getWords,
                        color = { fg = "#333333", bg = "#eeeeee" },
                        separator = { left = "", right = "" },
                        cond = function()
                            return wordCount.getWords() ~= "Not a text file"
                        end,
                    },
                    { "searchcount" },
                    { "selectioncount" },
                    {
                        show_macro_recording,
                        color = { fg = "#333333", bg = "#ff6666" },
                        separator = { left = "", right = "" },
                    },
                },
                lualine_x = {
                    { lsp_names },
                },
                lualine_y = { nil },
                lualine_z = {
                    {
                        place,
                        padding = { left = 1, right = 1 },
                        color = { bg = desired_bg_color, fg = desired_fg_color }, -- MODIFIED
                    },
                },
            },
            inactive_sections = {
                lualine_a = { { window, color = { fg = "#26ffbb", bg = "#282828" } } },
                lualine_b = {
                    {
                        "diff",
                        source = diff_source,
                        diff_color = {
                            color_added = "#a7c080",
                            color_modified = "#ffdf1b",
                            color_removed = "#ff6666",
                        },
                    },
                },
                lualine_c = {
                    function()
                        return "%="
                    end,
                    {
                        "filename",
                        path = 1,
                        shorting_target = 40,
                        symbols = {
                            modified = "󰐖",
                            readonly = "",
                            unnamed = "[No Name]",
                            newfile = "[New]",
                        },
                    },
                },
                lualine_x = {
                    {
                        place,
                        padding = { left = 1, right = 1 },
                        color = { bg = desired_bg_color, fg = desired_fg_color },
                    }, -- MODIFIED for inactive
                },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = {
                "quickfix",
                "oil",
                "fzf",
                "trouble",
                "mason",
                "nvim-dap-ui",
                "lazy",
            },
        })

        local lualine = require("lualine")
        vim.api.nvim_create_autocmd("RecordingEnter", {
            callback = function()
                lualine.refresh()
            end,
        })

        vim.api.nvim_create_autocmd("RecordingLeave", {
            callback = function()
                local timer = vim.uv.new_timer()
                if timer then
                    timer:start(
                        50,
                        0,
                        vim.schedule_wrap(function()
                            lualine.refresh()
                            if timer and not timer:is_closing() then
                                timer:close()
                            end
                        end)
                    )
                else
                    vim.notify("Failed to create timer for lualine refresh", vim.log.levels.ERROR)
                end
            end,
        })
    end,
}
