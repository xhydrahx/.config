return {
    "saghen/blink.cmp",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "onsails/lspkind.nvim",
    },
    version = false,
    build = "cargo build --release",
    config = function()
        local opts = {
            snippets = {
                preset = "luasnip",
            },
            signature = { enabled = true },
            completion = {
                accept = { auto_brackets = { enabled = true } },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 250,
                    treesitter_highlighting = true,
                    window = { border = "none" },
                },
                list = {
                    selection = { preselect = false, auto_insert = true },
                },
                menu = {
                    auto_show = true,
                    border = "none",
                    draw = {
                        columns = {
                            { "kind_icon" },
                            { "label",      "label_description", gap = 1 },
                            { "source_name" },
                        },
                        components = {
                            kind_icon = {
                                text = function(item)
                                    local kind = require("lspkind").symbol_map[item.kind] or ""
                                    return " " .. kind .. " "
                                end,
                            },
                            label = {
                                text = function(item)
                                    return item.label
                                end,
                            },
                            kind = {
                                text = function(item)
                                    return item.kind
                                end,
                            },
                            source_name = {
                                width = { max = 10 },
                                text = function(ctx)
                                    return "[" .. ctx.source_name .. "]"
                                end,
                            },
                        },
                    },
                },
                ghost_text = { enabled = true },
            },
            keymap = {
                preset = "super-tab",
                ["<CR>"] = { "accept", "fallback" },
                ["<Tab>"] = {
                    function(cmp)
                        return cmp.select_next()
                    end,
                    "snippet_forward",
                    "fallback",
                },
                ["<S-Tab>"] = {
                    function(cmp)
                        return cmp.select_prev()
                    end,
                    "snippet_backward",
                    "fallback",
                },
            },
            cmdline = {
                enabled = true,
                keymap = {
                    preset = "cmdline",
                    ["<Tab>"] = {
                        function(cmp)
                            return cmp.select_next()
                        end,
                        "snippet_forward",
                        "fallback",
                    },
                    ["<S-Tab>"] = {
                        function(cmp)
                            return cmp.select_prev()
                        end,
                        "snippet_backward",
                        "fallback",
                    },
                },
                completion = {
                    ghost_text = {
                        enabled = true,
                    },
                    trigger = {
                        show_on_blocked_trigger_characters = {},
                        show_on_x_blocked_trigger_characters = nil,
                    },
                    menu = {
                        auto_show = function(ctx)
                            return vim.fn.getcmdtype() == ":"
                        end,
                        draw = {
                            columns = {
                                { "kind_icon" },
                                { "label",    "label_description", gap = 1 },
                            },
                        },
                    },
                },
            },
            term = {
                enabled = true,
                keymap = nil,
                sources = {},
                completion = {
                    trigger = {
                        show_on_blocked_trigger_characters = {},
                        show_on_x_blocked_trigger_characters = nil,
                    },
                    menu = {
                        auto_show = nil,
                        draw = {
                            columns = { { "label", "label_description", gap = 1 } },
                        },
                    },
                },
            },
            appearance = {
                nerd_font_variant = "mono",
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer", "lazydev" },
                per_filetype = {
                    { markdown = { "snippets", "buffer", "spell" } },
                    { asciidoc = { "snippets", "buffer", "spell" } },
                    { ledger = { "hledger", "snippets" } },
                    { yaml = { "lsp", "snippets" } },
                },
                providers = {
                    lsp = {
                        fallbacks = { "buffer" },
                    },
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                    },
                    buffer = {
                        opts = {},
                    },
                    spell = {
                        name = "spell",
                        module = "blink-cmp-spell",
                        score_offset = 3,
                        max_items = 10,
                        opts = {
                            enable_in_context = function()
                                local cursor = vim.api.nvim_win_get_cursor(0)
                                local captures = vim.treesitter.get_captures_at_pos(0, cursor[1] - 1, cursor[2] - 1)
                                local in_spell_capture = false
                                for _, capture in ipairs(captures) do
                                    if capture.capture == "spell" then
                                        in_spell_capture = true
                                    elseif capture.capture == "nospell" then
                                        return false
                                    end
                                end
                                return in_spell_capture
                            end,
                        },
                    },
                    hledger = {
                        name = "hledger",
                        module = "blink.compat.source",
                        score_offset = 3,
                        opts = {},
                    },
                },
            },
        }
        require("blink.cmp").setup(opts)
    end,
}
