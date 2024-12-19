vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%=%{v:relnum > 0 ? v:relnum : v:lnum} "

vim.api.nvim_create_augroup("SpecialBufferSettings", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
  group = "SpecialBufferSettings",
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.statuscolumn = ""
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = "SpecialBufferSettings",
  pattern = { "alpha", "dashboard", "lazy", "terminal" },
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.statuscolumn = ""
  end,
})

vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<leader>cl', '<cmd>terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<cmd>e #<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>ff', "<cmd>FzfLua files <CR>")
vim.keymap.set('n', '<leader>fg', "<cmd>FzfLua live_grep<CR>")
vim.keymap.set('n', '<leader>fb', "<cmd>FzfLua buffers<CR>")
vim.keymap.set('n', '<leader>fh', "<cmd>FzfLua helptags<CR>")

vim.keymap.set('n', '<leader>tt', MiniFiles.open, {})
vim.keymap.set('n', '<leader>tf', MiniFiles.close, {})

vim.api.nvim_set_keymap('n', '<leader>xx', ':FzfLua lsp_workspace_diagnostics<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>nm', ':NoiceDismiss<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>lg', ':LazyGit<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>o", "<cmd>Portal jumplist backward<cr>")
vim.keymap.set("n", "<leader>i", "<cmd>Portal jumplist forward<cr>")

vim.keymap.set('n', '<leader>cs', "<cmd>FzfLua lsp_code_actions<CR>", { desc = "LSP Code Actions" })
vim.keymap.set('n', '<leader>ws', "<cmd>FzfLua lsp_workspace_symbols<CR>", { desc = "LSP Workspace Symbols" })
vim.keymap.set('n', '<leader>wd', "<cmd>FzfLua lsp_workspace_diagnostics<CR>", { desc = "LSP Workspace Diagnostics" })

vim.keymap.set('n', '<leader>cp', '<cmd>CccPick<CR>', { desc = "Color picker" })

vim.keymap.set('n', '<leader>aa', '<cmd>AvanteAsk<CR>', { desc = "Ask ai" })

vim.keymap.set('n', '<leader>ae', '<cmd>AvanteEditCR>', { desc = "Edit with ai" })

vim.keymap.set('n', '<leader>ar', '<cmd>AvanteRefresh<CR>', { desc = "Refresh" })


vim.cmd([[
  au VimLeave * set guicursor=a:ver10-blinkwait800
]])
