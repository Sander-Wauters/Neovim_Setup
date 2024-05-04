local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    print("Failed loading treesitter")
    return
end

treesitter.setup {
    ensure_installed = { 
        "python", "cpp", "css", "html", "java", 
        "javascript", "c", "lua", "vim", "vimdoc", 
        "query", "hlsl" , "cmake", "markdown", "glsl",
    },

    indent = {
        enable = true,
        disable = {"cpp"},
    },

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
