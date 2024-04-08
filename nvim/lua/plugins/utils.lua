return {
    {
        "rainbowhxch/accelerated-jk.nvim",
        keys = {
            { "j", "<Plug>(accelerated_jk_gj)" },
            { "k", "<Plug>(accelerated_jk_gk)" },
        },
    },
    {
        "folke/persistence.nvim",
        keys = {
            { "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]] },
            { "<leader>ql", [[<cmd>lua require("persistence").load({ last = true})<cr>]] },
            { "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]] },
        }
    },
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = true,
        opts = {
            enable_check_bracket_line = false,
        },
    },
    {
        "ethanholz/nvim-lastplace",
        config = true,
    },
    {
        "folke/flash.nvim",
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "o", "x" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Flash Treesitter Search",
            },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
        },
        config = true
    },
    {
        "kamykn/spelunker.vim",
        event = "VeryLazy",
        config = function()
            vim.g.spelunker_check_type = 2
        end
    },
    {
        "ellisonleao/glow.nvim",
        config = true,
        cmd = "Glow",
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Open the neo-tree", mode = { "n", "v" } }
        },
        config = function ()
            require("neo-tree").setup({
                source_selector = {
                    winbar = true, -- toggle to show selector on winbar
                    statusline = false, -- toggle to show selector on statusline
                    show_scrolled_off_parent_node = false,                    -- boolean
                    sources = {                                               -- table
                        {
                            source = "filesystem",                                -- string
                            display_name = "   󰉓 Files "                            -- string | nil
                        },
                        {
                            source = "buffers",                                   -- string
                            display_name = " 󰈚 Buffers "                          -- string | nil
                        },
                        {
                            source = "git_status",                                -- string
                            display_name = " 󰊢 Git "                              -- string | nil
                        },
                    },
                    content_layout = "center",                                 -- string
                    tabs_layout = "equal",                                    -- string
                    truncation_character = "…",                               -- string
                    tabs_min_width = nil,                                     -- int | nil
                    tabs_max_width = nil,                                     -- int | nil
                    padding = 0,                                              -- int | { left: int, right: int }
                    separator = { left = "▏", right= "▕" },                   -- string | { left: string, right: string, override: string | nil }
                    separator_active = nil,                                   -- string | { left: string, right: string, override: string | nil } | nil
                    show_separator_on_edge = false,                           -- boolean
                    highlight_tab = "NeoTreeCursorLine",                     -- string
                    highlight_tab_active = "NeoTreeGitDeleted",                -- string
                    highlight_background = "NeoTreeCursorLine",              -- string
                    highlight_separator = "NeoTreeCursorLine",      -- string
                    highlight_separator_active = "NeoTreeGitAdded", -- string
                },
                event_handlers = {
                    {
                        event = "after_render",
                        handler = function(state)
                            if state.current_position == "left" or state.current_position == "right" then
                                vim.api.nvim_win_call(state.winid, function()
                                    local str = require("neo-tree.ui.selector").get()
                                    if str then
                                        _G.__cached_neo_tree_selector = str
                                    end
                                end)
                            end
                        end,
                    },
                },
            })
        end
    },
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        after = "catppuccin",
        config = function()
            _G.__cached_neo_tree_selector = nil
            _G.__get_selector = function()
                return _G.__cached_neo_tree_selector
            end
            require("bufferline").setup({
                highlights = require("catppuccin.groups.integrations.bufferline").get(),
                options = {
                    offsets = {
                        {
                            filetype = "neo-tree",
                            raw = " %{%v:lua.__get_selector()%} ",
                            highlight = { sep = { link = "WinSeparator" } },
                            --                        separator = "┃",
                            text = "File Explorer"
                        },
                    },
                    indicator = {
                        style = 'icon'
                    },
                },
            })
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        'echasnovski/mini.ai',
        event = "VeryLazy",
        config = true,
    },
    {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        config = true,
    },
    {
        "s1n7ax/nvim-window-picker",
        opts = {
            filter_rules = {
                include_current_win = true,
                bo = {
                    filetype = { "fidget", "neo-tree" }
                }
            }
        },
        keys = {
            {
                "<c-w>p",
                function()
                    local window_number = require('window-picker').pick_window()
                    if window_number then vim.api.nvim_set_current_win(window_number) end
                end,
            }
        }
    },
}
