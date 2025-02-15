local M = {}

function M.setup(on_attach, capabilities)
    return require("lspconfig").rust_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            ['rust-analyzer'] = {
                procMacro = {
                    enable = true
                },
                diagnostics = {
                    enable = true,
                    experimental = {
                        enable = true
                    },
                    enableExperimental = true,
                },
            }
        }
    })
end

return M
