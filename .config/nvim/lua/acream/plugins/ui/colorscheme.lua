return {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    config = function()
        vim.g.zenbones_darken_comments = 45
        vim.cmd.colorscheme("zenbones")
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "FloatTitle", { bg = "NONE", ctermbg = "NONE" })
    end
}
