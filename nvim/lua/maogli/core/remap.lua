vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>tv", "<C-w>v:terminal<CR>")
vim.keymap.set("n", "<leader>th", "<C-w>s:terminal<CR>")
vim.keymap.set("n", "<leader>tt", ":tabnew<CR>:terminal<CR>")
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
