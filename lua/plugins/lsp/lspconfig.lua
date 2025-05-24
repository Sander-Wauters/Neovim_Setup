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

-- keybinds for available lsp server
local onAttach = function(client, bufnr)
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
lspconfig.ts_ls.setup {
    capabilities = capabilities,
    on_attach = onAttach,
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if
          path ~= vim.fn.stdpath('config')
          and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
        then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          -- Tell the language server which version of Lua you're using (most
          -- likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Tell the language server how to find Lua modules same way as Neovim
          -- (see `:h lua-module-load`)
          path = {
            'lua/?.lua',
            'lua/?/init.lua',
          },
        },
        -- Make the server aware of Neovim runtime files
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME
            -- Depending on the usage, you might want to add additional paths
            -- here.
            -- '${3rd}/luv/library'
            -- '${3rd}/busted/library'
          }
          -- Or pull in all of 'runtimepath'.
          -- NOTE: this is a lot slower and will cause issues when working on
          -- your own configuration.
          -- See https://github.com/neovim/nvim-lspconfig/issues/3189
          -- library = {
          --   vim.api.nvim_get_runtime_file('', true),
          -- }
        }
      })
    end,
    settings = {
      Lua = {}
    }
}

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
