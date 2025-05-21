local nullLsStatus, nullLs = pcall(require, "null-ls")
if not nullLsStatus then
    return
end

-- local diagnostics = nullLs.builtins.diagnostics

-- nullLs.setup({
--     sources = {
--         diagnostics.eslint_d
--     }
-- })

