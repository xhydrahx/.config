vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%=%{v:relnum > 0 ? v:relnum : v:lnum} "

vim.g.mapleader = " "

vim.cmd([[
  augroup cmdheight
      autocmd!
      autocmd CmdlineEnter * setlocal cmdheight=0
      autocmd CmdlineLeave * setlocal cmdheight=0
    augroup END
]])

vim.keymap.set('n', '<leader>ff', "<cmd>FZF<CR>")
