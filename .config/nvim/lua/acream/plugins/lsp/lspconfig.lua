return {
    'neovim/nvim-lspconfig',
    config = function()
        local has_mason, mason = pcall(require, "mason")
        if not has_mason then
            vim.notify("mason.nvim not found!")
            return
        end


        local has_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
        if not has_mason_lsp then
            vim.notify("mason-lspconfig.nvim not found!")
            return
        end

        local has_lspconfig, lspconfig = pcall(require, "lspconfig")
        if not has_lspconfig then
            vim.notify("nvim-lspconfig not found!")
            return
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()

        local has_blink, blink_cmp = pcall(require, "blink.cmp")
        if has_blink and blink_cmp.get_lsp_capabilities then
            capabilities = blink_cmp.get_lsp_capabilities(capabilities)
        end

        capabilities.textDocument.completion.completionItem.snippetSupport = true

        capabilities.textDocument.formatting = true
        capabilities.textDocument.rangeFormatting = true
        capabilities.textDocument.documentOnTypeFormatting = {
            firstTriggerCharacter = "\n",
            moreTriggerCharacter = { ";" },
        }

        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = { "lua_ls" },
            automatic_installation = true,
        })

        local function format_buffer(bufnr)
            vim.lsp.buf.format({
                async = true,
                bufnr = bufnr or vim.api.nvim_get_current_buf(),
            })
        end

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                    on_attach = function(client, bufnr)
                        -- Define buffer-local mappings
                        local opts = { noremap = true, silent = true }
                        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

                        buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
                        buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
                        buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
                        buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
                        buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
                        buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

                        buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts)

                        vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
                            format_buffer(bufnr)
                        end, { desc = "Format current buffer with LSP" })

                        vim.api.nvim_buf_create_user_command(bufnr, "FormatRange", function(opts)
                            vim.lsp.buf.range_formatting({}, opts.line1, opts.line2)
                        end, { desc = "Format a range with LSP", range = true })

                        -- Notify if the server supports formatting
                        if client.server_capabilities.documentFormattingProvider then
                            vim.notify("LSP server " .. server_name .. " supports formatting.")
                        end
                    end,
                    flags = {
                        debounce_text_changes = 150,
                    },
                })
            end,
        })
    end,
}
