local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- dependencies
  "nvim-lua/plenary.nvim",

  -- file explorer
  "nvim-tree/nvim-tree.lua",

  -- fuzzy finding
  "nvim-telescope/telescope.nvim",

  -- autocompletion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",

  -- snippets
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",

  -- managing lsp servers and linters
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- configuring lsp servers
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "onsails/lspkind.nvim",
}

-- require("lazy").setup(plugins, {
--   rocks = {
--     enabled = false
--   }
-- })

require("lazy").setup(
  {
    plugins,
    { import = "plugins" },
    { import = "plugins.lsp" }
  },
  {
    rocks = {
      enabled = false
    }
  }
)
