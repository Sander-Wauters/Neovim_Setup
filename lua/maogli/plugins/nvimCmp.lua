local cmpStatus, cmp = pcall(require, "cmp")
if not cmpStatus then
    print("Error loading cmp")
    return
end

local luasnipStatus, luasnip = pcall(require, "luasnip")
if not luasnipStatus then
    print("Error loading luasnip")
    return
end

local lspkindStatus, lspkind = pcall(require, "lspkind")
if not lspkindStatus then
    print("Error loading lspkind")
    return
end

-- load friendly-snippets
luasnip.filetype_extend("javascript", {"html"})
luasnip.filetype_extend("javascriptreact", {"html"})
luasnip.filetype_extend("typescriptreact", {"html"})
require("luasnip.loaders.from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    snippets = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-f>"] = cmp.mapping.scroll_docs(-4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({select = false})
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- lsp
        { name = "luasnip" }, -- snippets
        { name  = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
    }),
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
        }),
    },
})
