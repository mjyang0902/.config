return {
    {
        "rhysd/accelerated-jk",
        config = function()
            vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)")
            vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)")
        end,
    },
    {
        "folke/persistence.nvim",
        config = function()
            require("persistence").setup()
            vim.keymap.set("n","<leader>qs", [[<cmd>lua require("persistence").load()<cr>]])
            vim.keymap.set("n","<leader>ql", [[<cmd>lua require("persistence").load({ last = true})<cr>]])
            vim.keymap.set("n","<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]])
        end
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
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
        config = function()
            require("flash").setup()
            vim.keymap.set({"n","x","o"},"s",
                function()
                    require("flash").jump({
                        search = {
                            mode = function(str)
                                return "\\<" .. str
                            end,
                        },
                    })
                end
            )
            vim.keymap.set({"n","x","o"},"S",
                function()
                    require("flash").treesitter()
                end
            )
            vim.keymap.set({"o"},"r",
                function()
                    require("flash").remote()
                end
            )
            vim.keymap.set({"o","x"},"R",
                function()
                    require("flash").treesitter_search()
                end
            )
        end,
    },
    {
        "kamykn/spelunker.vim",
        config = function()
            vim.g.spelunker_check_type = 2
        end
    },
    {
        "ellisonleao/glow.nvim",
        config = true,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
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
                }
            })
            vim.keymap.set({"n", "v"},"<leader>e",[[<cmd>Neotree toggle<CR>]])
        end
    },
    {
        "akinsho/bufferline.nvim",
        config = function()
            _G.__cached_neo_tree_selector = nil
            _G.__get_selector = function()
                return _G.__cached_neo_tree_selector
            end
            require("bufferline").setup({
                options = {
                    offsets = {
                        {
                            filetype = "neo-tree",
                            raw = " %{%v:lua.__get_selector()%} ",
                            highlight = { sep = { link = "WinSeparator" } },
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
        config = true,
    },
    {
        'echasnovski/mini.ai',
        config = true,
    },
    {
        "echasnovski/mini.comment",
        config = true,
    },
    {
        "s1n7ax/nvim-window-picker",
        config = function()
            require("window-picker").setup({
                filter_rules = {
                    include_current_win = true,
                    bo = {
                        filetype = { "fidget", "neo-tree" }
                    }
                }
            })
            vim.keymap.set("n",
                "<c-w>p",
                function()
                    local window_number = require('window-picker').pick_window()
                    if window_number then vim.api.nvim_set_current_win(window_number) end
                end
            )
        end
    },
}
