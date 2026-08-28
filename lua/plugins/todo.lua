vim.pack.add({ "https://github.com/atiladefreitas/dooing" })

require("dooing").setup({
	ui = {
		style = "modern",
		tree_connectors = true,
		section_titles = {
			in_progress = "IN PROGRESS",
			pending = "PENDING",
			done = "DONE",
		},
	},
	window = {
		dimensions = {
			width = 85,
			height = 20,
		},
	},
	-- your custom config here (optional)
})

map("n", "<leader>td", "<cmd>Dooing<CR>")
