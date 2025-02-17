return {
    "williamboman/mason.nvim",
    dependencies = "williamboman/mason-lspconfig.nvim",
    config = function()
        local mason = require('mason-lspconfig')
        require('mason').setup()
        mason.setup({ ensure_installed = { "lua_ls" } })
    end
}
