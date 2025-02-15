return {
    "zenbones-theme/zenbones.nvim",
    dependencies = {
        "rktjmp/lush.nvim"
    },
    config = function()
        vim.cmd.colorscheme("zenbones")
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    end
}
