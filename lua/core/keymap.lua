vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })

map("n", "J", "mzJ`z", { desc = "Prevent cursor from jumping when joining lines" })
map("n", "<C-u>", "<C-u>zz", { desc = "Move cursor up" })
map("n", "<C-d>", "<C-d>zz", { desc = "Move cursor down" })
map("n", "n", "nzzzv", { desc = "Center the screen on the cursor when jumping between searches" })
map("n", "N", "Nzzzv", { desc = "Center the screen on the cursor when jumping between searches" })

map("n", "<leader>tv", "<C-w>v:terminal<CR>", { desc = "Create a terminal in a vertical buffer" })
map("n", "<leader>th", "<C-w>s:terminal<CR>", { desc = "Create a terminal in a horizontal buffer" })
map("n", "<leader>tt", ":tabnew<CR>:terminal<CR>", { desc = "Create a terminal in a new tab" })
map("t", "<ESC>", "<C-\\><C-n>", { desc = "Exit to normal mode in terminal" })
