local M = {}

function M.setup(on_attach, capabilities)
    return require("lspconfig").lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M
