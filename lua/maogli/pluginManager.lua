local ensurePacker = function()
    local fn = vim.fn
    local installPath = fn.stdpath("data")..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(installPath)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", installPath})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packerBootstrap = ensurePacker()

local status, packer = pcall(require, "packer")
if not status then
    print("Failed loading packer");
    return
end

return packer.startup(function(use)
    use ("wbthomason/packer.nvim")

    -- colorscheme
    use ("nvim-treesitter/nvim-treesitter")
    use ("ellisonleao/gruvbox.nvim")

    -- dependencies
    use ("nvim-lua/plenary.nvim")
    use ("nvim-tree/nvim-web-devicons")
    use ("lewis6991/gitsigns.nvim")

    -- file explorer
    use ("nvim-tree/nvim-tree.lua")

    -- fuzzy finding
    use ("nvim-telescope/telescope.nvim")

    -- auto pairing
    use ("windwp/nvim-autopairs")

    -- statusline
    use ("famiu/feline.nvim")

    -- autocompletion
    use ("hrsh7th/nvim-cmp")
    use ("hrsh7th/cmp-buffer")
    use ("hrsh7th/cmp-path")

    -- snippets
    use ("L3MON4D3/LuaSnip")
    use ("saadparwaiz1/cmp_luasnip")
    use ("rafamadriz/friendly-snippets")

    -- managing lsp servers and linters
    use ("williamboman/mason.nvim")
    use ("williamboman/mason-lspconfig.nvim")

    -- configuring lsp servers
    use ("neovim/nvim-lspconfig")
    use ("hrsh7th/cmp-nvim-lsp")
    use ("jose-elias-alvarez/typescript.nvim")
    use ("onsails/lspkind.nvim")

    -- linting
    use("jose-elias-alvarez/null-ls.nvim")
    use("jayp0521/mason-null-ls.nvim")

    if packerBootstrap then
        require("packer").sync()
    end
end)
