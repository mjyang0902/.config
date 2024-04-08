return {
    -- {
    --    "folke/tokyonight.nvim",
    --    dependencies = {
    --        "nvim-lualine/lualine.nvim",
    --        "nvim-tree/nvim-web-devicons",
    --        "utilyre/barbecue.nvim",
    --        "SmiteshP/nvim-navic",
    --    },
    --    config = function()
    --        vim.cmd[[colorscheme tokyonight-storm]]
    --        require('lualine').setup({
    --            options = {
    --                theme = 'tokyonight'
    --            },
    --        })
    --        require('barbecue').setup {
    --            theme = 'tokyonight',
    --        }
    --    end
    -- },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        dependencies = {
            "nvim-lualine/lualine.nvim",
            "nvim-tree/nvim-web-devicons",
            "utilyre/barbecue.nvim",
            "SmiteshP/nvim-navic",
        },
        config = function()
            require("catppuccin").setup({
                integrations = {
                    cmp = true,
                    neotree = true,
                    indent_blankline = {
                        enabled = true,
                        scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
                        colored_indent_levels = false,
                    },
                    lsp_saga = true,
                    mason = true,
                    mini = {
                        enabled = true,
                        indentscope_color = "", -- catppuccin color (eg. `lavender`) Default: text
                    },
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                        },
                        inlay_hints = {
                            background = true,
                        },
                    },
                }
            })
            vim.cmd.colorscheme "catppuccin-macchiato"
            require('lualine').setup({
                options = {
                    theme = "catppuccin"
                    -- ... the rest of your lualine config
                }
            })vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

            require("barbecue").setup {
                theme = "catppuccin-macchiato",
            }
        end
    }
}
