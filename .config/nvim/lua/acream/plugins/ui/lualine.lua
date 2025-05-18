return {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require('lualine').setup({
            options = {
                globalstatus = true,
                theme = "auto",
                icons_enabled = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = {
                    'mode',
                },
                lualine_b = {
                    'filename',
                    'diagnostics',
                },
                lualine_c = {},
                lualine_x = {},
                lualine_y = { "branch" },
                lualine_z = {
                    'progress',
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            extensions = {},
        })
    end,
}
