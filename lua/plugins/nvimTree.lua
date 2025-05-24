return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = function()
    vim.g.loaded = 1
    vim.g.loaded_netrwPlugin = 1
    vim.keymap.set("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", { desc = "Toggle the file explorer" })
  end
}

-- local status, nvimTree = pcall(require, "nvim-tree")
-- if not status then
--     print("Failed loading nvim-tree")
-- end
-- 
-- vim.g.loaded = 1
-- vim.g.loaded_netrwPlugin = 1
-- 
-- nvimTree.setup()
-- 
-- vim.keymap.set("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", { desc = "Toggle the file explorer" })
