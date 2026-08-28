require("resonance").load({
	"https://github.com/stevearc/oil.nvim",
	keys = {
		{ "n", "-", "<cmd>Oil<CR>", { desc = "Open Oil" } },
	},
	config = function()
		require("oil").setup({
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
	end,
})
