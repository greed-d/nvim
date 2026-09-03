vim.pack.add({ "gh:stevearc/oil.nvim" })

require("oil").setup({
	default_file_explorer = true,
	delete_to_trash = true,
	view_options = {
		show_hidden = true,
	},
	keymaps = {
		["<C-h>"] = false,
		["C-c"] = false,
		["q"] = { "actions.close", mode = "n" },
	},
})

map("n", "-", "<cmd>Oil<CR>", { desc = "Open Oil" })
