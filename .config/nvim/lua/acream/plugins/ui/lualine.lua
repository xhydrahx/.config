return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local common_fg = "#AFA099"
        local inactive_bg = "#272321"
        local inactive_fg = "#CAD0D4"

        local zenbones = {
              normal = {
                    a = { bg = "#59514D", fg = common_fg, gui = "bold" },
                    b = { bg = "#433C39", fg = common_fg },
                    c = { bg = inactive_bg, fg = "#B4BDC3" },
                  },

              insert = {
                    a = { bg = "#324757", fg = common_fg, gui = "bold" },
                  },

              command = {
                    a = { bg = "#65435E", fg = common_fg, gui = "bold" },
                  },

              visual = {
                    a = { bg = "#3D4042", fg = common_fg, gui = "bold" },
                  },

              replace = {
                    a = { bg = "#3E2225", fg = common_fg, gui = "bold" },
                  },

              inactive = {
                    a = { bg = inactive_bg, fg = inactive_fg, gui = "bold" },
                    b = { bg = inactive_bg, fg = inactive_fg },
                    c = { bg = inactive_bg, fg = inactive_fg },
                  },
        }
        require('lualine').setup({
            options = {
                globalstatus = true,
                theme = zenbones,
                icons_enabled = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        fmt = function(str)
                            local mode_map = {
                                ['NORMAL'] = ' NORMAL',
                                ['INSERT'] = ' INSERT',
                                ['VISUAL'] = '󰒅 VISUAL',
                                ['V-LINE'] = '󰕷 V-LINE',
                                ['V-BLOCK'] = '󰝤 V-BLOCK',
                                ['REPLACE'] = '󰑌 REPLACE',
                                ['COMMAND'] = ' COMMAND',
                                ['TERMINAL'] = ' TERMINAL',
                            }
                            return mode_map[str] or str
                        end,
                    }
                },
                lualine_b = {
                    {
                        'filename',
                        path = 0,
                        symbols = {
                            modified = '●',
                            readonly = '●',
                            unnamed = '[No Name]',
                        },
                        fmt = function(str)
                            local icon = require('nvim-web-devicons').get_icon(vim.fn.expand('%:t'), vim.fn.expand('%:e'),
                                { default = true })
                            return icon .. ' ' .. str
                        end,
                    },
                    {
                        'diagnostics',
                        sources = { 'nvim_lsp' },
                        sections = { 'error', 'warn', 'info', 'hint' },
                        diagnostics_color = {
                            error = { fg = '#dc322f' },
                            warn = { fg = '#b58900' },
                            info = { fg = '#268bd2' },
                            hint = { fg = '#2aa198' },
                        },
                    },
                },
                lualine_c = {},
                lualine_x = {},
                lualine_y = { "branch" },
                lualine_z = {
                    {
                        'progress',
                        fmt = function(str)
                            return ' ' .. str
                        end,
                    }
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
