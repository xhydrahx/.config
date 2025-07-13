return {
    "saghen/blink.cmp",
    dependencies = {
        "L3MON4D3/LuaSnip",
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
                    window = { border = "none" },
                },
                menu = {
                    auto_show = true,
                    border = "none",
                    draw = {
                        columns = {
                            { "label",      "label_description", gap = 1 },
                            { "source_name" },
                        },
                    },
                },
            },
            keymap = {
                preset = "super-tab",
                ["<Tab>"] = { "accept", "fallback" },
            },
            cmdline = {
                enabled = true,
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                providers = {
                    lsp = {
                        fallbacks = { "buffer" },
                    },
                    buffer = {
                        opts = {},
                    },
                },
            },
        }
        require("blink.cmp").setup(opts)
    end,
}
