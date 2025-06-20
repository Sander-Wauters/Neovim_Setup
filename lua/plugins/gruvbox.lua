return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local gruvbox = require("gruvbox")

		gruvbox.setup({
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = false,
				comments = false,
				operators = false,
				folds = false,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "soft", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		})

		vim.opt.termguicolors = true
		vim.cmd.colorscheme("gruvbox")
	end,
}
