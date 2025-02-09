return {
    "saghen/blink.cmp",
    build = "cargo build --release",
    opts = {
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },
    },
    config = function()
        local cmp = require("blink.cmp")

        cmp.setup({
            keymap = {
                ['<Tab>'] = { 'accept', 'fallback' },
            },
        })
    end
}
