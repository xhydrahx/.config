return {
    "neovim/nvim-lspconfig",
    config = function()
        local capabilities = require("blink-cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

        ---@diagnostic disable-next-line: unused-local
        local on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true }
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

            buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
            buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
            buf_set_keymap("n", "<leader>i", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
            buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
            buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
            buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
            buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
            buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts)
        end

        require("acream.plugins.coding.lsp.rust").setup(on_attach, capabilities)
        require("acream.plugins.coding.lsp.lua").setup(on_attach, capabilities)
    end,
}
