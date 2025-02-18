return {
    "yetone/avante.nvim",
    dependencies = {
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
        {
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
    event = "VeryLazy",
    lazy = false,
    version = false,
    build = "make",
    opts = {
        provider = "copilot",
    },
}
