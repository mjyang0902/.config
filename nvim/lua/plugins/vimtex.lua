return {
    "lervag/vimtex",
    ft = 'tex',
    dependencies = {
        "KeitaNakamura/tex-conceal.vim",
    },
    init = function()

        vim.g.tex_flavor = 'latex' 

        -- use zathura as the default pdf reviewer
        vim.g.vimtex_view_general_viewer = 'zathura'
--        vim.g.vimtex_view_method = 'zathura'

        -- show the compiler hint
        vim.g.vimtex_compiler_progname = 'nvr'
        vim.g.vimtex_quick_mode = 0 
        
        -- hide the last two lines
        -- set conceallevel = 1
        vim.g.tex_conceal = 'abdmg'
    end,
}
