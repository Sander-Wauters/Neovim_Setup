return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		local oil = require("oil")

		oil.setup({
			view_options = {
				show_hidden = true,
			},
		})

		vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
	end,
}
