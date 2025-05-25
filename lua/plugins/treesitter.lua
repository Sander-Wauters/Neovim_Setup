return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	opts = {
		ensure_installed = {
			"python",
			"cpp",
			"css",
			"html",
			"java",
			"javascript",
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"hlsl",
			"cmake",
			"markdown",
			"glsl",
		},
		indent = {
			enable = true,
			disable = { "cpp" },
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	},
}
