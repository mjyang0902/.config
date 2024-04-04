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
            vim.cmd.colorscheme "catppuccin-macchiato"
            require('lualine').setup({
                options = {
                    theme = "catppuccin"
                    -- ... the rest of your lualine config
                }
            })
            require("barbecue").setup {
                theme = "catppuccin-macchiato",
            }
            neotree = false
        end
    }
}
