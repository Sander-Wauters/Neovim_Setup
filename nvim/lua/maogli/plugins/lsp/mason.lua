local masonStatus, mason = pcall(require, "mason")
if not masonStatus then
    print("Error loading mason")
    return
end

local masonLspconfigStatus, masonLspconfig = pcall(require, "mason-lspconfig")
if not masonLspconfigStatus then
    print("Error loading mason-lspconfig")
    return
end

local masonNullLsStatus, masonNullLs = pcall(require, "mason-null-ls")
if not masonNullLsStatus then
    return
end

mason.setup()
masonLspconfig.setup({
    ensure_installed = {
        "clangd",
        "cssls",
        "html",
        "jdtls",
        "tsserver",
        "lua_ls",
        "cmake",
        "jedi_language_server",
    }
})
masonNullLs.setup({
    ensure_installed = {
        "eslint_d",
    }
})
