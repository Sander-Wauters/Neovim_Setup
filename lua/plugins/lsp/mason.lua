return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local masonLspconfig = require("mason-lspconfig")

		mason.setup()
		masonLspconfig.setup({
			ensure_installed = {
				"clangd",
				"cssls",
				"html",
				"jdtls",
				"ts_ls",
				"lua_ls",
				"cmake",
				"jedi_language_server",
			},
			automatic_installation = true,
		})
	end,
}
