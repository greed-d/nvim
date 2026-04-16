vim.pack.add({ "https://github.com/vyfor/cord.nvim" })

require("cord").setup({
	editor = {
		tooltip = "Neovim go brrr..",
	},
	display = {
		theme = "catppuccin",
		flavor = "dark",
		view = "full",
		swap_fields = false,
		swap_icons = false,
	},
})
