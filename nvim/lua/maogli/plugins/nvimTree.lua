local status, nvimTree = pcall(require, "nvim-tree")
if not status then
    print("Failed loading nvim-tree")
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimTree.setup()

vim.keymap.set("n", "<leader>pt", ":NvimTreeToggle<CR>")
