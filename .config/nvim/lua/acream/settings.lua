vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%=%{v:relnum > 0 ? v:relnum : v:lnum} "

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ff", function()
    Snacks.picker.files()
end)

vim.keymap.set("n", "<leader>fg", function ()
    Snacks.picker.grep()
end)

vim.keymap.set("n", "<leader>fr", function ()
    Snacks.picker.recent()
end)

vim.keymap.set("n", "<leader>e", function ()
    Snacks.explorer()
end)
