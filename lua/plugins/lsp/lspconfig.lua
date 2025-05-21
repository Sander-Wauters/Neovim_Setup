local lspconfigStatus, lspconfig = pcall(require, "lspconfig")
if not lspconfigStatus then
    print("Error loading lspconfig")
    return
end

local cmpNvimLspStatus, cmpNvimLsp = pcall(require, "cmp_nvim_lsp")
if not cmpNvimLspStatus then
    print("Error loading cmp_nvim_lsp")
    return
end

local typescriptStatus, typescript = pcall(require, "typescript")
if not typescriptStatus then
    print("Error loading typescript")
    return
end

-- keybinds for available lsp server
local onAttach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    local map = vim.keymap.set

    map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
    map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Get code actions" })

    map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
    map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
    map("n", "gr", require("telescope.builtin").lsp_references, { desc = "Go to references" })
    map("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
end

-- used to enable autocompletion
local capabilities = cmpNvimLsp.default_capabilities()

-- cpp
lspconfig.clangd.setup {
    capabilities = capabilities,
    on_attach = onAttach,
}

-- css
lspconfig.cssls.setup {
    capabilities = capabilities,
    on_attach = onAttach,
}

-- html
lspconfig.html.setup {
    capabilities = capabilities,
    on_attach = onAttach,
}

-- java
lspconfig.jdtls.setup {
    capabilities = capabilities,
    on_attach = onAttach,
}

-- javascript && typescript
typescript.setup({
    server = {
        capabilities,
        on_attach = onAttach,
    }
})

-- lua
lspconfig.lua_ls.setup {
    capabilities = capabilities,
    on_attach = onAttach,
}

-- cmake
lspconfig.cmake.setup {
    capabilities = capabilities,
    on_attach = onAttach,
}

-- python
lspconfig.jedi_language_server.setup {
    capabilities = capabilities,
    on_attach = onAttach,
}

-- gradle
lspconfig.gradle_ls.setup {
    capabilities = capabilities,
    on_attach = onAttach,
}
