return {
	"zbirenbaum/neodim",
	enabled = false,
	event = "LspAttach",
	config = function()
		require("neodim").setup({
			alpha = 0.5,
			blend_color = nil,
			hide = {
				underline = true,
				virtual_text = true,
				signs = true,
			},
			regex = {
				"[uU]nused",
				"[nN]ever [rR]ead",
				"[nN]ot [rR]ead",
			},
			priority = 128,
			disable = {},
		})
	end,
}
