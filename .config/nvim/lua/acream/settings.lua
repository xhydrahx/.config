vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%=%{v:relnum > 0 ? v:relnum : v:lnum} "

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>ff', "<cmd>FZF<CR>")
vim.keymap.set('n', '<leader>o', "<cmd>Oil<CR>")
