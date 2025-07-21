vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.o.cmdheight = 0

vim.g.mapleader = " "

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>ff", "<CMD>FzfLua files<CR>", { desc = "File Fuzzy finder" })

vim.keymap.set("n", "<leader>t", function()
    vim.cmd("terminal")
end)
