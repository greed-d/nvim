return {
	"rebelot/kanagawa.nvim",
	enabled = false,
	opts = {},
	priority = 1000,
	config = function()
		require("kanagawa").setup({
			theme = "lotus",
			compile = true,
		})
	end,
}
